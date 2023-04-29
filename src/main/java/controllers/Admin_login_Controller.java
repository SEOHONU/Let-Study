package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_DAO;
import dto.Admin_DTO;

@WebServlet("*.admin")
public class Admin_login_Controller extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		
		try {
			if(cmd.equals("/admin_login.admin")){
				String id = request.getParameter("admin_id");
				System.out.println("id : "+ id);
				String pw = request.getParameter("admin_pw");
				System.out.println("pw : "+ pw);
				boolean result  = Admin_DAO.getInstance().isAdmin(id, pw);
				
				Admin_DAO dao = new Admin_DAO();
				System.out.println(result);
				if(result) {
					request.getSession().setAttribute("admin_id", id);
					request.setAttribute("list", result);
					
					
//					response.sendRedirect("/admin_mainboard.admin_main");
				request.getRequestDispatcher("/admin_mainboard.admin_main").forward(request, response);
				}else {
					response.sendRedirect("www.naver.com");
				}
				
			}else if(cmd.equals("/admin_logout.admin")) {
				System.out.println("로그아웃 실행");
					request.getSession().invalidate();
					response.sendRedirect("/index.jsp");
			}
//		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
