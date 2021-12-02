package com.shop.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shops.controller.Action;
import com.shops.controller.ActionForward;
import com.shops.model.BoardDAO;
import com.shops.model.BoardDTO;
import com.shops.model.OrderDAO;
import com.shops.model.UserDAO;
import com.shops.model.UserDTO;

public class Shop_Login implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
	    ActionForward forward = new ActionForward();
	    PrintWriter out = response.getWriter();
	    
	    OrderDAO odao = OrderDAO.getInstance();
	    BoardDAO ndao = BoardDAO.getInstance();
	    BoardDAO bdao = BoardDAO.getInstance();
		
		if(request.getParameter("code") != null) {
			
			HttpSession session = request.getSession();
			String shop_id = (String)session.getAttribute("shopId");
			
			int odto = odao.getShopOrderCount(shop_id);
		    int sdto = odao.getShopOrderOklist(shop_id);
		    int cdto = odao.getShopCancellist(shop_id);
		    
		    List<BoardDTO> ndto = ndao.getMainNoticeList();
		    List<BoardDTO> bdto = bdao.getMainBoardList();
		    
		    request.setAttribute("ordercount", odto);
	    	request.setAttribute("okcount", sdto);
	    	request.setAttribute("cancelcount", cdto);
	    	request.setAttribute("noticelist", ndto);
	    	request.setAttribute("boardlist", bdto);
	    	
	    	// 세션에 저장된 정보를 가지고 View Page로 이동하자
	    	forward.setRedirect(false);
	    	forward.setPath("shop/shop_main.jsp");
		    
		} else {
			
			String shop_id = request.getParameter("shop_id").trim();
			String shop_pwd = request.getParameter("shop_pwd").trim();
			
			UserDAO dao = UserDAO.getInstance();
		    int check = dao.userCheck(shop_id, shop_pwd);
		    
		    int odto = odao.getShopOrderCount(shop_id);
		    int sdto = odao.getShopOrderOklist(shop_id);
		    int cdto = odao.getShopCancellist(shop_id);
		    
		    List<BoardDTO> ndto = ndao.getMainNoticeList();
		    List<BoardDTO> bdto = bdao.getMainBoardList();
		    
		    // 세션을 생성하는 방법
		    HttpSession session = request.getSession();
		    
		    if(check > 0) {
		    	
		    	UserDTO dto = dao.getMember(shop_id);
		    	
		    	session.setAttribute("shopId", dto.getShop_id());
		    	session.setAttribute("shopName", dto.getShop_name());
		    	
		    	request.setAttribute("ordercount", odto);
		    	request.setAttribute("okcount", sdto);
		    	request.setAttribute("cancelcount", cdto);
		    	request.setAttribute("noticelist", ndto);
		    	request.setAttribute("boardlist", bdto);
		    	
		    	// 세션에 저장된 정보를 가지고 View Page로 이동하자
		    	forward.setRedirect(false);
		    	
		    	forward.setPath("shop/shop_main.jsp");
		    	
		    }else if(check == -1) {
		    	// 아이디는 맞으나 비밀번호가 틀린 경우
		    	out.println("<script>");
		    	out.println("alert('매장계정 비밀번호가 틀립니다.')");
		    	out.println("history.back()");
		    	out.println("</script>");
		    }else {
		    	// 존재하지 않는 아이디
		    	out.println("<script>");
		    	out.println("alert('존재하지 않는 계정입니다.')");
		    	out.println("history.back()");
		    	out.println("</script>");
		    }
			
		}
		
		return forward;
	    
	}
}


