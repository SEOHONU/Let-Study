package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MembersDAO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI(); 
		
		
		try {
		if(cmd.equals("/idCheck.member")) {
			
			String id = request.getParameter("id"); 
			MembersDAO dao = MembersDAO.getInstacne();
			boolean result = dao.isIdExist(id);
			
			request.setAttribute("checkedId", result); 
			request.getRequestDispatcher("/member/idCheckForm.jsp").forward(request, response);
			
			
		}else if(cmd.equals("/login.member")) {
			
			String id = request.getParameter("id"); 
			String pw = request.getParameter("pw"); 
			boolean result = MembersDAO.getInstacne().isMember(id, pw); 
			if(result) {
				request.getSession().setAttribute("loggedID", id); 
			}
			response.sendRedirect("");
//			로그인 성공하면 들어갈 페이지 입력해야함 
		}else if(cmd.equals("/joinMember.member")) {
			
			String id = request.getParameter("id"); 
			String pw = request.getParameter("pw"); 
			String name = request.getParameter("name"); 
//			생년월일 값 받기
			String nickname = request.getParameter("nickname");
			String contact = request.getParameter("contact"); 
			String email = request.getParameter("email"); 
			String zipcode = request.getParameter("zipcode"); 
			String roadAddress = request.getParameter("roadAddress");
			String detailAddress = request.getParameter("detailAddress"); 
			
		}
	
	
	
		}catch (Exception e) {
			e.printStackTrace(); 
			response.sendRedirect("/error.jsp"); 
		}
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
