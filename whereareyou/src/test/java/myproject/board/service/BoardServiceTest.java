package myproject.board.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import javax.inject.Inject;
import javax.inject.Named;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import myproject.domain.Board;
import myproject.domain.BoardId;



/**
 * You have to set the db connection autocommit option true to run this testcase 
 * because the transaction is not applied to Dao classes.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:./src/main/resources/spring/context-*.xml" })
public class BoardServiceTest{
    
    @Inject
	@Named("boardService")
    private BoardService boardService;    

	@Test	 
	@Rollback(value=true)	    
    public void manageBoard() throws Exception {
        // 1. create a new board
        Board board = getBoard();

        if(boardService.get(board.getId()) != null)
			boardService.remove(board.getId());
			
        boardService.create(board);
        
        // 2. assert - create
		board = boardService.get(board.getId());
		assertNotNull("fail to fetch a board", board);
				
		// 3. update a title of board
        board.setBoardName("SnYxNaFyIkNtBqYiKdIr");
        board.setBoardTopics(new Integer(1723586518));
		boardService.update(board);

		// 4. assert - update
		board = boardService.get(board.getId());
		assertNotNull("fail to fetch a board", board);

		// 5. remove a board
		boardService.remove(board.getId());

		// 6. assert - remove
		board = boardService.get(board.getId());
		assertNull("fail to remove a board", board);  
      }
    
    private Board getBoard() throws Exception {
		Board board = new Board();
        // enter id fields        
        BoardId id = new BoardId();
        id.setBoardId(new Integer(581901922));            	
        id.setBoardMasterId(new Integer(527958524));            	
        board.setId(id);
       
        // enter all required fields
        board.setBoardName("EkJaRmYeYwPcTbYwDxWs");     
        board.setBoardTopics(new Integer(199466433));     

		return board;
	}
}