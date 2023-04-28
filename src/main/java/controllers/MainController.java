package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.MainDAO;
import dto.FreeBoardDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;

@WebServlet("*.maincontroller")
public class MainController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getRequestURI();
		MainDAO dao = MainDAO.getInstance();
		Gson g = new Gson();
		try {
		if (cmd.equals("/study.maincontroller")) {

		
		} else if (cmd.equals("/allsearch.maincontroller")) {
			String select = request.getParameter("select");
			String title = request.getParameter("title");
			
			List<SecondHandDTO> sdto = dao.joongosearch(select, title);
			List<StudyBoardDTO> stdto = dao.studysearch(select, title);
			List<FreeBoardDTO> fdto = dao.boardsearch(select, title);
			request.setAttribute("sdto", sdto);
			request.setAttribute("stdto", stdto);
			request.setAttribute("fdto", fdto);
			request.getRequestDispatcher("/board/allSearch.jsp").forward(request, response);
		}else if (cmd.equals("/mainjoongolist.maincontroller")) {
			List<SecondHandDTO> dto = dao.mainjoongo();
			int currentPage = request.getParameter("currentPage") == null ? 1 
					: Integer.parseInt(request.getParameter("currentPage"));
			String sdto = g.toJson(dto);
			String page = g.toJson(currentPage);
			JsonObject resp = new JsonObject();
			resp.addProperty("sdto", sdto);
			resp.addProperty("page", page);
			response.getWriter().append(resp.toString());
			
		} else if (cmd.equals("/joongo.maincontroller")) {

		} else if (cmd.equals("/board.maincontroller")) {

		} else if (cmd.equals("/licence.maincontroller")) {
		}
		}catch(Exception e) {
			e.printStackTrace();
//			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
