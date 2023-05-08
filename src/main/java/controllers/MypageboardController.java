package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoardDAO;
import dao.MembersDAO;
import dao.Profile_settingDAO;
import dao.SecondHandDAO;
import dao.StudyBoardDAO;
import dto.FreeBoardDTO;
import dto.MembersDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;

@WebServlet("*.mypageboardController")
public class MypageboardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String cmd = request.getRequestURI();
		
		StudyBoardDAO sdao = StudyBoardDAO.getInstance();
		SecondHandDAO shdao = SecondHandDAO.getInstance();
		FreeBoardDAO fdao = FreeBoardDAO.getInstance();

		try {
			if (cmd.equals("/mypageboard.mypageboardController")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				// 스터디게시판
				List<StudyBoardDTO> sdto = sdao.mystudyboard(id);
				request.setAttribute("studyboard", sdto);
				// 중고거래게시판
				List<SecondHandDTO> shdto = shdao.mySecondHandBoard(id);
				request.setAttribute("secondhandboard", shdto);
				// 자유게시판
				List<FreeBoardDTO> fdto = fdao.myfreeboard(id);
				request.setAttribute("freeboard", fdto);
				MembersDTO dto = MembersDAO.getInstance().myInfoSelect(id);
	            request.setAttribute("myInfoMain", dto);
				request.getRequestDispatcher("/myPage/mypageMainForm.jsp").forward(request, response);
			
				
			}else if (cmd.equals("/delete.mypageboardController")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				sdao.delete(id);
				response.sendRedirect("/myPage/mypageMainForm.jsp");
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
