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
			FreeReplyDAO dao = FreeReplyDAO.getInstance();
			String writer = (String)request.getSession().getAttribute("loggedID");
			String nickname = (String)request.getSession().getAttribute("loggedNickname");
			
			
			try {
				if(cmd.equals("/insert.reply")){
					request.setAttribute("writer", writer);
					int boardSeq = Integer.parseInt(request.getParameter("seq"));
					String replyContent = request.getParameter("replyContent");
					dao.insertReply(writer, replyContent, boardSeq);
					// 주의하기!!
					response.sendRedirect("/detail.freeBoard?seq="+boardSeq);

				}else if(cmd.equals("/update.reply")){
					int board_seq = Integer.parseInt(request.getParameter("seq"));
					int reply_seq = Integer.parseInt(request.getParameter("replySeq"));
					String reply_content = (String)request.getParameter("replyContent");
					System.out.println("게시글: "+ board_seq + "댓글 : "+reply_seq + "내용:"+reply_content);
					dao.updateReply(reply_content, reply_seq);
					
					response.sendRedirect("/detail.freeBoard?seq="+board_seq);
				}else if(cmd.equals("/delete.reply")) {
					int board_seq = Integer.parseInt(request.getParameter("seq"));
					int reply_seq = Integer.parseInt(request.getParameter("replySeq"));
					int result = dao.deleteBySeq(reply_seq);
					response.sendRedirect("/detail.freeBoard?seq="+board_seq);
				}else if(cmd.equals("/insertReReply.reply")) {
					int reply_seq =  Integer.parseInt(request.getParameter("reply_seq"));
					String re_replyContent = (String)request.getParameter("re_replyContent");
					int result = dao.insertReReply(writer, re_replyContent,reply_seq ); 
					if(result==1) {
						System.out.println("업로드 성공");
					}
				
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
