package com.lecto.forward.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lecto.forward.dto.ArticleDTO;
import com.lecto.forward.dto.BoardDTO;
import com.lecto.forward.dto.Criteria;
import com.lecto.forward.dto.PageMaker;
import com.lecto.forward.service.ArticleService;
import com.lecto.forward.service.BoardService;
import com.lecto.forward.vo.ArticleVO;
import com.lecto.forward.vo.BoardSearchVO;


@Controller
public class ArticleController{
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	BoardService boardService;
	

	
	
	
	/*@RequestMapping(value="/m_board2", method=RequestMethod.GET)
	public String articleListMem2(@RequestParam("boardCode") String boardCode, Model model, Criteria cri) {
		try {
			BoardDTO boardDTO = boardService.searchBoardCode(boardCode);
			String themeCode = boardDTO.getThemeCode();
			cri.setBoardCode(boardCode);
			model.addAttribute("boardCode", boardCode);
			model.addAttribute("themeCode",themeCode);
		
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);

		    List<ArticleVO> list = articleService.searchArticle(boardCode, cri);
			pageMaker.setTotalCount(articleService.listCountCriteria(boardCode));
			model.addAttribute("boardDTO",boardDTO);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
				
		return "/m_board2";
	}*/
	
	
	
	
	/** 글쓰기 페이지로 이동 */
	@RequestMapping(value="/m_addarticle", method=RequestMethod.GET)
	public String addArticleMemGET(String boardCode, Model model) {
		try {
 			model.addAttribute("boardCode",boardCode);
 			BoardDTO boardDTO = boardService.searchBoardCode(boardCode);
 			String themeCode = boardDTO.getThemeCode();
 			System.out.println("글쓰기"+themeCode);
 			model.addAttribute("themeCode",themeCode);
 		} catch (Exception e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 	
 		return "/m_writearticle";
	}
	
	/** 글 등록 */
	@RequestMapping(value="/m_addarticle", method=RequestMethod.POST)
	public String addArticleMemPOST(String boardCode, String articleTitle, String content, Model model, HttpSession session) {
		String memberId = (String)session.getAttribute("login");
		articleService.addArticle(new ArticleDTO("0", 0, articleTitle, content, false, "0", boardCode, memberId));
		
		/*List<ArticleVO> articleList = articleService.searchArticle(boardCode);
		model.addAttribute(articleList);*/ 
		Map<String, String> map = new HashMap<String, String>();
		map.put("success", "1");
		map.put("location","/m_board/?boardCode="+boardCode);
		map.put("boardCode", boardCode);
		
		return "redirect:/m_board/?boardCode="+boardCode;
	}	
	
	
	/** articleCode를 이용해 게시글 클릭후 상세보기에 사용할 데이터를 가져옴*/
	@RequestMapping(value="/m_detailarticle", method=RequestMethod.GET)
	public ModelAndView read(@RequestParam("boardCode") String boardCode,@RequestParam("articleCode")String articleCode,
			@RequestParam("page") int page, Model model, @ModelAttribute("cri")Criteria cri) {
		//articleCode로 boardCode를 찾아옴
		//page, perPageNum, 
		System.out.println("여기여기여기");
		System.out.println("boardCode"+boardCode);
		
	
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/m_detailarticle");

		ArticleVO articleVO = articleService.searchArticle(articleCode, 1);
		
		if(articleVO != null) {
			//조회수 처리
			mav.addObject("articleVO", articleVO);		
			mav.addObject("page",page);
			BoardDTO boardDTO;
			try {		
				boardDTO = boardService.searchBoardCode(boardCode);				
				String themeCode = boardDTO.getThemeCode();
				mav.addObject("boardCode",boardCode);
				mav.addObject("themeCode", themeCode);
				mav.addObject("articleCode", articleCode);
			} catch (Exception e) {			
				e.printStackTrace();
 			}
 		}else {
 			mav.addObject("error", "No Data");
 			mav.setViewName("/m_board");
 		}
 		return mav;	
 	}
	
	/**게시글 수정 버튼 클릭*/
	@RequestMapping(value="/m_modifyArticle", method=RequestMethod.GET)
	public String modifyArticle(@RequestParam("boardCode") String boardCode, @RequestParam("page") int page,
			@RequestParam("articleCode") String articleCode, Model model, @ModelAttribute("cri")Criteria cri) {
		System.out.println("여기서의보드코드:"+boardCode);
		ArticleVO articleVO = articleService.searchArticle(articleCode, 1);
		model.addAttribute("ArticleVO",articleVO );
		model.addAttribute("boardCode",boardCode);
		model.addAttribute("page",page);
		model.addAttribute("articleCode",articleCode);
		String themeCode;
		try {
			BoardDTO boardDTO = boardService.searchBoardCode(boardCode);
			themeCode = boardDTO.getThemeCode();
			System.out.println("수정하기의 테마코드:"+themeCode);
			model.addAttribute("themeCode", themeCode);
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		
		
		return "m_modifyArticle";
	}
	
	/**게시글 수정 버튼 클릭 후 자세히 보기*/
	@RequestMapping(value="/m_modifyArticle", method=RequestMethod.POST)
	public String modifyArticle(ArticleVO articleVO, HttpServletRequest req, HttpSession session, int page) {

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String boardCode = articleVO.getBoardCode();
		
		ArticleVO searchArticleVO = articleService.searchArticle(articleVO.getArticleCode(), 1);
		
		String userId = searchArticleVO.getMemberNickname();
		System.out.println("user아이디는"+userId);
		System.out.println(req.getParameter("articleContent"));
		ArticleDTO articleDTO = new ArticleDTO();
		articleDTO.setArticleCode(req.getParameter("articleCode"));
		articleDTO.setArticleContent(req.getParameter("articleContent"));
		articleDTO.setArticleDate(sdf.format(date));
		/*articleDTO.setArticleHits((int)req.getAttribute("articleHits"));*/
		articleDTO.setArticleTitle(req.getParameter("articleTitle"));
		articleDTO.setBoardCode(boardCode);
		articleDTO.setMemberId(userId);
		articleDTO.setNotice(searchArticleVO.getNotice());
		System.out.println("업데이트는 돼냐?");
		boolean flag = articleService.updateArticle(articleDTO);
		
		System.out.println(flag);
		/*String boardTheme;*/
		try {
			BoardDTO board = boardService.searchBoardCode(boardCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(boardCode+","+page);
		return "redirect:/m_board?boardCode="+boardCode+"&page="+page; 
	}
	
	/*게시글 삭제*/
	@RequestMapping(value="/m_deleteArticle", method=RequestMethod.POST)
	public String deleteArticleMem(String articleCode, String boardCode, Model model, Criteria cri) {
		//System.out.println("m_deleteArticle 호출!!!!!!!!!!!!!!!!!!!!");
		List<ArticleVO> articles = null;
		model.addAttribute("boardCode", boardCode);
		if(articleCode == null) {
			articleService.deleteArticle(articleCode);
			articles = articleService.searchArticle(boardCode, cri);
			
			return "redirect:/m_board";
		}
		
		boolean flag = articleService.deleteArticle(articleCode);
		if(flag) {
			System.out.println("삭제 완료");
		}
		
		articles = articleService.searchArticle(boardCode, cri);

		model.addAttribute("articles", articles);
		return "redirect:/m_board";
	}
	
 	
	/* boardCode, searchWay, keyword를 가지고 게시글을 검색 */
	@RequestMapping(value="/m_board/search", method=RequestMethod.GET)
	public String searchArticleMem(@RequestParam("themeCode")String themeCode, @RequestParam("boardName") String boardName, @RequestParam("searchWay") String searchWay,
			@RequestParam("keyword") String keyword,@ModelAttribute Criteria cri, Model model) {		
		System.out.println("keyword : "+keyword + " selectBoardName :  " + boardName + " searchWay : " + searchWay + "keyword : " + keyword+ "cri : "+ cri);
		BoardDTO boardDTO = null;
		try {
			System.out.println(boardName);
			boardDTO = boardService.searchBoardName(boardName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("themeCode", themeCode);
		String boardCode = boardDTO.getBoardCode();
		System.out.println(boardCode + "******" + searchWay + "********" + keyword);
	
		List<ArticleVO> list = articleService.searchArticle(boardCode, searchWay, keyword, cri);
		for(ArticleVO vo :list) {
			System.out.println(vo.toString());
		}
		model.addAttribute("list", list);
		model.addAttribute("boardCode", boardCode);
		
		model.addAttribute("boardName", boardName);
		model.addAttribute("cri",cri);
		model.addAttribute("page",1);
		return "/m_board";
		/*return "/index";*/
	}
	
	@RequestMapping(value="/m_board", method=RequestMethod.GET)
	public String articleListMem(@RequestParam("boardCode") String boardCode, Model model, @ModelAttribute Criteria cri) {
		try {
			BoardDTO boardDTO = boardService.searchBoardCode(boardCode);
			String themeCode = boardDTO.getThemeCode();
			cri.setBoardCode(boardCode);
			model.addAttribute("boardCode", boardCode);
			model.addAttribute("themeCode",themeCode);
			model.addAttribute("boardList", boardService.searchBoardDTO());
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);

		    List<ArticleVO> list = articleService.searchArticle(boardCode, cri);
			pageMaker.setTotalCount(articleService.listCountCriteria(boardCode));
			model.addAttribute("boardDTO",boardDTO);
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pageMaker);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
				
		return "/m_board";
	}
	
	
	
	
	/*boardCode를 이용해 게시판별 게시글목록을 가져옴
	@RequestMapping(value="/a_articlelist", method=RequestMethod.POST)
	public String articleListAdmin(@RequestParam("boardCode") String boardCode, @RequestParam("page") int page, Criteria cri, @RequestParam("selectBoardName") String selectBoardName, @RequestParam("selectBoardCode") String selectBoardCode, Model model) {   
		try {
			BoardDTO boardDTO;
 			boardDTO = boardService.searchBoardCode(boardCode);
 			String themeCode = boardDTO.getThemeCode();
 			cri.setBoardCode(boardCode);
			model.addAttribute("selectBoardCode", selectBoardCode);
			model.addAttribute("selectBoardName", selectBoardName);
			
			PageMaker pageMaker = new PageMaker();
 			pageMaker.setCri(cri);
 			List<ArticleVO> searchTotalArticle = articleService.searchArticle(boardCode);
 			int totalCount = searchTotalArticle.size();
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("articles", articleService.searchArticle(boardCode));
			
			model.addAttribute("pageMaker", pageMaker);
			
			page = pageMaker.getCri().getPage();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/m_board";
	}*/
	
	////////////////////////////////////////////////다미다미 2018-08-27 //////////////////////////////////////////////////////
		
	/* boardCode, searchWay, keyword를 가지고 게시글을 검색 */
	@RequestMapping(value="/a_articlelist/search", method=RequestMethod.GET)
	public String searchArticleAdmin(@RequestParam("selectBoardName") String selectBoardName, @RequestParam("searchWay") String searchWay,
			@RequestParam("keyword") String keyword, Criteria cri, Model model) {		
	
		BoardDTO boardDTO = null;
		try {
			System.out.println(selectBoardName);
			boardDTO = boardService.searchBoardName(selectBoardName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String boardCode = boardDTO.getBoardCode();
		System.out.println(boardCode + "******" + searchWay + "********" + keyword);
	
		List<ArticleVO> list = articleService.searchArticle(boardCode, searchWay, keyword, cri);
		for(ArticleVO vo :list) {
			System.out.println(vo.toString());
		}
		model.addAttribute("articlelist", list);
		model.addAttribute("selectBoardCode", boardCode);
		model.addAttribute("selectBoardName", selectBoardName);
		return "/a_articlelist";
	}
	
	/*boardCode를 이용해 게시판별 게시글목록을 가져옴*/
	@RequestMapping(value="/a_articlelist", method=RequestMethod.GET)
	public String articleListAdmin(String selectBoardName, Criteria cri, Model model) {   
			BoardDTO boardDTO = null;
		try {
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    
			boardDTO = boardService.searchBoardName(selectBoardName);
			String boardCode = boardDTO.getBoardCode();
			model.addAttribute("selectBoardCode", boardCode);
			model.addAttribute("selectBoardName", selectBoardName);
		    cri.setBoardCode(boardCode);
		    List<ArticleVO> list = articleService.searchArticle(boardCode, cri);
		    System.out.println(pageMaker.getEndPage()+"***********************************************************");
		    if(list.size() != 0 && list != null) {
				pageMaker.setTotalCount(articleService.listCountCriteria(boardCode));
			} else {
				pageMaker.setTotalCount(1);
			}
		    List<BoardDTO> boardList = boardService.searchBoardDTO();
		    for(BoardDTO dto:boardList) {
		    	System.out.println(dto.toString());
		    }
		    model.addAttribute("boardList", boardList);
			model.addAttribute("articlelist", list);
			model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/a_articlelist";
	}
	
	/*articleCode를 이용해 게시글 클릭후 상세보기에 사용할 데이터를 가져옴*/
	@RequestMapping(value="/a_detailarticle", method=RequestMethod.GET)
	public String readArticleAdmin(String selectBoardName, String selectArticleCode, Model model, Criteria cri) {
		
		model.addAttribute("selectBoardName",selectBoardName);
		model.addAttribute("article", articleService.searchArticle(selectArticleCode, 1));
		return "/a_detailarticle";
	}
	
	/* 글쓰기 페이지로 이동 */
	@RequestMapping(value="/a_addarticle", method=RequestMethod.GET)
	public String addArticleAdminGET(String selectBoardName, Model model) {
	
		model.addAttribute("selectBoardName",selectBoardName);
	
		return "/a_addarticle";
	}
	
	/* 글 등록 */
	@RequestMapping(value="/a_addarticle", method=RequestMethod.POST)
	public String addArticleAdminPOST(@RequestParam("selectBoardName")String selectBoardName, ArticleDTO articleDTO, Model model, HttpSession session) {
	
		String memberId = (String)session.getAttribute("login");
	
		BoardDTO boardDTO = null;
		try {
			boardDTO = boardService.searchBoardName(selectBoardName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String boardCode = boardDTO.getBoardCode();
		String articleCode = articleService.addArticle(new ArticleDTO("0", 0, articleDTO.getArticleTitle(), articleDTO.getArticleContent(), articleDTO.getNotice(), "0", boardCode, memberId)); 
		
		model.addAttribute("article", articleService.searchArticle(articleCode, 1));
		model.addAttribute("articleCode", articleCode);
		model.addAttribute("selectBoardCode", boardCode);
		model.addAttribute("selectBoardName", selectBoardName);
		
		return "redirect:/a_articlelist";
	}
	
	/* 게시글 수정버튼 클릭시 페이지 이동 */
	@RequestMapping(value="/a_editarticle", method=RequestMethod.GET)
	public String updateArticleAdminGet(ArticleVO articleVO, String selectBoardName, Model model, @ModelAttribute("cri")Criteria cri) {
	
		model.addAttribute("selectBoardName",selectBoardName);
		model.addAttribute("articleVO", articleService.searchArticle(articleVO.getArticleCode(), 1));
	
		return "/a_editarticle";
	}
	
	/*게시글 수정*/
	@RequestMapping(value="/a_editarticle", method=RequestMethod.POST)
	public String updateArticleAdminPOST(ArticleVO articleVO, String selectBoardName, Model model, Criteria cri) {
		BoardDTO boardDTO = null;
		try {
			boardDTO = boardService.searchBoardName(selectBoardName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String boardCode = boardDTO.getBoardCode();
		ArticleVO vo = articleService.searchArticle(articleVO.getArticleCode(), 1);
		articleService.updateArticle(new ArticleDTO(articleVO.getArticleCode(), vo.getArticleHits(),
		articleVO.getArticleTitle(), articleVO.getArticleContent(), articleVO.getNotice(), "0", boardCode, vo.getMemberNickname())); 
		
//		model.addAttribute("article", articleVO);
//		model.addAttribute("articleCode", articleVO.getArticleCode());
		
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());
	
		model.addAttribute("selectBoardCode", boardCode);
		model.addAttribute("selectBoardName", selectBoardName);
		
		return "redirect:/a_articlelist";
	}
	
	/* 게시글 삭제 */
	@RequestMapping(value="/a_articlelist/deleteone", method=RequestMethod.GET)
	public String deleteArticleAdmin(@RequestParam("articleCode") String articleCode,
			@RequestParam("selectBoardName") String selectBoardName, Model model, Criteria cri) {
		System.out.println(articleCode);
		if(!articleService.deleteArticle(articleCode)){
			model.addAttribute("msg", "FAIL");
			System.out.println("삭제 실패인데");
		} else{
			model.addAttribute("msg", "SUCCESS");
			System.out.println("삭제 성공인데");
		}
		return articleListAdmin(selectBoardName, cri, model);
	}
	
	/* 게시글들 삭제 */
	@RequestMapping(value="/a_articlelist/delete", method=RequestMethod.POST)
	public String deleteArticlesAdmin(@RequestParam("chk") String[] articleCodes, @RequestParam("selectBoardCode") String selectBoardCode,
	@RequestParam("selectBoardName") String selectBoardName, Model model, Criteria cri) {
	
		System.out.println(selectBoardName);
		if(!articleService.deleteArticles(articleCodes)){
			//model.addAttribute("msg", "FAIL");
			System.out.println("삭제 실패인데");
		} else{
			//model.addAttribute("msg", "SUCCESS");
			System.out.println("삭제 성공인데");
		}
		
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPageNum", cri.getPerPageNum());;
		
		model.addAttribute("selectBoardCode", selectBoardCode);
		model.addAttribute("selectBoardName", selectBoardName);
		return "redirect:/a_articlelist";
	}
	
	//
	///*관리자 - 메인화면에서 공지 목록, 운영자목록 출력
	//운영자 - 메인화면에서 공지 목록, 최신목록 출력*/
	@RequestMapping(value="/m_writearticle", method=RequestMethod.POST)
		public String adminMain() {
		
		return "/a_main";
	}
}
