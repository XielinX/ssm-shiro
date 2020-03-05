package com.xlx.shiro.web.controller;

import com.xlx.shiro.common.constant.WebConstant;
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
            String content = HttpUtils.sendSSLPost(WebConstant.TIME_MOVIE_HOT_URL, "locationId=328");
            return ResultDTO.success(content);
        }catch (Exception e){
            logger.error("获取热门电影数据失败:{}",e.getMessage());
            return ResultDTO.failed("获取热门电影数据失败!");
        }
    }
    
    /**
     * 即将上映电影
     * @return dto
     */
    @GetMapping("/movie/coming")
    @ResponseBody
    public ResultDTO getMovieComingInfo(){
        try{
            String content = HttpUtils.sendSSLPost(WebConstant.TIME_MOVIE_COMING_URL, "locationId=328");
            return ResultDTO.success(content);
        }catch (Exception e){
            logger.error("获取即将上映电影数据失败:{}",e.getMessage());
            return ResultDTO.failed("获取即将上映电影数据失败!");
        }
    }
    
    /**
     * 电影详情
     * @param id 电影id
     * @return dto
     */
    @GetMapping("/movie/detail")
    @ResponseBody
    public ResultDTO getMovieDetailsInfo(String id){
        try{
            String content = HttpUtils.sendSSLPost(WebConstant.TIME_MOVIE_DETAIL_URL, "locationId=328&movieId=" + id);
            return ResultDTO.success(content);
        }catch (Exception e){
            logger.error("获取电影详情数据失败:{}",e.getMessage());
            return ResultDTO.failed("获取电影详情数据失败,请检查网络是否正常!");
        }
    }
    
    /**
     * 电影评论
     * @param id 电影id
     * @return dto
     */
    @GetMapping("/movie/comments")
    @ResponseBody
    public ResultDTO getMovieCommentsInfo(String id){
        try{
            String content = HttpUtils.sendSSLPost(WebConstant.TIME_MOVIE_COMMENTS_URL, "locationId=328&movieId=" + id);
            return ResultDTO.success(content);
        }catch (Exception e){
            logger.error("获取电影评论数据失败:{}",e.getMessage());
            return ResultDTO.failed("获取电影评论数据失败,请检查网络是否正常");
        }
    }
    
    
}
