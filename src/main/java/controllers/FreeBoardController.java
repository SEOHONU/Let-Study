package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FreeFileDAO;
import dao.FreeBoardDAO;
import dao.FreeReplyDAO;
import dto.FreeFileDTO;
import dto.FreeBoardDTO;
import dto.FreeReplyDTO;

@WebServlet("*.freeBoard")
public class FreeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		String cmd=request.getRequestURI();

		FreeBoardDAO dao = FreeBoardDAO.getInstance();
		try {
			//자유게시판 글쓰기
			if(cmd.equals("/write.freeBoard")) {
				
				String realPath = request.getServletContext().getRealPath("freeBoardUpload");
				System.out.println("다운로드 파일 경로 : " + realPath);
				
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request,realPath,1024*1024*10,"utf8",new DefaultFileRenamePolicy());				
				
				String writer = multi.getParameter("writer");
				String title = multi.getParameter("title");
				String content= multi.getParameter("realContent");			
				System.out.println(writer+"   " + title +"   "+ content);
				System.out.println("writeform에서 값 넘어온것 확인");
				
				int result = dao.insert(writer, title, content);

				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
				FreeFileDTO dto = new FreeFileDTO(0,oriName, sysName, 0);
				
				if(oriName==null) {
					System.out.println("파일이 없어서 바로 넘어감");
					response.sendRedirect("/contentList.freeBoard");
				}else {
					System.out.println("파일이 있어서 dao거쳐서 넘어감");
					FreeFileDAO fileDao = FreeFileDAO.getInstance();
					int result2 = fileDao.insert(dto);
					response.sendRedirect("/contentList.freeBoard");
				}
				
			// 자유게시판 목록 리스트 보기			
			}else if(cmd.equals("/contentList.freeBoard")) {
				List<FreeBoardDTO> result = dao.selectList();
				request.setAttribute("boardList", result);
				request.getRequestDispatcher("/freeBoard/FreeBoardList.jsp").forward(request, response);
			}
			// 게시글 디테일 뷰
			else if(cmd.equals("/detail.freeBoard")) {
			
				//닉네임가져오기!!!!!!!!!!!!!!!!!!!!!!마이페이지에서 넘겨줘야하나?
				String nick_name = (String)request.getSession().getAttribute("nickname");
				request.setAttribute("nick_name", nick_name);
				
				// 게시글 시퀀스 받아오기
				int seq = Integer.parseInt(request.getParameter("seq"));
				// 게시글 출력
				FreeBoardDTO list = dao.selectDetail(seq);
				request.setAttribute("list", list);
				
				// 파일 출력
				FreeFileDAO daoF = FreeFileDAO.getInstance();
				
				if(daoF.findFile(seq)) {
					FreeFileDTO fileResult = daoF.selectByP_seq(seq);
					request.setAttribute("fileResult", fileResult);
				}
				// 댓글 출력
				FreeReplyDAO daoRP = FreeReplyDAO.getInstance();
				List<FreeReplyDTO> replyResult = daoRP.selectReply(seq);
				request.setAttribute("replyResult", replyResult);
				request.getRequestDispatcher("/freeBoard/FreeBoardContents.jsp").forward(request, response);
			}else if(cmd.equals("/update.freeBoard")) {
				System.out.println("업데이트 서블릿 도착");
				// 업데이트 준비물(보드): 시퀀스, 제목, 내용
				// 업데이트 준비물(파일) : 보드(부모)시퀀스, 
				
				
			}
					

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
