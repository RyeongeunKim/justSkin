package com.goods.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.var.list.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class listDAO extends DBconnection{
	
	
	private ResultSet rs = null;
	private String sql = "";
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	varlist vars = new varlist();
	private String databasename = vars.getDatabasename();
	varlist var = new varlist();
	String tablename = var.getGoodslistTablename(); 
	
	DBconnection con = new DBconnection();
	setGoodsTool setTool = new setGoodsTool();
	
	public List getGoodsList() {
		List goodsList = new ArrayList();
		try {
			
			
			sql = "select * from "+tablename;
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				
				// 리스트 한칸에 상품 1개를 저장
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			closeDB();
		}

		return goodsList;
	}
	
	// getGoodsList() 검색창에 사용할 테이터 
	//*** 검색창에 넣은 string 값을 item 으로 받아오면 
	// item 의 값이 들어간 이름의 것을 출력해냄!
	public List getseGoodsList(String item ) {

		// item에 따라서 다른 결과를 처리
		// item - all/best/그외 카테고리
		List goodsList = new ArrayList();

		StringBuffer SQL = new StringBuffer();

		try {
			
			sql = "select * from "+ tablename +
					" where cosName like '%"+item+"%' or "
							+ " cosBrand like '%"+item+"%' or "
									+ " cosCategory like '%"+item+"%' ";
			System.out.println("sql = "+  sql);
			
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				// 리스트 한칸에 상품 1개를 저장
				
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			System.out.println("인젝션 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return goodsList;
	}

	// getGoodsList(item)
	public List getGoodsList(String item , String cat ,String skin) {

		// item에 따라서 다른 결과를 처리
		// item - all/best/그외 카테고리
		List goodsList = new ArrayList();

		StringBuffer SQL = new StringBuffer();
		
		try {
			if(item.equals("베스트")){
				sql ="select * from "+ tablename + " order by "
						+ "orderCount desc limit 0 , 10";
			}else{
				if(!cat.equals("all")){
					sql = "select * from "+tablename + 
							" where cosBrand = '" + cat+"'";
					}else if(!item.equals("all")){
						sql = "select * from "+tablename + 
								" where cosCategory = '" + item+"'";
						
					}else if(!skin.equals("all")){
						sql = "select * from "+tablename + 
								" where cosSkinType = '" + skin+"'";
					}
					else{
						sql = "select * from "+tablename;
					}
			}
			System.out.println(sql);
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				// 리스트 한칸에 상품 1개를 저장
				
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			System.out.println("인젝션 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return goodsList;
	}
	public List getGoodsList(String item , String cat ,String skin ,int startRow , int pageSize ) {

		// item에 따라서 다른 결과를 처리
		// item - all/best/그외 카테고리
		List goodsList = new ArrayList();

		StringBuffer SQL = new StringBuffer();
		
		try {
			if(item.equals("베스트")){
				sql ="select * from "+ tablename + " order by "
						+ "orderCount desc limit 0 , 10";
			}else{
				if(!cat.equals("all")){
					sql = "select * from "+tablename + 
							" where cosBrand = '" + cat+"' order by cosNum desc limit " + startRow +" , "+ pageSize;
					}else if(!item.equals("all")){
						sql = "select * from "+tablename + 
								" where cosCategory = '" + item+"' order by cosNum desc limit " + startRow +" , "+ pageSize;
						
					}else if(!skin.equals("all")){
						sql = "select * from "+tablename + 
								" where cosSkinType = '" + skin+"' order by cosNum desc limit " + startRow +" , "+ pageSize;
					}
					else{
						sql = "select * from "+tablename + "order by cosNum desc limit " + startRow +" , "+ pageSize;
					}
			}
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GoodsDTO goods = new GoodsDTO();
				
				goods = setTool.setdata(goods, rs);
				
				// 리스트 한칸에 상품 1개를 저장
				
				goodsList.add(goods);

			} // while

			System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

		} catch (SQLException e) {
			System.out.println("인젝션 에러");
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return goodsList;
	}
	// getGoodsList(item)
		public List getbestGoodsList() {

			// item에 따라서 다른 결과를 처리
			// item - all/best/그외 카테고리
			List goodsList = new ArrayList();

			StringBuffer SQL = new StringBuffer();
			
			try {
				
				sql ="select * from "+ tablename + " order by "
						+ "orderCount desc limit 0 , 10";
			
			
				
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					GoodsDTO goods = new GoodsDTO();
					
					goods = setTool.setdata(goods, rs);
					
					// 리스트 한칸에 상품 1개를 저장
					
					goodsList.add(goods);

				} 

				System.out.println("DAO : 상품 정보 저장 완료(일반사용자 상품 목록)");

			} catch (SQLException e) {
				System.out.println("인젝션 에러");
				e.printStackTrace();
			} finally {
				closeDB();
			}

			return goodsList;
		}

		
		public String[] getbrandGoodsList() {

			 String[] arr = new String[1];
			 List<String> testList = new ArrayList<String>();
			try {
				
				sql ="select distinct cosBrand from cos_list";
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					testList.add(rs.getString("cosBrand"));
				} 

				System.out.println("DAO : 브랜드 목록");

			} catch (SQLException e) {
				System.out.println("인젝션 에러");
				e.printStackTrace();
			} finally {
				closeDB();
			}
			arr = new String[ testList.size() ];
	        testList.toArray(arr);
			return arr;
		}
		public String[] getCateGoodsList() {

			 String[] arr = new String[1];
			 List<String> testList = new ArrayList<String>();
			try {
				
				sql ="select distinct cosCategory from cos_list";
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					testList.add(rs.getString("cosCategory"));
				} 

				System.out.println("DAO : 카테고리타입 목록");

			} catch (SQLException e) {
				System.out.println("인젝션 에러");
				e.printStackTrace();
			} finally {
				closeDB();
			}
			arr = new String[ testList.size() ];
	        testList.toArray(arr);
			return arr;
		}
		public String[] getSkinGoodsList() {

			 String[] arr = new String[1];
			 List<String> testList = new ArrayList<String>();
			try {
				
				sql ="select distinct cosSkinType from cos_list";
				conn = getConnection();
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					testList.add(rs.getString("cosSkinType"));
				} 

				System.out.println("DAO : 스킨타입 목록");

			} catch (SQLException e) {
				System.out.println("인젝션 에러");
				e.printStackTrace();
			} finally {
				closeDB();
			}
			arr = new String[ testList.size() ];
	        testList.toArray(arr);
			return arr;
		}
		protected Connection getConnection() {
			try {
				// Context 객체를 생성 (프로젝트 정보를 가지고있는객체)
				Context initCTX = new InitialContext();
				// DB연동 정보를 불러오기(context.xml)
				
				DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/"+ databasename);

				conn = ds.getConnection();

				System.out.println(" 드라이버 로드, 디비연결 성공! ");
				System.out.println(conn);

			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			setConn(conn);
			return conn;
		}
		public void closeDB() {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

}
