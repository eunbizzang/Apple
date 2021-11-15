package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.SalesDAO;
import com.shop.model.SalesDTO;

public class ShopReportOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub

		String shopid = request.getParameter("shopid");
		String date = request.getParameter("date");
		String pname = request.getParameter("pname");
		int sales_no = Integer.parseInt(request.getParameter("sales_no"));

		SalesDTO dto = new SalesDTO();
		dto.setShop_id(shopid);
		dto.setSales_date(date);
		dto.setPname(pname);
		dto.setSales_no(sales_no);
		
		SalesDAO dao = SalesDAO.getInstance();
		dao.salesInsert(dto);
		List<SalesDTO> list = dao.salesToday();
		int total = dao.totalToday();
		
		request.setAttribute("salesList", list);
		request.setAttribute("total", total);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("shop/shop_report.jsp");
		
		
		return forward;
	}

}
