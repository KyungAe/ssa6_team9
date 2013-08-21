package myproject.board.service;

import anyframe.common.Page;
import anyframe.common.util.SearchVO;
import myproject.domain.Board;
import myproject.domain.BoardId;

/**
 * BoardService interface.
 */
public interface BoardService{

  	void create(Board board) throws Exception;
	
	void remove(BoardId id) throws Exception;
		
	void update(Board board) throws Exception;
	
  	Board get(BoardId id) throws Exception;
	
	Page getPagingList(SearchVO searchVO) throws Exception;        
}