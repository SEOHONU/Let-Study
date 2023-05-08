package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.Admin_DAO;
import dao.FreeBoardDAO;
import dao.MainDAO;
import dao.MembersDAO;
import dao.SecondHandDAO;
import dao.StudyBoardDAO;
import dto.FreeBoardAndMemberDTO;
import dto.FreeBoardDTO;
import dto.MembersDTO;
import dto.SecondHandDTO;
import dto.StudyBoardDTO;
import statics.Settings;

@WebServlet("*.adminBoard")
public class Admin_BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		String cmd = request.getRequestURI();
		SecondHandDAO shDAO = SecondHandDAO.getInstance();
		Admin_DAO dao = Admin_DAO.getInstance();
		StudyBoardDAO sbdao = StudyBoardDAO.getInstance();
		FreeBoardDAO frdao = FreeBoardDAO.getInstance();
		MembersDAO mbdao = MembersDAO.getInstance();
		MainDAO mndao = MainDAO.getInstance();
		Gson g = new Gson();
		try {

			// 리스트 출력 시작
			if (cmd.equals("/study_select.adminBoard")) {
				System.out.println("스터디 리스트 출력");
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				System.out.println("currentPage : " + currentPage);
				if (currentPage < 0) {
					currentPage = 1;
				} else if (currentPage > (int) Math
						.ceil(sbdao.getRecordCount() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int) Math
							.ceil(sbdao.getRecordCount() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE
						- (Settings.BOARD_RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;

				int first = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE;
				int last = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE
						+ Settings.BOARD_NAVI_COUNT_PER_PAGE + 1;

				System.out.println(start + "/" + end);
				System.out.println("-----------");
				System.out.println(first + "/" + last);
				System.out.println("스터디 46번째");

				System.out.println(currentPage);

				List<StudyBoardDTO> list = sbdao.selectStudyBoard(start, end);

				List<String> pageNavi = sbdao.getPageNavi(sbdao.getRecordCount(), currentPage);

				System.out.println(pageNavi);

				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", currentPage);
				System.out.println("54번째임");
				request.setAttribute("start", first);
				request.setAttribute("end", last);
				request.getRequestDispatcher("/admin/admin_StudyBoard.jsp").forward(request, response);
			} else if (cmd.equals("/secondHand.adminBoard")) {
				System.out.println("중고책 리스트 출력");
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int currentPage = request.getParameter("currentPage") == null ? 1
						: Integer.parseInt(request.getParameter("currentPage"));
				int startRecord = (currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE)
						- (Settings.SH_BOARD_RECORD_COUNT_PER_PAGE - 1);
				int endRecord = currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE;
				List<SecondHandDTO> recordList = shDAO.selectRecordByPage(startRecord, endRecord);
				System.out.println("recordList : " + recordList);
				List<String> pageNavi = shDAO.getPageNavi(currentPage);
				System.out.println("pageNavi : " + pageNavi);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("recordList", recordList);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("/admin/admin_SecondHand.jsp").forward(request, response);

			} else if (cmd.equals("/freeBoard.adminBoard")) {
				System.out.println("자유게시판 리스트 출력");
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int currentPage = request.getParameter("cpage") == null ? 1
						: Integer.parseInt(request.getParameter("cpage"));
				if (currentPage < 0) {
					currentPage = 1;
				} else if (currentPage > (int) Math
						.ceil(frdao.getRecordCount() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int) Math
							.ceil(frdao.getRecordCount() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE
						- (Settings.BOARD_RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				int first = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE;
				int last = (currentPage - 1) / Settings.BOARD_NAVI_COUNT_PER_PAGE * Settings.BOARD_NAVI_COUNT_PER_PAGE
						+ Settings.BOARD_NAVI_COUNT_PER_PAGE + 1;
				System.out.println(start + "/" + end);
				System.out.println(currentPage);
				List<FreeBoardAndMemberDTO> list = frdao.selectFreeBoardList(start, end);
				List<String> pageNavi = frdao.getPageNavi(frdao.getRecordCount(), currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("start", first);
				request.setAttribute("end", last);
				System.out.println("자게 리스트 끗");
				request.getRequestDispatcher("/admin/admin_freeboard.jsp").forward(request, response);

			} else if (cmd.equals("/user_Board.adminBoard")) {
				System.out.println("될까?");
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int currentPage = request.getParameter("cpage") == null ? 1
						: Integer.parseInt(request.getParameter("cpage"));
				if (currentPage < 0) {
					currentPage = 1;
				} else if (currentPage > (int) Math
						.ceil(dao.getRecordCount_user() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int) Math
							.ceil(dao.getRecordCount_user() / (double) Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE
						- (Settings.BOARD_RECORD_COUNT_PER_PAGE - 1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				System.out.println(start + " : " + end);
				List<MembersDTO> result = dao.user_list(start, end);
				List<String> pageNavi = dao.getPageNavi(dao.getRecordCount_user(), currentPage);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("userList", result);
				request.setAttribute("pageNavi", pageNavi);
				System.out.println(result);
				request.getRequestDispatcher("/admin/admin_userBoard.jsp").forward(request, response);
			}
//			리스트 출력 종료

//			삭제 서블릿시작 
			else if (cmd.equals("/freeboard_Delete.adminBoard")) {
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int currentPage = request.getParameter("seq") == null ? 1
						: Integer.parseInt(request.getParameter("seq"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				int result = frdao.deleteBySeq(seq);
				System.out.println("삭제됨");
				response.sendRedirect("/freeBoard.adminBoard?cpage=" + currentPage);
			} else if (cmd.equals("/studyboard_Delete.adminBoard")) {
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int currentPage = request.getParameter("seq") == null ? 1
						: Integer.parseInt(request.getParameter("seq"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				sbdao.deletestudyboard(seq);
				response.sendRedirect("/study_select.adminBoard?cpage=" + currentPage);

			} else if (cmd.equals("/secondHand_Delete.adminBoard")) {
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				int seq = request.getParameter("seq") == null ? 1 : Integer.parseInt(request.getParameter("seq"));
				System.out.println("중고책 : " + seq);
				int currentPage = request.getParameter("currentPage") == null ? 1
						: Integer.parseInt(request.getParameter("seq"));
				System.out.println("중고책 : " + currentPage);
				int result = shDAO.deleteContents(seq);
				response.sendRedirect("/secondHand.adminBoard?cpage=" + currentPage);
			} else if (cmd.equals("/userList_delete.adminBoard")) {
				request.setCharacterEncoding("utf8");
				response.setContentType("text/html; charset=utf8");
				System.out.println("현생으로 ");
				String id = (String) request.getParameter("id");
				mbdao.memberOut(id);
				response.sendRedirect("/user_Board.adminBoard");
			}
			// 삭제 서블릿 종료

			// 검색 서블릿 시작
			else if (cmd.equals("/allsearch.adminBoard")) {
				System.out.println("통합검색 스타또");
				String select = request.getParameter("select");
				String title = request.getParameter("title");

				List<SecondHandDTO> sdto = mndao.joongosearch(select, title);
				System.out.println("중고");
				List<StudyBoardDTO> stdto = mndao.studysearch(select, title);
				System.out.println("스터디");
				List<FreeBoardDTO> fdto = mndao.boardsearch(select, title);
				System.out.println("자유");
				List<MembersDTO> mbdto = dao.usersearch(select, title);
				System.out.println("유저 검색출력");
				request.setAttribute("mddto", mbdto);
				System.out.println(mbdto);
				request.setAttribute("sdto", sdto);
				System.out.println(sdto);
				request.setAttribute("stdto", stdto);
				System.out.println(stdto);
				request.setAttribute("fdto", fdto);
				System.out.println(fdto);
				request.setAttribute("title", title);
				System.out.println(title);
				request.getRequestDispatcher("/admin/admin_searchpage.jsp").forward(request, response);
			} else if (cmd.equals("/usersearch.adminBoard")) {
				System.out.println("유저 검색출력");
				String select = request.getParameter("select");
				String id = request.getParameter("id");
				List<MembersDTO> mbdto = dao.usersearch(select, id);
				request.setAttribute("mbdto", mbdto);
				request.setAttribute("id", id);
				request.getRequestDispatcher("/admin/admin_UserSearchpage.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}