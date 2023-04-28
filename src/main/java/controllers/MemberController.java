package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.EncryptionUtils;
import dao.MembersDAO;
import dto.MembersDTO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html;charset=UTF-8");
	      response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		MembersDAO dao = MembersDAO.getInstacne();

		try {
			// �α��� 
			if (cmd.equals("/login.member")) {
				System.out.println("�α���");
				String id = request.getParameter("id");
				String pw = EncryptionUtils.sha512(request.getParameter("pw"));
				System.out.println(id + ":" + pw);
				boolean result = dao.isMember(id, pw);
				if (result) {
					request.getSession().setAttribute("loggedID", id);
				}
				response.sendRedirect("/index.jsp");
				
				
			// �α׾ƿ� 
			} else if (cmd.equals("/logout.member")) {
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");

			// ȸ������ 
			} else if (cmd.equals("/idCheck.member")) {
				String id = request.getParameter("id");
				boolean result = dao.isIdExist(id);
				request.setAttribute("checkedId", result);
				request.getRequestDispatcher("/member/idCheckForm.jsp").forward(request, response);
			} else if (cmd.equals("/joinMember.member")) {
				String id = request.getParameter("id");
				String pw = EncryptionUtils.sha512(request.getParameter("pw"));
				String name = request.getParameter("name");

				String birthYear = request.getParameter("birthYear");
				String birthMonth = request.getParameter("birthMonth");
				String birthDay = request.getParameter("birthDay");
				String birth_date = birthYear + birthMonth + birthDay;

				String nickname = request.getParameter("nickname");
				String contact = request.getParameter("contact");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String roadAddress = request.getParameter("roadAddress");
				String detailAddress = request.getParameter("detailAddress");
				MembersDTO dto = new MembersDTO(id, pw, name, birth_date, nickname, contact, email, zipcode,
						roadAddress, detailAddress, null, null);
				dao.insert(dto);
				response.sendRedirect("/member/loginForm.jsp");
				

				// ȸ��������� 
			} else if (cmd.equals("/myInfoSelect.member")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				MembersDTO dto = dao.myInfoSelect(id);
				request.setAttribute("myInfo", dto);
				request.getRequestDispatcher("/member/memberInfo.jsp").forward(request, response);

				// ȸ���������� 
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
				MembersDTO dto = new MembersDTO(id, pw, name, birth_date, nickname, contact, email, zipcode, roadAddress, detailAddress, null, null);
				dao.update(dto);
				response.sendRedirect("/");
				//////// ��������������

				// ȸ��Ż�� 
			} else if (cmd.equals("/memberOut.member")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				dao.memberOut(id);
				response.sendRedirect("/index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			// response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		
	}
}
