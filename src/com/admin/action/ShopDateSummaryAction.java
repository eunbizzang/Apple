package com.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shops.controller.Action;
import com.shops.controller.ActionForward;
import com.shops.model.SalesDAO;

public class ShopDateSummaryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		SalesDAO dao = SalesDAO.getInstance();

		ArrayList<Integer> shopsales = dao.shopsales();
		int[] prodsales = dao.prodsales();
		
		System.out.println(shopsales);
		request.setAttribute("shopsales", shopsales);
		request.setAttribute("prodsales", prodsales);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_datesummary.jsp");
		
		
		return forward;
	}

}
