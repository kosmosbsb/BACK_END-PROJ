package controller.psh;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.analysis.AnalysisDAO;

public class ProcessingController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		QuestionDAO dao = new QuestionDAO(req.getServletContext());
		
		int[] lineChartUser_month = dao.getlineChartUser_month();
		int[] lineChartHost_month = dao.getlineChartHost_month();
		int[] pieChartResult_type = dao.getPieChartResult_type();
		
		
		req.setAttribute("lineChartUser_month", lineChartUser_month);
		req.setAttribute("lineChartHost_month", lineChartHost_month);
		req.setAttribute("pieChartResult_type", pieChartResult_type);
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/question/history/History.jsp");
		dispatcher.forward(req, resp);
	}
}
