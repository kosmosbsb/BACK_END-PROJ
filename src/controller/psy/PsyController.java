package controller.psy;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PsyController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("id")==null) {doPost(req,resp);}
		else {
			//System.out.println(req.getParameter("id"));
			//System.out.println("겟방식으로 들어옴");
			String id = req.getParameter("id");
			//다오 가져오고
			PsyDAO dao = new PsyDAO(req.getServletContext());
			List<PsyDTO> list=dao.selectOne(id);
			
			dao.close();
			req.setAttribute("imgurl",list.get(0).getImg());
			req.setAttribute("hid",list.get(0).getId());
			req.setAttribute("hnick",list.get(0).getH_nickname());
			req.setAttribute("mail",list.get(0).getMail());
			req.setAttribute("introduce",list.get(0).getIntroduce().replace("\r\n","<br/>"));
			req.setAttribute("alarmMail",list.get(0).getH_alarm_mail());
			req.setAttribute("alarmSns",list.get(0).getH_alarm_sns());
			req.setAttribute("gender",list.get(0).getGender());
			req.setAttribute("age",list.get(0).getAge());
			req.setAttribute("phone",list.get(0).getPhone());
			
			req.getRequestDispatcher("/member/host/HostManageView.jsp").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("dopost로 들어오는데 성공함");
		//System.out.println(req.getParameter("id"));
		if(req.getParameter("id")!=null) {doGet(req,resp);}
		//System.out.println("doget으로 들어오는데 성공함");
		PsyDAO dao = new PsyDAO(req.getServletContext());
		int totalRecordCount = dao.getTotalRecordCount();
		List<PsyDTO> list=dao.selectList();
		int[] chartDatAr =dao.chartDataArray();
		int[] chartDatAr3 =dao.chartDataArray3();
		int[] chartDatAr2 =dao.chartDataArray2();
		//int[] chartDatAr = {120,50,80,40,33,30};
		dao.close();
		req.setAttribute("chartdataset", chartDatAr);
		req.setAttribute("chartdataset3", chartDatAr3);
		req.setAttribute("chartdataset2", chartDatAr2);
		req.setAttribute("list", list);
		
		
		req.setAttribute("totalRecordCount", totalRecordCount);
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/member/host/HostManage.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}
	
}
