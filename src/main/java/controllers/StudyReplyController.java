package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudyReplyDAO;
import dto.StudyReplyDTO;

@WebServlet("*.studyreply")
public class StudyReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		try {
			StudyReplyDAO dao = StudyReplyDAO.getInstance();
			if(cmd.equals("/insert.studyreply")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int parent_seq = Integer.parseInt(request.getParameter("parent_seq"));
//				String writer = request.getParameter("studyreplywriter");
				String contents = request.getParameter("studyreplycontents");
				dao.insertreply(new StudyReplyDTO(0,"213",contents,null,parent_seq));
				response.sendRedirect("/inner.studyboard?cpage="+currentPage+"&seq="+parent_seq);
			}else if(cmd.equals("/delete.studyreply")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int parent_seq = Integer.parseInt(request.getParameter("parent_seq"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deletereply(seq);
				response.sendRedirect("/inner.studyboard?cpage="+currentPage+"&seq="+parent_seq);
			}else if(cmd.equals("/update.studyreply")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String contents = request.getParameter("contents");
				int result = dao.updatereply(seq, contents);
				response.getWriter().append((char)result);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
