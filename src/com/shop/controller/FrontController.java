package com.shop.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, 
				HttpServletResponse response) throws IOException, ServletException {
		
		// 1단계 : 한글 깨짐에 대한 한글 인코딩 작업.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// getRequestURI() : 현재 프로젝트 명과 파일명을 문자열로 반환해 주는 메서드.
		// ==> 반환되는 문자열은 "/15_Board_Reply/*.do" 문자열로 반환을 해 줌.
		String uri = request.getRequestURI();
		System.out.println("URI >>> " + uri);
		
		// getContextPath() : 현재 프로젝트 명을 문자열로 반환해 주는 메서드.
		// ==> 반환되는 문자열은 "15_Board_Reply" 문자열로 반환을 해 줌.
		String path = request.getContextPath();
		System.out.println("PATH >>> " + path);
		
		// command 문자열 변수에는 *.do만 반환이 됨.
		String command = uri.substring(path.length() + 1);
		System.out.println("Command >>> " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		Properties prop = new Properties();
		FileInputStream fis = 
				new FileInputStream("C:\\NCS\\workspace(jsp)\\Apple\\src\\com\\shop\\controller\\mapping.properties");
		
		prop.load(fis);
		
		String value = prop.getProperty(command);
		System.out.println("Value >>> " + value);
		
		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken();   // "execute"
			String url_2 = st.nextToken();   // "패키지명.클래스명"
			try {
				Class url = Class.forName(url_2);
				
				// 동적으로 객체 생성하는 방법
				action = (Action)url.newInstance();
				forward = action.execute(request, response);
				System.out.println("FrontController forward 주소 >>> " + forward);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {  // value 값이 "execute"가 아닌 경우
			// view page로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {  // true인 경우
				response.sendRedirect(forward.getPath());
			}else {  // false는 View Page로 이동
				RequestDispatcher rd = 
						request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
			
	}
	
}
