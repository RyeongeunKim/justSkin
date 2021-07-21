package com.notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.noticeDTO;
import com.notice.db.setnoticetool;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.util.List;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;


import com.goods.db.GoodsDAO;
import com.goods.db.listDAO;

public class noticeUpdateProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("M : noticeUpdateProAction_execute() 호출 ");

		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 파라미터를 처리
		// item=best
		
		
		
		System.out.print("dao 호출");
		// 디비 처리 객체 GoodsDAO 생성
		NoticeDAO noti = new NoticeDAO();
		
		
		
		noticeDTO notit = new noticeDTO();
		String realPath = ".\\upload";
		Path directoryPath = Paths.get(realPath);

		
		try {
			// 디렉토리 생성
			Files.createDirectory(directoryPath);
			System.out.println(directoryPath + " 디렉토리가 생성되었습니다.");
			} catch (FileAlreadyExistsException e) {
			System.out.println("디렉토리가 이미 존재합니다");
			} catch (NoSuchFileException e) {
			System.out.println("디렉토리 경로가 존재하지 않습니다");
			}

			
		
		
		
		   System.out.println("실제 저장위치 : "+realPath);
		   
		   // 파일업로드 크기지정(10mb);
		   int maxSize = 10 * 1024 * 1024;
		  
		  
		 DefaultFileRenamePolicy pp = new  DefaultFileRenamePolicy();
		   
		   // 1) 파일업로드
		  MultipartRequest multi =
		            new MultipartRequest(
		            		request,
		            		realPath,
		            		maxSize,
		            		"UTF-8",
		            		 pp 
		            		);
		  
		
		   
		notit.setNoticeNum(Integer.parseInt(multi.getParameter("index")));
		notit.setNoticeTitle(multi.getParameter("title"));
		notit.setNoticeContent(multi.getParameter("content"));
		notit.setNoticeType(Integer.parseInt(multi.getParameter("imp2")));
		notit.setNoticeRealFileName(multi.getOriginalFileName("filename"));
		notit.setNoticeFile(multi.getFilesystemName("filename"));
		notit.setNoticeRealImgName(multi.getOriginalFileName("Imgname"));
		notit.setNoticeImg(multi.getFilesystemName("Imgname"));
		// List goodsList =  gdao.getGoodsList();
		// => Action 페이지에서 사용하는 경우
		System.out.println(notit.toString());
		noti.updateNotice(notit);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeuppro.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
