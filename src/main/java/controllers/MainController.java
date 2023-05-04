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
import dao.StudyBoardDAO;
import dto.FreeBoardDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;
import statics.Settings;

@WebServlet("*.maincontroller")
public class MainController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		MainDAO dao = MainDAO.getInstance();
		StudyBoardDAO dao1 = StudyBoardDAO.getInstance();
		Gson g = new Gson();
		try {
		if (cmd.equals("/study.maincontroller")) {

		
		} else if (cmd.equals("/allsearch.maincontroller")) {
			String select = request.getParameter("select");
			String title = request.getParameter("title");
			
			
			int currentPage = request.getParameter("cpage") == null ? 1 
					: Integer.parseInt(request.getParameter("cpage"));
			if(currentPage < 0) {
				currentPage = 1;
			}else if(currentPage > (int)Math.ceil(dao1.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
				currentPage = (int)Math.ceil(dao1.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE);
			}
			int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
			int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
			
			List<SecondHandDTO> sdto = dao.joongosearch(select, title);
			List<StudyBoardDTO> stdto = dao.studysearch(select, title);
			List<FreeBoardDTO> fdto = dao.boardsearch(select, title);
			
			
			
			request.setAttribute("sdto", sdto);
			request.setAttribute("stdto", stdto);
			request.setAttribute("fdto", fdto);
			request.setAttribute("select", select);
			request.setAttribute("title", title);
			request.setAttribute("cpage", currentPage);
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
