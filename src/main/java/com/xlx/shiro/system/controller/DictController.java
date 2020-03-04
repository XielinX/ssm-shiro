package com.xlx.shiro.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 字典管理
 *
 * @author xielx at 2020/3/4 15:55
 */
@Controller
@RequestMapping("/dict")
public class DictController {
    
    /**
     * 跳转dict页面
     * @return html
     */
    @GetMapping("/")
    public String dictHtml(){
        return "system/dict/dict";
    }
}
