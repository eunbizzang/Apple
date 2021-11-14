package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.ProdDAO;
import com.shop.model.ProdDTO;
import com.shop.model.SalesDAO;
import com.shop.model.SalesDTO;

public class ShopReportAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		ProdDAO dao = ProdDAO.getInstance();
		List<ProdDTO> padlist = dao.getpadList();
		List<ProdDTO> pholist = dao.getpholist();
		List<ProdDTO> podlist = dao.getpodlist();
		List<ProdDTO> wchlist = dao.getwchlist();
		
		request.setAttribute("padlist", padlist);
		request.setAttribute("pholist", pholist);
		request.setAttribute("podlist", podlist);
		request.setAttribute("wchlist", wchlist);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/shop_report.jsp");
		
		return forward;
	}

}
