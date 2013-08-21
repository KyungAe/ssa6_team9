package com.sds.sweng.whereareyou;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("MainController")
public class MainController {

	
	/* 메인페이지 컨트롤러
	 * 
	 */
	
	@RequestMapping("/main.do")
	public String teamList (Model model) throws Exception {

		model.addAttribute("team1", "최해민");
		model.addAttribute("team2", "이재환");
		model.addAttribute("team3", "박종찬");
		model.addAttribute("team4", "김문정");
		
		return "mainPageView";
	}
	
	@RequestMapping("/game.do")
	public String naverPageView (Model model) throws Exception {	
		return "diceGameView";
	}
}
