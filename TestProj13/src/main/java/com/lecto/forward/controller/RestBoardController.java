package com.lecto.forward.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lecto.forward.dto.BoardDTO;
import com.lecto.forward.dto.MemberDTO;
import com.lecto.forward.service.ArticleService;
import com.lecto.forward.service.BoardService;
import com.lecto.forward.service.MemberService;
import com.lecto.forward.vo.ArticleVO;
import com.lecto.forward.vo.BoardSearchVO;

@RestController

public class RestBoardController {

	@Autowired
	BoardService boardService;

	@Autowired
	ArticleService articleService;
	
//	@Autowired
//	MemberService memberService;
	
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public JSONObject login(String[] loginInfo) throws Exception{
//		MemberDTO member = memberService.searchMember(loginInfo[0]);
//		JSONObject json = new JSONObject();
//		if(member.getMemberPwd().equals(loginInfo[1])) {
//			json.put("memberId", member.getMemberId());
//			json.put("memberPwd",member.getMemberPwd());
//		}else {
//			return null;
//		}
//		return json;
//	}
	
	/**���ǳʿ� ���� �Խ��� ���*/
	@RequestMapping(value="/boardList", method=RequestMethod.POST)
	public JSONObject boardList() throws Exception{
		System.out.println("get 으로 넘어옴");
		List<BoardSearchVO> list = boardService.searchBoard();
		System.out.println(list.size());
		JSONArray array = new JSONArray();
		JSONObject returnval= new JSONObject();
		for(int i=0;i<list.size();i++) {
			JSONObject jobj = new JSONObject();
			jobj.put("boardCode",list.get(i).getBoardCode());	
			jobj.put("boardName", list.get(i).getBoardName());
			jobj.put("memberId", list.get(i).getMemberId());
			jobj.put("themeName",list.get(i).getThemeName());
			array.add(jobj);	
		}
		returnval.put("item",array);
		return returnval;
	}
	
	@RequestMapping(value="/boardList2", method=RequestMethod.GET)
	public JSONObject boardList2() throws Exception{
		System.out.println("get 으로 넘어옴");
		List<BoardSearchVO> list = boardService.searchBoard();
		JSONArray array = new JSONArray();
		JSONObject returnval= new JSONObject();
		for(int i=0;i<list.size();i++) {
			JSONObject jobj = new JSONObject();
			jobj.put("boardCode",list.get(i).getBoardCode());	
			jobj.put("boardName", list.get(i).getBoardName());
			jobj.put("memberId", list.get(i).getMemberId());
			jobj.put("themeName",list.get(i).getThemeName());
			array.add(jobj);	
		}
		returnval.put("item",array);
		return returnval;
		
	}
	
	
	/**article �󼼺���*/
	@RequestMapping(value="/articleDetail/{articleCode}", method=RequestMethod.POST)
	public  JSONObject articleDetail(@PathVariable("articleCode")String articleCode) throws Exception{
		System.out.println("아티클 디테일: "+articleCode);
		ArticleVO article = articleService.searchArticle(articleCode, 1);
		System.out.println(article);
		JSONObject json = new JSONObject();
		json.put("boardCode",article.getBoardCode());
		json.put("memberNickname", article.getMemberNickname());
		json.put("articleHits",article.getArticleHits());
		json.put("articleTitle", article.getArticleTitle());
		json.put("articleContent", article.getArticleContent());
		json.put("articleCode", article.getArticleCode());
		json.put("articleDate", article.getArticleDate());
		json.put("notice",article.getNotice());
		json.put("commentCnt",article.getCommentCnt());
		
		return json;
	}
	
	/**�Խñ� ��� ����*/
	@RequestMapping(value="/articleList/{boardName}" ,method=RequestMethod.POST)
	public JSONObject articleList(@PathVariable("boardName")String boardName) throws Exception{
		
		System.out.println("아티클 리스트"+boardName);
		BoardDTO boardDTO =boardService.searchBoardName(boardName);
		List<ArticleVO> articleList = articleService.searchArticle(boardDTO.getBoardCode());
		JSONObject returnval = new JSONObject();
		JSONArray array = new JSONArray();
		for(int i=0;i<articleList.size();i++) {
			JSONObject json = new JSONObject();
			json.put("articleTitle", articleList.get(i).getArticleTitle());
			json.put("memberNickname", articleList.get(i).getMemberNickname());
			json.put("articleDate", articleList.get(i).getArticleDate());
			json.put("articleCode", articleList.get(i).getArticleCode());
			json.put("articleHits", articleList.get(i).getArticleHits());
			json.put("boardCode", articleList.get(i).getBoardCode());
			json.put("articleContent", articleList.get(i).getArticleContent());
			json.put("notice", articleList.get(i).getNotice());
			json.put("commentCnt", articleList.get(i).getCommentCnt());
			
			array.add(json);
		}
		returnval.put("articleList",array);
		
		
		return returnval;
	}
}

