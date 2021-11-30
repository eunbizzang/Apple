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

public class ShopMonthlyCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String shop = request.getParameter("shop");
		SalesDAO dao = SalesDAO.getInstance();
		/*
		 * String sdate = request.getParameter("sdate").trim(); String edate =
		 * request.getParameter("edate").trim(); SalesDAO dao = SalesDAO.getInstance();
		 * int[] proddata = dao.prodsalesweek(sdate, edate);
		 * request.setAttribute("proddata", proddata); System.out.println(sdate);
		 * System.out.println(edate); HashMap<String, Integer> saleslist =
		 * dao.weekSales(sdate, edate, shopid); request.setAttribute("perioddata",
		 * saleslist);
		 */
		
		// Dateset for weeksales research
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 0);
		String thismonth = format.format(cal.getTime()).substring(0,7);
		cal.add(Calendar.MONTH, -1);
		String lastmonth = format.format(cal.getTime()).substring(0,7);
		
		int lasttotal = dao.getMonthSales(shop, lastmonth);
		int thistotal = dao.getMonthSales(shop, thismonth);
		
		HashMap<String, Integer> monthlysaleslist = dao.getMonthList(thismonth, shop);
		request.setAttribute("monthlysaleslist", monthlysaleslist);
		System.out.println(monthlysaleslist);
		String[] month = {lastmonth.substring(5,7)+"월", thismonth.substring(5,7)+"월"};
		request.setAttribute("shop", shop);
		request.setAttribute("monthlabel", month);
		request.setAttribute("lasttotal", lasttotal);
		request.setAttribute("thistotal", thistotal);
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_monthly.jsp");
		
		
		return forward;
	}
}
