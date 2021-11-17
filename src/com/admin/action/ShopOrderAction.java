package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProdDAO;
import com.shop.model.ProdDTO;

public class ShopOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProdDAO dao = ProdDAO.getInstance();

		String shopid = "garosu";

		HttpSession session = request.getSession();
		session.setAttribute("shopid", shopid);
		
		
		List<ProdDTO> list = dao.prodNow(shopid);
		
		request.setAttribute("salesList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_order.jsp");
		
		
		return forward;
	}

}
