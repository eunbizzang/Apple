package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.SalesDAO;

public class ShopReportDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String shopid = (String)session.getAttribute("shopid");
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		SalesDAO dao = SalesDAO.getInstance();
		String pnum = dao.getPnum(no);
		int check = dao.deleteSales(no);
		
		ActionForward forward = new ActionForward();

		PrintWriter out = response.getWriter();
		
		
		if(check > 0) {
			dao.updateSalesNo(no);
			dao.plusPno(pnum, shopid, no);
			forward.setRedirect(true);
			forward.setPath("shop_report.do");
		}else {
			out.println("<script>");
			out.println("alert('상품 삭제 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}