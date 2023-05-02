package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Profile_settingDAO;
import dto.MembersDTO;
import dto.Profile_settingDTO;

@WebServlet("*.profile_settingController")
public class Profile_settingController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		

		String cmd = request.getRequestURI();
		Profile_settingDAO dao = Profile_settingDAO.getInstance();
			
		try {
			if (cmd.equals("/select.profile_settingController")) {
				String loginId = (String) request.getSession().getAttribute("loggedID");
				Profile_settingDTO result = dao.select(loginId);
				System.out.println("셀렉트");
				
				request.setAttribute("select", result);
				response.sendRedirect("/pofile_setting/profileForm.jsp");
			
				
			}else if (cmd.equals("/update.profile_settingController")) {

				String loginId = request.getParameter("id");

				String nickname = request.getParameter("nickname");
				String introduce = request.getParameter("introduceMyslef2");
				String instargram = request.getParameter("instargram");
				String facebook = request.getParameter("facebook");
				String url = request.getParameter("url");
				System.out.println("업데이트");
				int result = dao.update(new Profile_settingDTO(loginId,nickname,introduce,instargram,facebook,url));
				request.setAttribute("update", result);
				
				request.getRequestDispatcher("/select.profile_settingController").forward(request, response);
			}
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			//response.sendRedirect("/error.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
