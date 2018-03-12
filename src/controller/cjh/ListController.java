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
	//페이징을 위한 로직 끝]	
	List<DataRoomDTO> list = dao.selectList();
	dao.close();
	
	
	//라]결과값이 있으면 리퀘스트 영역에 저장
	// 페이지용 문자열 생성]
	req.setAttribute("list", list);//글목록들
	//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
	//뷰선택]
	RequestDispatcher dispatcher=req.getRequestDispatcher("/member/normal/NormalManage.jsp");
	//포워딩]
	dispatcher.forward(req, resp);
	
	}
}
