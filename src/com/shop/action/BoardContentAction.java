package com.shop.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shops.controller.Action;
import com.shops.controller.ActionForward;
import com.shops.model.BoardDAO;
import com.shops.model.BoardDTO;

public class BoardContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 게시물 번호에 해당하는 게시물 상세내역을 보여주는 비니지스 로직
		int board_no = Integer.parseInt(request.getParameter("num"));
		int board_page = Integer.parseInt(request.getParameter("page"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.getBoardCont(board_no);
		BoardDTO prevdto = dao.getBoardCont(board_no-1);
		BoardDTO nextdto = dao.getBoardCont(board_no+1);
		int ncnt = dao.getBoardCount();
		
		int prevpage = board_no % 10;
		
		String image = dto.getBoard_image();
		
		request.setAttribute("Cont", dto);
		request.setAttribute("pCont", prevdto);
		request.setAttribute("nCont", nextdto);
		request.setAttribute("ncnt", ncnt);
		request.setAttribute("Page", board_page);
		request.setAttribute("pPage", prevpage);
		request.setAttribute("image", image);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("shop/board_content.jsp");
		
		return forward;
	}

}
