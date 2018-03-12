package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BbsDAO;
import model.MemberDTO;
import model.PagingUtil;

public class PsyController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget으로 들어오는데 성공함");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("dopost로 들어오는데 성공함");
		doGet(req, resp);
		//폼을 쓰지 않기때문에 여기로 들어올 일은 없다. 만약에 이상한 일이 일어나서 포스트방식으로 들어온다면 바로 doGet으로 인도함.
	}
	
}
