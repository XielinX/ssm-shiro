package com.xlx.shiro.web.controller;

import com.xlx.shiro.common.constant.WebConstant;
import com.xlx.shiro.common.util.HttpUtils;
import com.xlx.shiro.system.dto.ResultDTO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 每日一文
 *
 * @author xielx at 2020/2/23 21:45
 */
@Controller
public class ArticleController {
    
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    /**
     * 跳转每日一问页面
     *
     * @return html
     */
    @GetMapping("/article")
    public String articleDailyHtml() {
        return "web/article/article";
    }
    
    /**
     * 获取文章信息
     * @param date 日期文章选择
     * @return dto
     */
    @GetMapping("/article/query")
    @ResponseBody
    public ResultDTO articleOfToday(String date) {
        String param;
        String data;
        try{
            if (StringUtils.isNotBlank(date)) {
                param = "dev=1&date=" + date;
                data = HttpUtils.sendSSLPost(WebConstant.MRYW_DAY_URL, param);
            } else {
                param = "dev=1";
                data = HttpUtils.sendSSLPost(WebConstant.MRYW_TODAY_URL,param);
            }
            return ResultDTO.success(data);
        }catch (Exception e){
            logger.error("获取文章失败:{}",e.getMessage());
            return ResultDTO.failed("获取文章失败,请检查网络是否正常");
        }
    }
}
