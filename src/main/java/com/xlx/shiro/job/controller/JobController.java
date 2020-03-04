package com.xlx.shiro.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Job
 *
 * @author xielx at 2020/3/4 20:18
 */
@Controller
public class JobController {
    
    /**
     * 跳转job页面
     * @return html
     */
    @GetMapping("/job")
    public String jobHtml(){
        return "job/job/index";
    }
    
}
