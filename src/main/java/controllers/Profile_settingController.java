package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Profile_settingDAO;
import dto.Profile_settingDTO;

@WebServlet("*.profile_settingController")
public class Profile_settingController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String cmd = request.getRequestURI();
		Profile_settingDAO dao = Profile_settingDAO.getInstance();
			
		try {
			if (cmd.equals("/select.profile_settingController")) {
				String loginId = (String) request.getSession().getAttribute("loggedId");
				response.sendRedirect("/profile_setting/profileForm.jsp");
			
			}else if (cmd.equals("/update.profile_settingController")) {
				System.out.println("¿©±â11");
				String loginId = (String) request.getSession().getAttribute("loggedId");
				String nickname = request.getParameter("nickname");
				String introduce = request.getParameter("introduceMyslef");
				String instargram = request.getParameter("instargram");
				String facebook = request.getParameter("facebook");
				String url = request.getParameter("url");
				dao.update(new Profile_settingDTO(loginId,nickname,introduce,instargram,facebook,url));
				response.sendRedirect("/select.Profile_settingController");
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
