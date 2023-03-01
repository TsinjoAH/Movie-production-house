package com.management.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {


    @GetMapping("/")
    public String index () {
        return "index";
    }

    @GetMapping("list")
    public String list () {
        return "scenes/list";
    }

}
