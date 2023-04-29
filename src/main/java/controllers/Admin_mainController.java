package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeBoardDAO;
import dao.SecondHandDAO;
import dao.StudyBoardDAO;
import dto.FreeBoardDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;
import statics.Settings;
@WebServlet("*.admin_main")
public class Admin_mainController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	StudyBoardDAO sbdao = StudyBoardDAO.getInstance();
	FreeBoardDAO fbdao = FreeBoardDAO.getInstance();
	StudyBoardDAO stdao = StudyBoardDAO.getInstance();
	SecondHandDAO shDAO = SecondHandDAO.getInstance();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		String cmd =request.getRequestURI();
		System.out.println(cmd);
		try {
			if(cmd.equals("/admin_mainboard.admin_main")) {
				//자유게시판
				System.out.println("왜안되지?");
				int currentPage = request.getParameter("cpage") == null ? 1 
						: Integer.parseInt(request.getParameter("cpage"));
				if(currentPage < 0) {
					currentPage = 1;
				}else if(currentPage > (int)Math.ceil(stdao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int)Math.ceil(stdao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				System.out.println("자유게시판 LIST 생성");
				List<FreeBoardDTO> freelist = fbdao.selectList();
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				System.out.println("스터티 게시판 LIST 생성");
				List<StudyBoardDTO> studylist = stdao.selectStudyBoard(start, end);
				System.out.println("recordList 생성");
				List<SecondHandDTO> recordList = shDAO.selectRecordByPage(start, end);
				request.setAttribute("recordList", recordList);
				request.setAttribute("boardList", freelist);
				request.setAttribute("studylist", studylist);
				request.getRequestDispatcher("/admin/admin_main.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
