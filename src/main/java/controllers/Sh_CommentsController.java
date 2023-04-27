package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.EncryptionUtils;
import dao.Sh_CommentsDAO;
import dto.Sh_CommentsDTO;

@WebServlet("*.shComments")
public class Sh_CommentsController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		Sh_CommentsDAO cmDAO = Sh_CommentsDAO.getInstance();
		String cmd = request.getRequestURI();
		try {
			if(cmd.equals("/insertComments.shComments")) {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int board_seq = Integer.parseInt(request.getParameter("seq"));
				String writer = request.getParameter("writer");
				String contents = request.getParameter("contents");
				writer = EncryptionUtils.AntiXSS(writer);
				contents = EncryptionUtils.AntiXSS(contents);
				Sh_CommentsDTO dto = new Sh_CommentsDTO(0, writer, contents, null, board_seq, 0);
				int result = cmDAO.insertComments(dto);
				response.sendRedirect("/secondHandBoardContents.secondHand?currentPage="+currentPage+"&seq="+board_seq);
			}
			else if(cmd.equals("/deleteComments.shComments")){
				int com_seq = Integer.parseInt(request.getParameter("com_seq"));
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int board_seq = Integer.parseInt(request.getParameter("board_seq"));
				int result = cmDAO.deleteComments(com_seq);
				response.sendRedirect("/secondHandBoardContents.secondHand?currentPage="+currentPage+"&seq="+board_seq);
			}
			else if(cmd.equals("/modifyComments.shComments")) {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int board_seq = Integer.parseInt(request.getParameter("board_seq"));
				int com_seq = Integer.parseInt(request.getParameter("com_seq"));
				String com_contents = request.getParameter("contents");
				int result = cmDAO.updateComments(com_seq, com_contents);
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
