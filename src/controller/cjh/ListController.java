package controller.cjh;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import controller.cjh.DataRoomDAO;
import controller.cjh.DataRoomDTO;

public class ListController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("id")!=null) {doGet(req,resp);}
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		//전체 레코드 수
		int totalRecordCount = dao.getTotalRecordCount();
		List<DataRoomDTO> list = dao.selectList();
		int[] ageDataArray = dao.ageDataArray();
		String[] genderDataArray = dao.genderDataArray();
		String[] gradeDataArray = dao.gradeDataArray();
		dao.close();
		
		
		//라]결과값이 있으면 리퀘스트 영역에 저장
		req.setAttribute("totalRecordCount", totalRecordCount);
		// 페이지용 문자열 생성]
		req.setAttribute("list", list);//글목록들
		req.setAttribute("agedatearray", ageDataArray);
		req.setAttribute("genderdataarray", genderDataArray);
		req.setAttribute("gradedataarray", gradeDataArray);
		//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
		//뷰선택]
		RequestDispatcher dispatcher=req.getRequestDispatcher("/member/normal/NormalManage.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("id")==null) {doPost(req,resp);}
		else {
			String id = req.getParameter("id");
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			List<DataRoomDTO> list = dao.selectOne(id);
			dao.close();
			String age = list.get(0).getAge();
			int index = age.indexOf("-");
			age = age.substring(0,index);
			
			req.setAttribute("id",list.get(0).getId());
			req.setAttribute("imgurl",list.get(0).getImg());
			req.setAttribute("nickname",list.get(0).getN_nickname());
			req.setAttribute("name",list.get(0).getName());
			req.setAttribute("mail",list.get(0).getMail());
			req.setAttribute("gender",list.get(0).getGender());
			req.setAttribute("age",age);
			req.setAttribute("phone",list.get(0).getPhone());
			req.setAttribute("n_alarm_sms",list.get(0).getN_alarm_sms());
			req.setAttribute("n_alarm_mail",list.get(0).getN_alarm_mail());
			req.setAttribute("grade",list.get(0).getGrade());
			req.setAttribute("credit",list.get(0).getCredit());
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("/member/normal/NormalManageView.jsp");
			dispatcher.forward(req, resp);
			
		}
	
	}
}
