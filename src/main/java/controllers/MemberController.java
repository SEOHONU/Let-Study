package controllers;

import java.io.IOException;
import java.sql.Timestamp;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		Gson g = new Gson();
		MembersDAO dao = MembersDAO.getInstance();

		try {
			if (cmd.equals("/idCheck.member")) {

				String id = request.getParameter("id");
				boolean result = dao.isIdExist(id);
				String resp = g.toJson(result);
				response.getWriter().append(resp);

			} else if (cmd.equals("/login.member")) {

				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				boolean result = MembersDAO.getInstance().isMember(id, pw);
				if (result) {
					// 로그인 성공시 ajax로 아이디 및 비번 전송
					request.getSession().setAttribute("loggedID", id);
					System.out.println("아이디 세션에 가져오기 성공");
					// 닉네임 세션에 가져옴
					String nickname = MembersDAO.getInstance().getNickname(id);
					request.getSession().setAttribute("loggedNickname", nickname);
					System.out.println("닉네임 세션에 가져오기 성공");
					String resp = g.toJson(result);

					response.getWriter().append(resp);
					// 로그인 실패시 ajax로 아이디 및 비번 확인 문구 전송
				} else {
					String resp = g.toJson(result);
					System.out.println(result);
					response.getWriter().append(resp);
				}

			} else if (cmd.equals("/joinMember.member")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				// 생년월일 값 받아야함
				String birthYear = request.getParameter("birthYear");
				String birthMonth = request.getParameter("birthMonth");
				int birthDay = Integer.parseInt(request.getParameter("birthDay"));
				String birthDayStr = String.format("%02d", birthDay);
				System.out.println("회원가입 날짜 두자리수 입력 결과 :"+birthDayStr);
				// 두자리가 아니면 앞에 0이 붙게함
				// 생년월일 값 받음

				String nickname = request.getParameter("nickname");
				String contact = request.getParameter("contact");
				String email = request.getParameter("email");
				String zipcode = request.getParameter("zipcode");
				String roadAddress = request.getParameter("roadAddress");
				String detailAddress = request.getParameter("detailAddress");
				Timestamp join_date = new Timestamp(System.currentTimeMillis());
				// 회원가입일자 현재 시간으로 받음
				MembersDTO dto = new MembersDTO(id, pw, name, birthYear + "" + birthMonth + "" + birthDayStr, nickname,
						contact, email, zipcode, roadAddress, detailAddress, join_date);
				int result = dao.insertAll(dto);
				// 회원가입하면 나타날 페이지 일단 메인페이지로 씀
				response.sendRedirect("/index.jsp");
				// 회원가입하면 나타날 페이지 써야함
			} else if (cmd.equals("/logout.member")) {
				request.getSession().invalidate();
				response.sendRedirect("/index.jsp");
// 아이디 찾기
			} else if (cmd.equals("/findId.member")) {
				String name = request.getParameter("name");
				System.out.println("name : " + name);
				String email = request.getParameter("email");
				System.out.println("email : " + email);
				String contact = request.getParameter("contact");
				System.out.println("contact : " + contact);
				String foundId = dao.findId(name, email, contact);
				request.setAttribute("foundId", foundId);
				request.getRequestDispatcher("/member/findIdResult.jsp").forward(request, response);

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
				MembersDTO dto = new MembersDTO(id, pw, name, birth_date, nickname, contact, email, zipcode,
						roadAddress, detailAddress, null);
				dao.update(dto);
				response.sendRedirect("/myPage/mypageMainForm.jsp");
				// delete 회원탈퇴
			} else if (cmd.equals("/memberOut.member")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				dao.memberOut(id);
				response.sendRedirect("/index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}