package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentsDAO;
import dto.CommentsDTO;

@WebServlet("*.comments")
public class CommentsController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		CommentsDAO cmDAO = CommentsDAO.getInstance();
		String cmd = request.getRequestURI();
		try {
			if(cmd.equals("/insertComments.comments")) {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int board_seq = Integer.parseInt(request.getParameter("seq"));
				String writer = request.getParameter("writer");
				String contents = request.getParameter("contents");
				CommentsDTO dto = new CommentsDTO(0, writer, contents, null, board_seq, 0);
				int result = cmDAO.insertComments(dto);
				response.sendRedirect("/shBoardContents.sh?currentPage="+currentPage+"&seq="+board_seq);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
