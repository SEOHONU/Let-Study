package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.EncryptionUtils;
import dao.FreeBoardDAO;
import dao.FreeFileDAO;
import dao.FreeReplyDAO;
import dto.FreeBoardAndMemberDTO;
import dto.FreeBoardDTO;
import dto.FreeFileDTO;
import dto.ReplyAndMemberDTO;
import statics.Settings;

@WebServlet("*.freeBoard")
public class FreeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		String cmd=request.getRequestURI();

		FreeBoardDAO dao = FreeBoardDAO.getInstance();
		String writer = (String)request.getSession().getAttribute("loggedID");
		String nickname = (String)request.getSession().getAttribute("loggedNickname");
		try {
			//자유게시판 글쓰기
			if(cmd.equals("/write.freeBoard")) {
				String title = request.getParameter("title");
				String contents= request.getParameter("contents");
				title = EncryptionUtils.AntiXSS(title);
				contents = EncryptionUtils.AntiXSS(contents);
			
				int result = dao.insert(writer, title, contents);
				response.sendRedirect("/contentList.freeBoard");
			// 자유게시판 목록 리스트 보기			
			}else if(cmd.equals("/contentList.freeBoard")) {
				int currentPage = request.getParameter("cpage") == null ? 1 : Integer.parseInt(request.getParameter("cpage"));
				if(currentPage < 0) {
					currentPage = 1;
				}else if(currentPage > (int)Math.ceil(dao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int)Math.ceil(dao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				int first = (currentPage-1)/Settings.BOARD_NAVI_COUNT_PER_PAGE*Settings.BOARD_NAVI_COUNT_PER_PAGE;
				int last = (currentPage-1)/Settings.BOARD_NAVI_COUNT_PER_PAGE*Settings.BOARD_NAVI_COUNT_PER_PAGE+Settings.BOARD_NAVI_COUNT_PER_PAGE+1;
				List<FreeBoardAndMemberDTO> list = dao.selectFreeBoardList(start, end);
				List<String> pageNavi = dao.getPageNavi(dao.getRecordCount(), currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("start", first);
				request.setAttribute("end", last);
				request.getRequestDispatcher("/freeBoard/FreeBoardList.jsp").forward(request, response);
			}
			// 게시글 디테일 뷰
			else if(cmd.equals("/detail.freeBoard")) {
				
				// 게시글 시퀀스 받아오기
				int seq = Integer.parseInt(request.getParameter("seq"));
				System.out.println("게시글 시퀀스 : "+seq);
				// 게시글 조회수
				dao.freeBoardViewUp(seq);
				// 게시글 출력
				FreeBoardDTO list = dao.selectDetail(seq);
				request.setAttribute("list", list);
				// 닉네임 출력
				String nick = dao.getNicknameBySeq(seq);
				System.out.println(nick);
				request.setAttribute("nickname", nick);
				
				// 댓글 출력
				FreeReplyDAO daoRP = FreeReplyDAO.getInstance();
				List<ReplyAndMemberDTO> replyResult = daoRP.selectReply(seq);
				request.setAttribute("replyResult", replyResult);
				request.getRequestDispatcher("/freeBoard/FreeBoardContents.jsp").forward(request, response);
				
				
				// 게시글 업데이트
			}else if(cmd.equals("/update.freeBoard")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String contents= request.getParameter("contents");			
				int result = dao.update(seq, title, contents);	
				response.sendRedirect("detail.freeBoard?seq="+seq);
				
			// 게시글 삭제
			}else if(cmd.equals("/delete.freeBoard")){
				int seq = Integer.parseInt(request.getParameter("seq"));
				int result = dao.deleteBySeq(seq);
				response.sendRedirect("/contentList.freeBoard");
			// 자유게시판 검색	
			}else if(cmd.equals("/searchByOption.freeBoard")) {
				int currentPage = request.getParameter("cpage") == null ? 1 : Integer.parseInt(request.getParameter("cpage"));
				if(currentPage < 0) {
					currentPage = 1;
				}else if(currentPage > (int)Math.ceil(dao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE)) {
					currentPage = (int)Math.ceil(dao.getRecordCount()/(double)Settings.BOARD_RECORD_COUNT_PER_PAGE);
				}
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				String optionValue = (String)request.getParameter("optionValue");
				String searchValue = (String)request.getParameter("searchValue");
				int first = (currentPage-1)/Settings.BOARD_NAVI_COUNT_PER_PAGE*Settings.BOARD_NAVI_COUNT_PER_PAGE;
				int last = (currentPage-1)/Settings.BOARD_NAVI_COUNT_PER_PAGE*Settings.BOARD_NAVI_COUNT_PER_PAGE+Settings.BOARD_NAVI_COUNT_PER_PAGE+1;
				List<FreeBoardAndMemberDTO> list = dao.freeBoardSearch(optionValue, searchValue, start, end);
				List<String> pageNavi = dao.getPageNavi(dao.getRecordCount(), currentPage);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("start", first);
				request.setAttribute("end", last);
				request.getRequestDispatcher("/freeBoard/FreeBoardList.jsp").forward(request, response);
				}
			
			
			
			else if(cmd.equals("/insertFile.freeBoard")) {
					JsonObject jo = new JsonObject();
					Gson g = new Gson();
					System.out.println("insert.summer 진입");
					String targetPath = request.getServletContext().getRealPath("freeImg");
					System.out.println("realPath : "+targetPath);
					File targetFolder = new File(targetPath);
					if(!targetFolder.exists()) {
						targetFolder.mkdir();
						System.out.println("폴더 생성");
					}
					System.out.println("경로 설정");
					MultipartRequest multi = new MultipartRequest
							(request, targetPath, 1024*1024*10, "utf8", new DefaultFileRenamePolicy());
					System.out.println("realPath - 파일 업로드 완료");
					Enumeration<String> names = multi.getFileNames();
					System.out.println("파일이름 받아옴 : "+names);
					while(names.hasMoreElements()) {
						System.out.println("while문 진입");
						String name = names.nextElement();
						System.out.println("name : "+name);
						if(multi.getFile(name) != null) {
							String oriName = multi.getOriginalFileName(name);
							System.out.println("oriName : "+oriName);
							String sysName = multi.getFilesystemName(name);
							System.out.println("sysName : "+sysName);
							String url = "/img/"+sysName;
							System.out.println("url : "+url);
//							jo.addProperty("url", url);
//							System.out.println(jo.toString());
							response.getWriter().append(g.toJson(url));
						}
					}
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
