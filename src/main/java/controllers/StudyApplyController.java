package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.StudyBoardMembersDAO;
import dto.StudyBoardMembersDTO;

@WebServlet("*.studyapply")
public class StudyApplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		try {
			Gson g = new Gson();
			StudyBoardMembersDAO dao = StudyBoardMembersDAO.getInstance();
			if(cmd.equals("/insert.studyapply")) {
				int seq = Integer.parseInt(request.getParameter("board_seq"));
				String id = request.getParameter("id");
				int result = dao.insertapply(new StudyBoardMembersDTO(id, seq, null));
				String gresult = g.toJson(result);
				response.getWriter().append(gresult);
			}else if(cmd.equals("/delete.studyapply")) {
				int seq = Integer.parseInt(request.getParameter("board_seq"));
				String id = request.getParameter("id");
				int result = dao.deleteapply(new StudyBoardMembersDTO(id, seq, null));
				String gresult = g.toJson(result);
				response.getWriter().append(gresult);
			}else if(cmd.equals("/update.studyapply")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("board_seq"));
				String id = request.getParameter("id");
				int result = dao.updateapply(new StudyBoardMembersDTO(id, seq, null));
				String gresult = g.toJson(result);
				response.getWriter().append(gresult);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
