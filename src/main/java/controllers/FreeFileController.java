package controllers;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.FreeFileDAO;

@WebServlet("*.file")
public class FreeFileController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Gson g = new Gson();
		String cmd = request.getRequestURI();
		FreeFileDAO dao = FreeFileDAO.getInstance();
		try {
		if(cmd.equals("/download.file")) {
			System.out.println("다운로드 시도 확인");
			String oriName = request.getParameter("oriName");
			oriName = new String(oriName.getBytes("utf8"),"ISO-8859-1");

			response.reset();
			response.setHeader("Content-Disposition", "attachment;filename="+oriName);

			String uploadPath = request.getServletContext().getRealPath("upload2");
			String sysName = request.getParameter("sysName");
			System.out.println(uploadPath);
			System.out.println(sysName);

			File target = new File(uploadPath + "/" + sysName);

			try(ServletOutputStream sos = response.getOutputStream();
					FileInputStream fis = new FileInputStream(target);
					DataInputStream dis = new DataInputStream(fis);
					){
				byte[] fileContents = new byte[(int)target.length()];
				System.out.println(fileContents);
				dis.readFully(fileContents);
				sos.write(fileContents);
				sos.flush();
			}
		}else if(cmd.equals("/delete.file")) {
			int file_seq = Integer.parseInt(request.getParameter("file_seq"));
			int board_seq = Integer.parseInt(request.getParameter("board_seq"));
			int result = dao.delete(file_seq);
			if(result==1) {
				System.out.println(" 파일 정상 삭제되었습니다.");
			}
			String resp=g.toJson(result);
			response.getWriter().append(resp);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
