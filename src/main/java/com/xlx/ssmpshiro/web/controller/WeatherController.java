package com.xlx.shiro.web.controller;

import com.xlx.shiro.system.dto.ResultDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 天气
 *
 * @author xielx at 2020/2/14 21:24
 */
@Controller
@Slf4j
public class WeatherController {
    
    /**
     * 跳转weather.html页面
     * @return html页面
     */
    @GetMapping("weather")
    //@RequiresPermissions("weather:list")
    public String weather(){
        return "web/weather/weather";
    }
    
    /**
     * 查询天气
     * @param areaId 城市
     * @return 天气信息
     */
    @RequestMapping("/weather/query")
    @ResponseBody
    public ResultDTO searchWeather(String areaId){
        return ResultDTO.success();
    }
}
