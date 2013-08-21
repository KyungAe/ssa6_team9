package myproject.board.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.common.util.StringUtil;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;
import anyframe.common.util.SearchVO;

import myproject.domain.Board;
import myproject.domain.BoardId;

/**
 * BoardDao implementation class with QueryService
 *
 */
@Repository("boardDao")
public class BoardDao extends AbstractDAO {
  
  	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;
		
	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}
	
	public void create(Board board) throws Exception {
		super.create("Board", board);
	}
	
	public void remove(BoardId id) throws Exception {
		Board board = new Board();        
    	board.setId(id);    
		super.remove("Board", board);
	}

	public void update(Board board) throws Exception {
		super.update("Board", board);
	}

	public Board get(BoardId id) throws Exception {
		Board board = new Board();		
		board.setId(id);
				
		return (Board) super.findByPk("Board", board);
	}
	
	public Page getPagingList(SearchVO searchVO) throws Exception {
        int pageIndex = searchVO.getPageIndex();

        String searchCondition = StringUtil.null2str(searchVO.getSearchCondition());
        String searchKeyword = StringUtil.null2str(searchVO.getSearchKeyword());
        String isNumeric = StringUtil.isNumeric(searchKeyword) ? "true" : "false";
        
        Object[] args = new Object[4];		            
        args[0] = "condition=" + searchCondition;
        args[1] = "keywordStr=%" + searchKeyword + "%";
        args[2] = "keywordNum=" + searchKeyword + "";
        args[3] = "isNumeric=" + isNumeric;

        return super.findListWithPaging("Board", args, pageIndex, pageSize, pageUnit);
	}    
}