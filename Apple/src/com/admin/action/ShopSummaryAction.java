package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.SalesDAO;
import com.shop.model.SalesDTO;

public class ShopSummaryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		SalesDAO dao = SalesDAO.getInstance();

		String shopid = "1";
		
		List<SalesDTO> list = dao.salesToday(shopid);
		
		int total = dao.totalToday(shopid);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("shopid", shopid);
		
		request.setAttribute("salesList", list);
		request.setAttribute("total", total);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_summary.jsp");
		
		
		return forward;
	}

}
