package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.EncryptionUtils;
import dao.Sh_CommentsDAO;
import dao.SecondHandDAO;
import dto.Sh_CommentsDTO;
import dto.SecondHandDTO;
import statics.Settings;

@WebServlet("*.secondHand")
public class SecondHandController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		String cmd = request.getRequestURI();
		System.out.println("cmd : "+cmd);
		SecondHandDAO shDAO = SecondHandDAO.getInstance();
		Sh_CommentsDAO cmDAO = Sh_CommentsDAO.getInstance();
		try {
			if(cmd.equals("/secondHandList.secondHand")) {
				response.sendRedirect("/secondHand/secondHandList.jsp");
			}
			else if(cmd.equals("/secondHandWriteForm.secondHand")) {
				response.sendRedirect("/secondHand/secondHandWriteForm.jsp");
			}
			else if(cmd.equals("/insert.secondHand")) {
				String writer = (String)request.getSession().getAttribute("loginId");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				double lat = Double.parseDouble(request.getParameter("lat"));
				double lng = Double.parseDouble(request.getParameter("lng"));
				writer = EncryptionUtils.AntiXSS(writer);
				title = EncryptionUtils.AntiXSS(title);
				contents = EncryptionUtils.AntiXSS(contents);
				SecondHandDTO dto = new SecondHandDTO();
				dto.setWriter(writer);
				dto.setTitle(title);
				dto.setContents(contents);
				dto.setLat(lat);
				dto.setLng(lng);
				shDAO.insertSecondHand(dto);
				response.sendRedirect("/selectBound.secondHand?currentPage=1");
			}
			else if(cmd.equals("/selectBound.secondHand")) {
				int currentPage = request.getParameter("currentPage") == null ? 1 
						: Integer.parseInt(request.getParameter("currentPage"));
				int startRecord = (currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE) - 
						(Settings.SH_BOARD_RECORD_COUNT_PER_PAGE - 1);
				int endRecord = currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE;
				List<SecondHandDTO> recordList = shDAO.selectRecordByPage(startRecord, endRecord);
				System.out.println("recordList : "+recordList);
				List<String> pageNavi = shDAO.getPageNavi(currentPage);
				System.out.println("pageNavi : "+pageNavi);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("recordList", recordList);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("/secondHand/secondHandList.jsp").forward(request, response);
			}
			else if(cmd.equals("/secondHandBoardContents.secondHand")) {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int targetSeq = Integer.parseInt(request.getParameter("seq"));
				shDAO.secondHandBoardViewUp(targetSeq);
				SecondHandDTO dto = shDAO.selectContents(targetSeq);
				List<Sh_CommentsDTO> list = cmDAO.selectComments(targetSeq);
				for(Sh_CommentsDTO s : list) {
					System.out.println("----------------------");
					System.out.println(s.getParent_seq());
				}
				request.setAttribute("list", list);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/secondHand/secondHandContents.jsp").forward(request, response);
			}
			else if(cmd.equals("/deleteContents.secondHand")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int result = shDAO.deleteContents(seq);
				response.sendRedirect("/selectBound.secondHand?currentPage="+currentPage);
			}
			else if(cmd.equals("/modifyContents.secondHand")) {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				title = EncryptionUtils.AntiXSS(title);
				contents = EncryptionUtils.AntiXSS(contents);
				double lat = Double.parseDouble(request.getParameter("lat"));
				double lng = Double.parseDouble(request.getParameter("lng"));
				SecondHandDTO dto = new SecondHandDTO(seq, title, contents,
						null, null, 0, lat, lng, null);
				int result = shDAO.modifyContents(dto);
				response.sendRedirect("/secondHandBoardContents.secondHand?seq="+seq+"&currentPage="+currentPage);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}