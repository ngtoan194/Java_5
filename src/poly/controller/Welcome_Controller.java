package poly.controller;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
public class Welcome_Controller {

	@RequestMapping("")
	public String welcome() {

		return "pages/index";
	}
	
	@RequestMapping("index")
	public String index() {

		return "pages/index";
	}


}
