package com.admin.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.goods.db.AdminGoodsDAO;

public class AdminGoodsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		ActionForward forward = new ActionForward();
		if (userId == null || !userId.equals("admin")) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}	
		
		int pageSize = 10;

		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){pageNum = "1";}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		AdminGoodsDAO agdao = new AdminGoodsDAO();
		List goodsList = agdao.getGoodsList(startRow,pageSize);
		request.setAttribute("goodsList", goodsList);
		
		int cnt = agdao.getGoodsCount();
		request.setAttribute("cnt", cnt);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startRow", startRow);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);		
		
		forward.setPath("./admingoods/admin_goods_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
