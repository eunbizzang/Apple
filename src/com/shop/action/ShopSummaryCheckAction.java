<<<<<<< HEAD
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

		HttpSession session = request.getSession();
		String shopid = (String)session.getAttribute("shopId");
		String sdate = request.getParameter("sdate").trim();
		String edate = request.getParameter("edate").trim();
		SalesDAO dao = SalesDAO.getInstance();
		int[] proddata = dao.prodsalesweek(sdate, edate);
		request.setAttribute("proddata", proddata);
		System.out.println(sdate);
		System.out.println(edate);
		HashMap<String, Integer> saleslist = dao.weekSales(sdate, edate, shopid);
		System.out.println(saleslist);
		request.setAttribute("perioddata", saleslist);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_summary.jsp");
		
		
		return forward;
	}
}
=======
package com.shop.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shops.controller.Action;
import com.shops.controller.ActionForward;
import com.shops.model.SalesDAO;

public class ShopSummaryCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// Dateset for weeksales research
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String[] week = new String[7];
		for(int i=6; i>=0; i--) {
			cal.add(Calendar.DAY_OF_MONTH, -1);
			week[i] = format.format(cal.getTime());
		} // week[6]=yesterday, week[0] = a week before;
		request.setAttribute("week", week);
		
		SalesDAO dao = SalesDAO.getInstance();
		
		// select all store's productsales list
		int[] prodsales = dao.prodsalesweek(week[0], week[6]);
		
		request.setAttribute("prodsales", prodsales);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_summary_check.jsp");
		
		
		return forward;
	}

}
>>>>>>> 7f0cb9eef0131270413f2d24c1aaf247a0c4768f
