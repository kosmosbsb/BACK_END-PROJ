package controller.psh;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProcessingController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// 뷰선택]
		RequestDispatcher dispatcher = req.getRequestDispatcher("/question/history/History.jsp");
		// 포워딩]
		dispatcher.forward(req, resp);
	}
}
