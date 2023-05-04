package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import dao.SecondHandDAO;
import dao.Sh_CommentsDAO;
import dto.SecondHandDTO;
import dto.Sh_CommentsDTO;
import dto.Sh_FilesDTO;
import statics.Settings;

@WebServlet("*.secondHand")
public class SecondHandController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		String cmd = request.getRequestURI();
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
				String writer = (String)request.getSession().getAttribute("loggedID");
				String title = request.getParameter("title");
				String contents = request.getParameter("contents");
				List<Sh_FilesDTO> list = (List)request.getSession().getAttribute("att");
				System.out.println("list.size() : "+list.size());
				System.out.println("list : "+list);
				double lat = Double.parseDouble(request.getParameter("lat"));
				double lng = Double.parseDouble(request.getParameter("lng"));
				title = EncryptionUtils.AntiXSS(title);
				contents = EncryptionUtils.AntiXSS(contents);
				SecondHandDTO dto = new SecondHandDTO();
				dto.setWriter(writer);
				dto.setTitle(title);
				dto.setContents(contents);
				dto.setLat(lat);
				dto.setLng(lng);
				if(list.size() > 0) {	// 첨부파일이 있으면
					int seq = shDAO.getShSeqNextval();
					dto.setSeq(seq);
					for(Sh_FilesDTO i : list) {
						String oriName = i.getOriName();
						String sysName = i.getSysName();
						int parent_seq = seq;
						shDAO.insertShFiles(new Sh_FilesDTO(0, oriName, sysName, parent_seq));
					}
					shDAO.insertSecondHandWithFiles(dto);
				}
				else {					// 첨부파일이 없을 경우
					shDAO.insertSecondHand(dto);
				}
				list.clear();
				response.sendRedirect("/selectBound.secondHand?currentPage=1");
			}
			else if(cmd.equals("/selectBound.secondHand")) {
				List<Sh_FilesDTO> list = new ArrayList<>();
				request.getSession().setAttribute("att", list);
				int currentPage = request.getParameter("currentPage") == null ? 1 
						: Integer.parseInt(request.getParameter("currentPage"));
				int startRecord = (currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE) - 
						(Settings.SH_BOARD_RECORD_COUNT_PER_PAGE - 1);
				int endRecord = currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE;
				List<SecondHandDTO> recordList = shDAO.selectRecordByPage(startRecord, endRecord);
				List<String> pageNavi = shDAO.getPageNavi(currentPage);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("recordList", recordList);
				request.setAttribute("pageNavi", pageNavi);
				request.getRequestDispatcher("/secondHand/secondHandList.jsp").forward(request, response);
			}
			else if(cmd.equals("/searchSecondHand.secondHand")) {
				int currentPage = request.getParameter("currentPage") == null ? 1 
						: Integer.parseInt(request.getParameter("currentPage"));
				String option = request.getParameter("option");
				String searchText = request.getParameter("searchText");
				searchText = searchText.trim();
				searchText = EncryptionUtils.AntiXSS(searchText);
				int startRecord = (currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE) - 
						(Settings.SH_BOARD_RECORD_COUNT_PER_PAGE - 1);
				int endRecord = currentPage * Settings.SH_BOARD_RECORD_COUNT_PER_PAGE;
				List<SecondHandDTO> recordList = 
						shDAO.searchRecordByPage(startRecord, endRecord, searchText, option);
				List<String> pageNavi = shDAO.getPageNaviSearch(currentPage, searchText, option);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("recordList", recordList);
				request.setAttribute("pageNavi", pageNavi);
				request.setAttribute("option", option);
				request.setAttribute("searchText", searchText);
				request.getRequestDispatcher("/secondHand/secondHandList.jsp").forward(request, response);
			}
			else if(cmd.equals("/secondHandBoardContents.secondHand")) {
				int currentPage = Integer.parseInt(request.getParameter("currentPage"));
				int targetSeq = Integer.parseInt(request.getParameter("seq"));
				shDAO.secondHandBoardViewUp(targetSeq);
				SecondHandDTO dto = shDAO.selectContents(targetSeq);
				List<Sh_CommentsDTO> list = cmDAO.selectComments(targetSeq);
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
						null, null, 0, lat, lng);
				int result = shDAO.modifyContents(dto);
				response.sendRedirect("/secondHandBoardContents.secondHand?seq="+seq+"&currentPage="+currentPage);
			}
			else if(cmd.equals("/showClusterer.secondHand")) {
				Gson gson = new Gson();
				List<SecondHandDTO> list = shDAO.getAllLatLng();
				String gList = gson.toJson(list);
				response.getWriter().append(gList);
			}
			else if(cmd.equals("/insertFile.secondHand")) {
				JsonObject jo = new JsonObject();
				Gson g = new Gson();
				System.out.println("insert.summer 진입");
				String targetPath = request.getServletContext().getRealPath("img");
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
				String resp = "";
				List<Sh_FilesDTO> list = (List)request.getSession().getAttribute("att");
				while(names.hasMoreElements()) {
					System.out.println("while문 진입");
					String name = names.nextElement();
					System.out.println("name : "+name);
					if(multi.getFile(name) != null) {
						String oriName = multi.getOriginalFileName(name);
						System.out.println("oriName : "+oriName);
						String sysName = multi.getFilesystemName(name);
						System.out.println("sysName : "+sysName);
						list.add(new Sh_FilesDTO(0, oriName, sysName, 0));
						String url = "/img/"+sysName;
						System.out.println("url : "+url);
						System.out.println("sysName : "+sysName);
						System.out.println("oriName : "+oriName);
						String[] fileArr = new String[] {url, oriName, sysName};
						resp = g.toJson(fileArr);
					}
				}
				System.out.println(resp);
				response.getWriter().append(resp);
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