package com.dreamgo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dreamgo.domain.BlackListVO;
import com.dreamgo.domain.BoardVO;
import com.dreamgo.domain.ReportVO;
import com.dreamgo.domain.UserVO;
import com.dreamgo.service.AdminService;
import com.dreamgo.service.BoardService;
import com.dreamgo.util.PageMaker;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private BoardService boardService;
	
	@Inject
	private AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	//관리자페이지
	@RequestMapping("/index")
	public String index(){
		return "/admin/index";
	}
	
	//관리자 로그인
	@RequestMapping(value="/adLogin",method = RequestMethod.POST)
	public String adLogin(@ModelAttribute UserVO user,
						Model model,
						HttpSession session){
		
		logger.info("adLogin page called ");
		logger.info("email : "+user.getEmail());
		logger.info("password : "+user.getPassword());
		
		try {
			UserVO loginAdmin = adminService.adminLogin(user);
			if(loginAdmin.getNo()==1){
				//no가 1이면 관리자
				session.setAttribute("loginAdmin", loginAdmin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/users/1";
	}
	
	
	
	//게시판관리 페이지
	@RequestMapping("/board/{thisPage}")
	public String board(@PathVariable(value="thisPage") int thisPage,HttpServletRequest request,
			Model model){
		logger.info("admin_board page called !!");

		try {
			
			
			//총게시글 수
			int totalCount = boardService.totalCount();
			
			PageMaker pm = new PageMaker();
			pm.setThisPage(thisPage);
			pm.setTotalCount(totalCount);
			
			List<BoardVO> boardList = boardService.list(pm);
			model.addAttribute("boardList", boardList);
			model.addAttribute("pagination",pm.getAdminPagination(request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/board";
	}
	
	//회원 리스트 가져오기(회원관리 페이지)
	@RequestMapping("/users/{thisPage}")
	public String user(Model model,@PathVariable("thisPage") int thisPage){
		logger.info("admin_users page called !!");

		try {
		List<UserVO> userList = adminService.userList();
		model.addAttribute("userList", userList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return "/admin/users";
	}
	
	//신고관리 페이지
	@RequestMapping("/report/{thisPage}")
	public String report(Model model){
		logger.info("admin_report page called !!");
		try {
		List<ReportVO> reportList =	adminService.reportList();
		model.addAttribute("reportList", reportList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/admin/report";
	}
	
	//댓글관리 페이지
	@RequestMapping("/replies/{thisPage}")
	public String replies(){
		logger.info("admin_replies page called !!");
		
		return "/admin/replies";
	}
	
	//블랙리스트 페이지
	@RequestMapping("/blackList/{thisPage}")
	public String blackList(Model model){
		logger.info("admin_blackList page called !!");
		
		try {
			List<BlackListVO> blackList = adminService.blackList();
			model.addAttribute("blackList",blackList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "/admin/blackList";
	}
	
	//게시글 삭제
	@RequestMapping("/remove/{bno}")
	public String remove(@PathVariable("bno") int bno,
			@RequestHeader("referer") String referer){
		logger.info("remove page called !!");
		
	try {
		int result = adminService.admin_removeArticle(bno);
		logger.info("======================");
		if(result==1)logger.info("관리자가 삭제 성공");
		logger.info("======================");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		return "redirect:"+referer;
	}
	
	
	//게시글 구분 수정
	@RequestMapping(value="/modify",
			produces = "application/text; charset=utf8")
	public @ResponseBody String modify(@RequestHeader("referer") String referer,
			@RequestParam("bno") int bno,
			@RequestParam("type") char type){
		
			BoardVO board = new BoardVO();
			board.setBno(bno);
			board.setType(type);
		
		
			logger.info("bno : "+bno);
			logger.info("type : "+type);
		try {
			int result = adminService.admin_modifyArticle(board);
			logger.info("======================");
			if(result==1)logger.info("관리자가 게시글 구분 수정 완료 !");
			logger.info("======================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "수정되었습니다.";
		
	}
	
	//선택삭제
	@RequestMapping(value="/removeSelc",method = RequestMethod.POST)
	public String removeSelc(@RequestHeader("referer") String referer,
			@RequestParam("checkedBoard") List<Integer> checkedBoard){
		
		
		logger.info("removeSelc page called !");
		logger.info("checkBoardList : "+checkedBoard);
		try {
			
			
			int result = adminService.admin_removeCheck(checkedBoard);
			
			logger.info("======================");
			if(result==1)logger.info("관리자가 선택한 게시글 삭제 완료 !");
			logger.info("======================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:"+referer;
	}
	
	
	//회원리스트
	@RequestMapping("/user")
	public String userList(@RequestHeader("referer") String referer,
			Model model){
		
		return "redirect:"+referer;
	}
	
	//회원 권한 수정
	@RequestMapping(value="/modifyAuth",method = RequestMethod.POST,
					produces = "application/text; charset=utf8")
	public @ResponseBody String modifyAuth(@RequestParam("no") int no,
							@RequestParam("auth") String auth){
		
		logger.info("no : "+no);
		logger.info("auth : "+auth);
		UserVO user = new UserVO();
		user.setAuth(auth);
		user.setNo(no);
		
		try {
		int result =adminService.modifyAuth(user);
			logger.info("======================");
			if(result==1)logger.info("관리자가 수정한 회원 권한");
			logger.info("======================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "수정되었습니다.";
	}
	
	//회원 영구탈퇴
	@RequestMapping(value="/removeUser",method = RequestMethod.POST,
			produces = "application/text; charset=utf8")
	public @ResponseBody String removeUser(@RequestParam("no") int no,
			@RequestParam("email") String email){
		
		try {
			//회원 영구탈퇴
			adminService.removeUser(no,email);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("no : "+no);
		logger.info("email : "+email);
		return "영구탈퇴 되었습니다.";
	}
	
	//신고하기
	@RequestMapping("/report")
	public String doReport(@ModelAttribute ReportVO report,
			RedirectAttributes rttr,
			@RequestHeader("referer") String referer){
		
		logger.info("reporter : "+report.getReporter());
		logger.info("cause : "+report.getCause());
		logger.info("reportedBno : "+report.getReportedBno());
		logger.info("reportedTitle : "+report.getReportedTitle());
		logger.info("reportedWriter : "+report.getReportedWriter());
		
		String realCause = report.getCause().replaceAll("\r\n", "<br/>");
		report.setCause(realCause);
		
		try {
			int result = adminService.insertReport(report);
			logger.info("======================");
			if(result==1){
				logger.info("신고하기 성공!");
				rttr.addFlashAttribute("msg", "신고처리 되었습니다.");
			}else{
				rttr.addFlashAttribute("msg", "서버에 심각한 오류로 인해 실패하였습니다.");
			};
			logger.info("======================");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:"+referer;
	}
	
	//신고 처리
	@RequestMapping(value="/handlingReport",method = RequestMethod.POST,
			produces = "application/text; charset=utf8")
	public @ResponseBody String handlingReport(@RequestParam("no") int no){
		
		logger.info("no : "+no);
		
		try {
			adminService.CompleteReport(no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "처리되었습니다.";
	}

}
