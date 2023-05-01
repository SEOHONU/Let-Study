package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.MembersDAO;
import dto.MembersDTO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI(); 
		Gson g = new Gson();
		MembersDAO dao = MembersDAO.getInstance();

		try {
			if(cmd.equals("/idCheck.member")) {

				String id = request.getParameter("id"); 
				boolean result = dao.isIdExist(id);
				String resp = g.toJson(result); 
				response.getWriter().append(resp); 



			}else if(cmd.equals("/login.member")) {

				String id = request.getParameter("id"); 
				String pw = request.getParameter("pw"); 
				boolean result = MembersDAO.getInstance().isMember(id, pw); 
				if(result) {
					request.getSession().setAttribute("loggedID", id); 
					String nickname = MembersDAO.getInstance().getNickname(id); 
					request.getSession().setAttribute("nickname", nickname); 
				}
				// 닉네임 세션에 가져옴 
				response.sendRedirect("/");
				//         로그인 성공하면 들어갈 페이지 입력해야함 
			}else if(cmd.equals("/joinMember.member")) {

				String id = request.getParameter("id"); 
				String pw = request.getParameter("pw"); 
				String name = request.getParameter("name"); 
				//         생년월일 값 받아야함 
				String birthYear = request.getParameter("birthYear"); 
				String birthMonth = request.getParameter("birthMonth"); 
				String birthDay = request.getParameter("birthDay"); 
				//생년월일 값 받음 
				String nickname = request.getParameter("nickname");
				String contact = request.getParameter("contact"); 
				String email = request.getParameter("email"); 
				String zipcode = request.getParameter("zipcode"); 
				String roadAddress = request.getParameter("roadAddress");
				String detailAddress = request.getParameter("detailAddress"); 

				// 회원가입일자 받는 법 몰라서 null로 받음 
				MembersDTO dto = new MembersDTO
						(id, pw, name, birthYear+""+birthMonth+""+birthDay, nickname, contact, email, zipcode, roadAddress, detailAddress, null);
				int result = dao.insertAll(dto); 
				// 회원가입하면 나타날 페이지 써야함 
				response.sendRedirect("/"); 
			}else if (cmd.equals("/logout.member")) {
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");
			} else if (cmd.equals("/myInfoSelect.member")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				MembersDTO dto = dao.myInfoSelect(id);
				request.setAttribute("myInfo", dto);
				request.getRequestDispatcher("/member/memberInfo.jsp").forward(request, response);

				// update 회원정보수정 
			} else if (cmd.equals("/update.member")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String birth_date = request.getParameter("birth_date");
				String nickname = request.getParameter("nickname");
				String contact = request.getParameter("contact");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String roadAddress = request.getParameter("roadAddress");
				String detailAddress = request.getParameter("detailAddress");
				MembersDTO dto = new MembersDTO(id, pw, name, birth_date, nickname, contact, email, zipcode, roadAddress, detailAddress, null);
				dao.update(dto);
				response.sendRedirect("/myPage/mypageMainForm.jsp");
				// delete 회원탈퇴
			} else if (cmd.equals("/memberOut.member")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				dao.memberOut(id);
				response.sendRedirect("/index.jsp");
			} 
		}catch (Exception e) {
			e.printStackTrace(); 
			response.sendRedirect("/error.jsp"); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}