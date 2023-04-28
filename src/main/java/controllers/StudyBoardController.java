package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.StudyBoardDAO;
import dao.StudyBoardMembersDAO;
import dao.StudyReplyDAO;
import dto.StudyBoardDTO;
import dto.StudyBoardMembersDTO;
import dto.StudyReplyDTO;
import statics.Settings;

@WebServlet("*.studyboard")
public class StudyBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		try {
			StudyBoardDAO dao = StudyBoardDAO.getInstance();
			Gson g = new Gson();
			if(cmd.equals("/select.studyboard")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				if(currentPage < 0) {
					currentPage = 1;
				}else if(currentPage > (int)Math.ceil(dao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int)Math.ceil(dao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				
				int first = (currentPage-1)/Settings.BOARD_NAVI_COUNT_PER_PAGE*Settings.BOARD_NAVI_COUNT_PER_PAGE;
				int last = (currentPage-1)/Settings.BOARD_NAVI_COUNT_PER_PAGE*Settings.BOARD_NAVI_COUNT_PER_PAGE+Settings.BOARD_NAVI_COUNT_PER_PAGE+1;
				System.out.println(start+"/"+end);
				System.out.println(currentPage);
				List<StudyBoardDTO> list = dao.selectStudyBoard(start, end);
				List<String> pageNavi = dao.getPageNavi(dao.getRecordCount(), currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("start", first);
				request.setAttribute("end", last);
				request.getRequestDispatcher("/studyboard/selectstudyboard.jsp").forward(request, response);
			}else if(cmd.equals("/inner.studyboard")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				StudyBoardDTO dto = dao.selectdetailstudyboard(seq);
				StudyBoardMembersDAO sbmdao = StudyBoardMembersDAO.getInstance();
				List<StudyBoardMembersDTO> sbmlist = sbmdao.selectapply(seq);
				List<StudyBoardMembersDTO> cksbmlist = sbmdao.selectapplycheck(seq);
				StudyReplyDAO rdao = StudyReplyDAO.getInstance();
				List<StudyReplyDTO> list = rdao.selectreply(seq);
				request.setAttribute("sbmlist", sbmlist);
				request.setAttribute("cksbmlist", cksbmlist);
				request.setAttribute("replylist", list);
				request.setAttribute("dto", dto);
				request.setAttribute("cpage", currentPage);
				request.getRequestDispatcher("/studyboard/detailselectstudyboard.jsp").forward(request, response);
			}else if(cmd.equals("/delete.studyboard")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				dao.deletestudyboard(seq);
				response.sendRedirect("/select.studyboard?cpage="+currentPage);
			}else if(cmd.equals("/insert.studyboard")) {
				String id = (String) request.getSession().getAttribute("loggedID");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				String detailcontents = request.getParameter("detailcontents");
				double lat = Double.parseDouble(request.getParameter("lat"));
				double lng = Double.parseDouble(request.getParameter("lng"));
				String mapname = request.getParameter("mapname");
				dao.insertstudyboard(new StudyBoardDTO(0,id,title,contents,detailcontents,0,null,lat,lng,mapname));
				response.sendRedirect("/select.studyboard?cpage=1");
			}else if(cmd.equals("/update.studyboard")) {
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				String id = (String) request.getSession().getAttribute("loggedID");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				String detailcontents = request.getParameter("detailcontents");
				double lat = Double.parseDouble(request.getParameter("lat"));
				double lng = Double.parseDouble(request.getParameter("lng"));
				String mapname = request.getParameter("mapname");
				dao.updatestudyboard(new StudyBoardDTO(seq,id,title,contents,detailcontents,0,null,lat,lng,mapname));
				response.sendRedirect("/inner.studyboard?cpage="+currentPage+"&seq="+seq);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
