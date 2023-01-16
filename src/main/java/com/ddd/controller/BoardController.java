package com.ddd.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ddd.domain.CommunityBoardVO;
import com.ddd.domain.DiaryBoardVO;
import com.ddd.service.BoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/board/*")
@Controller
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	
	// 커뮤니티 글 목록 
	@GetMapping("/community")
	public void getList() {
		log.info("getList() 호출 - 커뮤니티 게시글 목록 호출 ");
	}
	
	// 커뮤니티 글 작성 GET
	@GetMapping("/communitywrite")
	public void getCommunitywrite() {
		log.info("getCommunitywrite() 호출 - 커뮤니티 게시글쓰기 호출 ");
	}
	
	// 커뮤니티 글 작성 POST
	@PostMapping("/communitywrite")
	public String postCommunitywrite(CommunityBoardVO vo) throws Exception {
		log.info("postCommunitywrite() 호출 - 커뮤니티 게시글쓰기 호출 ");
		service.insert(vo);
		return "redirect:/board/community";
	}
	
	
	// 일기 글 목록
	@GetMapping("/mydiary")
	public void getMydiary(Principal principal, Model model) throws Exception {
		log.info("getMydiary()  호출 - 일기장 호출 ");
		String userid = principal.getName();
		
		log.info("@@사용자는 누구?@@" +	userid );
		
		List<DiaryBoardVO> boardList = service.getListD(userid);
		int total = service.total(userid);
		
		log.info("안담겻나?????"+boardList+"////// 글 개수 : "+total);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("total",total);
		
	}
	
	// 일기 글 상세
	@GetMapping("/mydiaryread")
	public void getMydiaryread(@RequestParam("dno") Integer dno, Model model) throws Exception {
		log.info("getMydiaryread() 호출 - 일기 글 상세");
		log.info(dno+"----------------------------dno");
		log.info("글 상세 정보 == "+service.readD(dno));
		model.addAttribute("vo", service.readD(dno));
	}
	
	
	
	// 일기 글 작성 GET
	@GetMapping("/mydiarywrite")
	public void getMydiarywrite() {
		log.info("getMydiarywrite()  호출 - 일기장 쓰기 호출 ");
	}
	
	// 일기 글 작성 POST
	@PostMapping("/mydiarywrite")
	public String postMydiarywrite(DiaryBoardVO vo) throws Exception {
		log.info("postMydiarywrite()  호출 - 일기장 쓰기 호출 ");
		service.insertD(vo);
		
		return "redirect:/board/mydiary";
	}
	
	
	// 일기 글 수정 GET : 기존 정보 출력 + 수정할 정보 입력 
	@GetMapping("/mydiaryupdate")
	public void getMydiaryupdate(@RequestParam("dno") int dno, Model model) throws Exception {
		log.info("getMydiaryupdate() 호출 - 일기 수정 ");
		log.info("게시글 넘버는 ?? "+dno);
		model.addAttribute("vo",service.readD(dno));
		log.info("getMydiaryupdate() 호출 - 일기 수정 완료 @@ ");
	}
	
	
	
	
	// 일기 글 수정 POST
	@PostMapping("/mydiaryupdate")
	public String posttMydiaryupdate(DiaryBoardVO vo) throws Exception {
		log.info("postMydiaryupdate() 호출 - 일기 수정 ");
		log.info("수정할 정보"+vo);
		
		int cnt = service.updateD(vo);
		log.info("게시글 수정 완료 !!!!!!!!!!!!!!!!!!!!!!!");

		return "redirect:/board/mydiary";
		
	}
	
	// 일기 글 삭제 GET
	@GetMapping("/mydiarydelete")
	public String deleteGET(@RequestParam("dno")int dno, RedirectAttributes rttr) throws Exception {
		log.info("deleteGET() 호출 --  다이어리 글 삭제 ");
		log.info("삭제할 게시글 넘버?? "+dno);
		service.deleteD(dno);
		log.info("게시글 삭제 완료 !!!!!!!!!!!!!!!!!!!!!!!");
		return "redirect:/board/mydiary";
	}
	
	
	
	
	
}
