package com.lecto.forward.service;

import java.util.List;

import com.lecto.forward.dto.ArticleDTO;
import com.lecto.forward.dto.Criteria;
import com.lecto.forward.vo.ArticleVO;

public interface ArticleService {
	public String addArticle(ArticleDTO articleDTO);
	public boolean updateArticle(ArticleDTO articleDTO);
	public boolean deleteArticle(String articleCode);
	public boolean deleteArticles(String[] articleCodes);
	public List<ArticleVO> searchArticle(String boardCode, String searchWay, String keyword, Criteria cri);
	public List<ArticleVO> searchArticle(String boardCode, Criteria cri);
	public List<ArticleVO> searchArticle(String boardCode);
	public ArticleVO searchArticle(String articleCode, int flag);
	public List<ArticleVO> listCriteria(Criteria cri);
	//public ArticleDTO searchArticle(String articleCode);
	public String generateCode();
	int listCountCriteria(String boardCode) throws Exception;
}
