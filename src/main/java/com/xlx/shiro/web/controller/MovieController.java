package com.xlx.shiro.web.controller;

import com.xlx.shiro.common.util.HttpUtils;
import com.xlx.shiro.system.dto.ResultDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 电影
 *
 * @author xielx at 2020/2/17 20:57
 */
@Controller
public class MovieController {
    
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    /**
     * 跳转热门电影页面
     * @return hot.html
     */
    @GetMapping("/movie/hot")
    public String movieHotHtml(){
        return "web/movie/hot";
    }
    
    /**
     * 显示热门电影
     * @return dto
     */
    @GetMapping("/movie/getMovieHot")
    @ResponseBody
    public ResultDTO getHotMovieInfo(){
        try{
            String content = HttpUtils.sendSSLPost("", "");
            return ResultDTO.success(content);
        }catch (Exception e){
            logger.error("");
            return ResultDTO.failed("");
        }
    }
}
