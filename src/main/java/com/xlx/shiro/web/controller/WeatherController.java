package com.xlx.shiro.web.controller;

import com.xlx.shiro.common.constant.WeatherConstant;
import com.xlx.shiro.common.util.HttpUtils;
import com.xlx.shiro.system.dto.ResultDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

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
        try {
            String weatherData = HttpUtils.sendPost(WeatherConstant.MEIZU_WEATHER_URL, areaId);
            log.info("天气数据:{}",weatherData);
            return ResultDTO.success(weatherData);
        } catch (IOException e) {
            log.error("查询[{}]天气异常:{}",areaId,e.getMessage());
            return ResultDTO.failed("获取天气数据失败!");
        }
    }
}
