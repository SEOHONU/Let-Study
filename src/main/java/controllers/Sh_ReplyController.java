package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Sh_ReplyDAO;
import dto.Sh_CommentsDTO;

@WebServlet("*.shReply")
public class Sh_ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		String cmd = request.getRequestURI();
		Sh_ReplyDAO reDAO = Sh_ReplyDAO.getInstance();
		try {
			if(cmd.equals("/insertReply.shReply")) {
				String com_writer = (String)request.getSession().getAttribute("loggedId");
				String contents = request.getParameter("contents");
				int com_seq = Integer.parseInt(request.getParameter("com_seq"));
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int board_seq = Integer.parseInt(request.getParameter("board_seq"));
				Sh_CommentsDTO dto = new Sh_CommentsDTO();
				dto.setCom_writer(com_writer);
				dto.setCom_contents(contents);
				dto.setBoard_seq(board_seq);
				dto.setParent_seq(com_seq);
				int result = reDAO.insertReply(dto);
				response.sendRedirect("/secondHandBoardContents.secondHand?currentPage="+currentPage+"&seq="+board_seq);
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
