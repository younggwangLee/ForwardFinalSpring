package com.lecto.forward.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lecto.forward.dto.BoardDTO;
import com.lecto.forward.dto.MemberDTO;
import com.lecto.forward.service.BoardService;
import com.lecto.forward.service.MemberService;
import com.lecto.forward.vo.ManagerVO;

@Controller
public class LoginController {

	@Inject
	private MemberService memberService;
	
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		List<BoardDTO> boardList = null;
		try {
			boardList = boardService.searchBoardDTO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("boardList", boardList);
		return "/login";
	}
	
	
	
	/** 로그인(관리자,운영자 / 회원) */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO member, Model model, HttpSession session) {
		session.removeAttribute("login");

		try {
			MemberDTO memberDTO = memberService.login(member.getMemberId());
			if (memberDTO != null) {
				if (memberDTO.getMemberPwd().equals(member.getMemberPwd())) {
					session.setAttribute("login", member.getMemberId());
					session.setAttribute("nickname", member.getMemberNickname());
					// 운영자 view에서 운영자
					System.out.println("b");

					// Object로 다찾아온다.
					Object[] managers = memberService.searchManager();
					Map<String, ManagerVO> managerIds = new HashMap<String, ManagerVO>();
					if (managers != null) {
						
						for (int i = 0; i < managers.length; i++) {
							managerIds.put(((ManagerVO) managers[i]).getMemberId(), (ManagerVO)managers[i]);
						}
					}

					// 관리자인 경우
					if (member.getMemberId().equals("admin")) {
						session.setAttribute("boardName", "전체 사이트");
						return "/a_main";
					}
					// 운영자인 경우
					else if (managerIds.containsKey((member.getMemberId()))) {
						session.setAttribute("boardName", managerIds.get(member.getMemberId()).getBoardName());
						return "/a_main";
					}
					// 사용자일 경우
					else {
						System.out.println("f");
						return "redirect:/index";
					}

				} else {
					model.addAttribute("error", "wrong_memberPwd");
					return "/login";
				}
			} else {
				model.addAttribute("error", "wrong_memberId");
				return "/login";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	/** 로그아웃 세션 정보 끊음 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("로그아웃 들어왓으");
		session.removeAttribute("login");

		return "redirect:/index";
	}

	/** 아이디,비밀번호찾기(메인에서 아이디/비번 찾기 페이지로 이동) */
	@RequestMapping(value = "/find_id_pwd", method = RequestMethod.GET)
	public String findIdPwdGET() {

		return "/find_id_pwd";
	}
}