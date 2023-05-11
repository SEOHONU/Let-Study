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
				System.out.println(loginId);
				Profile_settingDTO result = dao.select(loginId);
				request.setAttribute("select", result);
				request.getRequestDispatcher("/pofile_setting/profileForm.jsp").forward(request, response);
				
			}else if (cmd.equals("/update.profile_settingController")) {
				String loginId = request.getParameter("id");
				String nickname = request.getParameter("nickname");
				String introduce = request.getParameter("introduceMyslef2");
				String instagram = request.getParameter("instagram");
				if(instagram =="") {
					instagram = "www.instagram/";
				}
				String facebook = request.getParameter("facebook");
				if(facebook =="") {
					facebook = "www.facebook/";
				}
				String url = request.getParameter("url");
				request.getSession().setAttribute("loggedNickname", nickname);
				int result = dao.update(new Profile_settingDTO(loginId,nickname,introduce,instagram,facebook,url));
				response.sendRedirect("/mypageboard.mypageboardController");
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