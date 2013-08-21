package myproject.board.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.common.Page;
import anyframe.common.util.SearchVO;

import myproject.domain.Board;
import myproject.domain.BoardId;

import myproject.board.service.BoardService;

/**
 * BoardService implementation class
 */
@Service("boardService")
@Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	       
    @Inject
    @Named("boardDao")
	private BoardDao boardDao;	
	
	public void update(Board board) throws Exception {
    	this.boardDao.update(board);
	}    
    
  	public Board get(BoardId id) throws Exception {
		return this.boardDao.get(id);
	}
    
  	public void remove(BoardId id) throws Exception {
    	this.boardDao.remove(id);
	}    
    
  	public void create(Board board) throws Exception {
    	this.boardDao.create(board);
	}
		    
	public Page getPagingList(SearchVO searchVO) throws Exception {
		return this.boardDao.getPagingList(searchVO);
	}              
}