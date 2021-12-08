package com.shop.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shops.controller.Action;
import com.shops.controller.ActionForward;
import com.shops.model.SalesDAO;

public class ShopSummaryCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String shopname = null;
		String shopid = request.getParameter("shopname");
		String sdate = request.getParameter("sdate").trim();
		String edate = request.getParameter("edate").trim();
		SalesDAO dao = SalesDAO.getInstance();
		int[] proddata = dao.shopprodsales(sdate, edate, shopid);
		request.setAttribute("proddata", proddata);
		System.out.println(sdate);
		System.out.println(edate);
		HashMap<String, Integer> saleslist = dao.allSales(sdate, edate, shopid);
		System.out.println(saleslist);
		request.setAttribute("perioddata", saleslist);
		int total = dao.getTotalSales(sdate, edate, shopid);
		request.setAttribute("total", total);
		
		
		// for submitted data
		String[] submitdata = {shopid, sdate, edate};
		request.setAttribute("submitdata", submitdata);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_summary.jsp");
		
		
		return forward;
	}
}
