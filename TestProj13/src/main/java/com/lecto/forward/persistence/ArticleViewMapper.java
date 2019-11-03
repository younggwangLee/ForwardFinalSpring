package com.lecto.forward.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lecto.forward.dto.Criteria;
import com.lecto.forward.vo.ArticleVO;


public interface ArticleViewMapper {
  
	/** @param cri */
	public List<ArticleVO> searchArticle(@Param("boardCode") String boardCode, @Param("cri") Criteria cri) throws Exception;  
	/** @param cri */
	public List<ArticleVO> searchArticles(@Param("boardCode") String boardCode) throws Exception;

	/** @param cri */
	public List<ArticleVO> searchArticleKeyword(@Param("boardCode")String boardCode, @Param("searchWayCode")String searchWayCode, @Param("keyword")String keyword, @Param("cri") Criteria cri) throws Exception;  //@Param("boardCode")
	
	public List<ArticleVO> searchNotice(boolean notice) throws Exception;
	
	public ArticleVO searchArticleView(ArticleVO articleVO) throws Exception;
	
	public List<ArticleVO> searchArticleViews(List<ArticleVO> articles) throws Exception;
	/** articleCode*/
	public ArticleVO searchArticleCode(String articleCode) throws Exception;
	
	public List<String> searchArticleByDate(@Param("boardCode")String boardCode) throws Exception;
	
	public Integer searchArticleByMonth(@Param("boardCode")String boardCode, @Param("criteriaDate")String criteriaDate) throws Exception;
	
	public List<ArticleVO> listCriteria(Criteria cri)throws Exception;

	public int countPaging(@Param("boardCode")String boardCode);
}
