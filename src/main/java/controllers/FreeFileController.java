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

@WebServlet("*.file")
public class FreeFileController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cmd = request.getRequestURI();
		if(cmd.equals("/download.file")) {
			System.out.println("다운로드 시도 확인");
			// 원래 이름으로 다운로드 받을 수 있게 파라미터 가져옴	
			String oriName = request.getParameter("oriName");
			// 인코딩 하기
			oriName = new String(oriName.getBytes("utf8"),"ISO-8859-1");

			response.reset();
			response.setHeader("Content-Disposition", "attachment;filename="+oriName);

			String uploadPath = request.getServletContext().getRealPath("upload2");
			String sysName = request.getParameter("sysName");

			File target = new File(uploadPath + "/" + sysName);
			System.out.println(uploadPath);
			System.out.println("-----------------");
			System.out.println(target);
			System.out.println(target.length());


			//inputStream = 데이터를 읽을 때
			//outputStream = 데이터를 내보낼 때 
			try(ServletOutputStream sos = response.getOutputStream();
					// 파일을 로딩
					FileInputStream fis = new FileInputStream(target);
					DataInputStream dis = new DataInputStream(fis);
					){
				//해당 사이즈 만큼 byte 배열 만듬
				byte[] fileContents = new byte[(int)target.length()];
				System.out.println(fileContents);
				dis.readFully(fileContents);
				sos.write(fileContents);
				sos.flush();
			}
		}
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
