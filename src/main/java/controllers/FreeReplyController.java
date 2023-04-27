package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeReplyDAO;

@WebServlet("*.reply")
public class FreeReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String cmd=request.getRequestURI();
			request.setCharacterEncoding("utf8");
			response.setContentType("text/html; charset=utf8");

			try {
			
				if(cmd.equals("/insert.reply")){
					String writer = "아이디";
					request.setAttribute("writer", writer);
					
					
					int boardSeq = Integer.parseInt(request.getParameter("seq"));
					String replyContent = request.getParameter("replyContent");
					FreeReplyDAO dao = FreeReplyDAO.getInstance();
					System.out.println("작성자 아이디 : " + writer);
					System.out.println("게시판 seq : " + boardSeq);
					System.out.println("댓글 : " + replyContent);
					dao.insertReply(writer, replyContent, boardSeq);
					// 주의하기!!
					response.sendRedirect("/detail.freeBoard?seq="+boardSeq);

				}


			}catch(Exception e) {
				e.printStackTrace();
				//response.sendRedirect("error.html");
			}
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
