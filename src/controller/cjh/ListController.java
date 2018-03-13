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
		super.doPost(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
	//페이징을 위한 로직 시작]
	//전체 레코드 수
	int totalRecordCount = dao.getTotalRecordCount();
	//페이지 사이즈
	int pageSize=Integer.valueOf(this.getInitParameter("PAGESIZE"));
	//블락페이지
	int blockPage=Integer.valueOf(getInitParameter("BLOCKPAGE"));
	//전체 페이지수]
	int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
	//현재 페이지를 파라미터로 받기]
	int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
	//시작 및 끝 ROWNUM구하기]
	int start= (nowPage-1)*pageSize +1;
	int end  = nowPage*pageSize;
	//페이징을 위한 로직 끝]	
	//페이징을 위한 로직 끝]	
	List<DataRoomDTO> list = dao.selectList(start,end);
	int[] ageDataArray = dao.ageDataArray();
	String[] genderDataArray = dao.genderDataArray();
	String[] gradeDataArray = dao.gradeDataArray();
	// int[] chartDatAr =dao.chartDataArray();
	dao.close();
	
	
	//라]결과값이 있으면 리퀘스트 영역에 저장
	String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/member/normal/NormalManage.do?");
	req.setAttribute("pagingString", pagingString); // 페이징 문자열
	req.setAttribute("totalRecordCount", totalRecordCount);
	req.setAttribute("nowPage", nowPage);
	req.setAttribute("pageSize", pageSize);
	// 페이지용 문자열 생성]
	req.setAttribute("list", list);//글목록들
	//req.setAttribute("chartdataset", chartDatAr);
	req.setAttribute("agedatearray", ageDataArray);
	req.setAttribute("genderdataarray", genderDataArray);
	req.setAttribute("gradedataarray", gradeDataArray);
	//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
	//뷰선택]
	RequestDispatcher dispatcher=req.getRequestDispatcher("/member/normal/NormalManage.jsp");
	//포워딩]
	dispatcher.forward(req, resp);
	
	}
}
