package myproject.board.web;

import javax.inject.Inject;
import javax.inject.Named;

import myproject.domain.Board;
import myproject.board.service.BoardService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;


import anyframe.common.Page;
import anyframe.common.util.SearchVO; 

/**
 * Controller for Board
 */
@Controller
@RequestMapping("/board.do")
public class BoardController {

	@Inject
	@Named("boardService")
    private BoardService boardService;
    
    public void setBoardService(BoardService boardService) {
        this.boardService = boardService;
    }
        
    @RequestMapping(params = "method=createView") 
    public String createView(Model model) throws Exception {  
    	model.addAttribute(new Board());
        return "genViewBoard" ;                   
    }
    
    @RequestMapping(params = "method=create")  
    public String create(Board board, BindingResult results, SessionStatus status) throws Exception {
    	
    	if (results.hasErrors()) {
			return "genViewBoard";
		}
		
        boardService.create(board);   
        status.setComplete();
             
        return "redirect:/board.do?method=list";        
    }

    @RequestMapping(params = "method=get")    
    public String get( @ModelAttribute("inputBoard")Board board 
    						, Model model) throws Exception { 	
       board = boardService.get(board.getId());        	
       model.addAttribute("board", board);    
 	
       return "genViewBoard";
    }
     
    @RequestMapping(params ="method=update") 
    public String update(Board board, BindingResult results, SessionStatus status) throws Exception {
    
    	if (results.hasErrors()) {
			return "genViewBoard";
		}
		    	
        boardService.update(board);   
        status.setComplete();
                 	
        return "redirect:/board.do?method=list";
    }
    
    @RequestMapping(params = "method=list")  
    public String list(@ModelAttribute("search") SearchVO searchVO, Model model) throws Exception {
        
        Page resultPage = boardService.getPagingList(searchVO);

		model.addAttribute("boardList", resultPage.getList());
        model.addAttribute("size", resultPage.getTotalCount());
        model.addAttribute("resultPage", resultPage);
		        
        return "genListBoard";        
    }
    
    @RequestMapping(params = "method=remove") 
    public String remove(Board board) throws Exception {
    	                                 
        boardService.remove(board.getId());
		
        return "redirect:/board.do?method=list";
    }    
}
