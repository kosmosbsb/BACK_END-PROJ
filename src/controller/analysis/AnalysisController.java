package controller.analysis;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.analysis.AnalysisDAO;
import model.analysis.AnalysisDTO;
import model.analysis.ExcelOuter;

public class AnalysisController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AnalysisDAO dao = new AnalysisDAO(req.getServletContext());
		
		int[] barChartResult_month = dao.getBarChartResult_month();
		int[] barChartResult_age = dao.getBarChartResult_age();
		int[] pieChartResult_gender = dao.getPieChartResult_gender();
		
		
		req.setAttribute("barChartResult_month", barChartResult_month);
		req.setAttribute("barChartResult_age", barChartResult_age);
		req.setAttribute("pieChartResult_gender", pieChartResult_gender);
		dao.close();
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/analysis/reserve/ReserveAnal.jsp");
		dispatcher.forward(req, resp);
	}
	
}
