package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.maincontroller")
public class MainController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getRequestURI();
		if(cmd.equals("/study.maincontroller")) {
			
		}else if(cmd.equals("/joongo.maincontroller")) {
			
		}else if(cmd.equals("/board.maincontroller")) {
			
		}else if(cmd.equals("/licence.maincontroller")) {
			
		}else if(cmd.equals("/allsearch.maincontroller")) {
			String select = request.getParameter("select");
			String title = request.getParameter("title");
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
