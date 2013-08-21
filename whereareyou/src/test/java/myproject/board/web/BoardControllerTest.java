package myproject.board.web;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JMock;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.web.bind.support.SimpleSessionStatus;

import anyframe.common.Page;
import myproject.domain.Board;
import myproject.domain.BoardId;

import myproject.board.service.BoardService;
import anyframe.common.util.SearchVO;

@RunWith(JMock.class)
public class BoardControllerTest {

    private BoardController controller;
    private String SUCCESS_CREATEVIEW = "genViewBoard";
    private String SUCCESS_CREATE = "redirect:/board.do?method=list";
    private String SUCCESS_GET = "genViewBoard";
    private String SUCCESS_UPDATE = "redirect:/board.do?method=list";
    private String SUCCESS_LIST = "genListBoard";
    private String SUCCESS_REMOVE = "redirect:/board.do?method=list";
    private Mockery context = new JUnit4Mockery();
    private BoardService mockService = null;
	
    @Before   
    public void setUp() throws Exception {
        System.setProperty("log4j.configuration", "log4j-test.xml");

        this.mockService = context.mock(BoardService.class);                
        this.controller = new BoardController();
        this.controller.setBoardService(this.mockService);       
    }
    
    public void setBoardController(BoardController controller) {
        this.controller = controller;
    }
        
    @Test
    public void testCreateView() throws Exception{
        String viewName = this.controller.createView(new ExtendedModelMap());
        
        assertEquals("returned correct view name", SUCCESS_CREATEVIEW, viewName);
   }
   
   @Test     
   public void testCreate() throws Exception{
		Board board = new Board();
		BoardId id = new BoardId();
        // add parameter for primary key and required fields
        id.setBoardId(new Integer(1481958975));	
        id.setBoardMasterId(new Integer(1290728921));	
    	board.setId(id);            
        board.setBoardName("XsEqUxQxRtQwYfSuDdAq");			
        board.setBoardTopics(new Integer(1923582408));			
        
        context.checking(new Expectations() {{
		       allowing(any(BoardService.class)).method("create");
		    }});
  		        
        String viewName = this.controller.create(board, new BeanPropertyBindingResult(board,"board"),new SimpleSessionStatus());               
        assertEquals("returned correct view name", SUCCESS_CREATE, viewName);
   }
   
   @Test
   public void testGet() throws Exception{
        final Board board = new Board();
		BoardId id = new BoardId();
        // add parameter for primary key
        id.setBoardId(new Integer(1675774509));	
        id.setBoardMasterId(new Integer(2039331814));	
        board.setId(id);   

        context.checking(new Expectations() {{
		       allowing(any(BoardService.class)).method("get");
		       will(returnValue(board));
		    }});

        String viewName = this.controller.get(board, new ExtendedModelMap());               
        assertEquals("returned correct view name", SUCCESS_GET, viewName);
    }
    
    @Test      
    public void testList() throws Exception{
        SearchVO searchVO = new SearchVO(); 
        
        // create Board List
        final Page page = new Page();
        List<Board> boardList = new ArrayList<Board>();
        boardList.add(new Board());
        boardList.add(new Board());
        page.setObjects(boardList);
        page.setTotalCount(2);

        context.checking(new Expectations() {{
		       allowing(any(BoardService.class)).method("getPagingList");
		       will(returnValue(page));
		    }});

        String viewName = this.controller.list(searchVO, new ExtendedModelMap());        
               
        assertEquals("returned correct view name", SUCCESS_LIST, viewName);
    }

    @Test
    public void testUpdate() throws Exception{
        Board board = new Board();
		BoardId id = new BoardId();
        
        // add parameter for primary key and required fields
        id.setBoardId(new Integer(150388700));	
        id.setBoardMasterId(new Integer(1145014431));	
        board.setId(id);
        board.setBoardName("CqNqViDqUgSxLtRmLbNk");
        board.setBoardTopics(new Integer(1736129659));
	       
        context.checking(new Expectations() {{
		       allowing(any(BoardService.class)).method("update");
		    }});
		
        String viewName = this.controller.update(board, new BeanPropertyBindingResult(board,"board"),new SimpleSessionStatus());               
        assertEquals("returned correct view name", SUCCESS_UPDATE, viewName);
   }
   
    @Test
    public void testRemove() throws Exception{
        Board board = new Board();
		BoardId id = new BoardId();
        
        // add parameter for primary key
        id.setBoardId(new Integer(437622852));	
        id.setBoardMasterId(new Integer(2006144957));	
        board.setId(id);

        context.checking(new Expectations() {{
		       allowing(any(BoardService.class)).method("remove");
			    }});
		
        String viewName = this.controller.remove(board);               
        assertEquals("returned correct view name", SUCCESS_REMOVE, viewName); 
   }
    
}