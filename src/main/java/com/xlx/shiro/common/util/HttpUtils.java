package com.xlx.shiro.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;

/**
 * http工具类
 *
 * @author xielx on 2019/9/2
 */
public class HttpUtils {
    
    
    private static final Logger log = LoggerFactory.getLogger(HttpUtils.class);
    
    private static final String USER_AGENT = "user_agent";
    private static final String USER_AGENT_VALUE = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)";
    private static final String CONNECTION = "connection";
    private static final String CONNECTION_VALUE = "Keep-Alive";
    private static final String UTF8 = "utf-8";
    private static final String ACCEPT = "accept";
    public static final String ACCEPT_CHARSET = "Accept-Charset";
    private static final String CONTENT_TYPE = "contentType";
    private static final String SSL = "ssl";
    
    /**
     * 检查请求是否为ajax请求
     * 解释:
     * ajax(异步)请求在它的请求头里会比传统请求(同步)多一个头参数,x-requested-with
     * accept
     * x-requested-with  XMLHttpRequest //ajax请求
     * 所以可以此判断
     *
     * @param request req
     * @return boolean
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        
        String header = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(header);
    }
	
	
	/**
	 * POST请求查询天气
	 * @param url 魅族天气接口
	 * @param params 城市
	 * @return 接口响应内容
	 * @throws IOException 异常
	 */
	public static String sendPost(String url, String params) throws IOException {
        String urlPath = url + "?" + params;
        // URL类
        URL url1 = new URL(urlPath);
        URLConnection urlConnection = url1.openConnection();
        urlConnection.setDoInput(true);
        urlConnection.setDoOutput(true);
        // 请求属性
        urlConnection.setRequestProperty(CONTENT_TYPE, UTF8);
        urlConnection.setRequestProperty(ACCEPT_CHARSET, UTF8);
        urlConnection.setRequestProperty(USER_AGENT, USER_AGENT_VALUE);
        urlConnection.setRequestProperty(CONNECTION, CONNECTION_VALUE);
        urlConnection.setRequestProperty(ACCEPT, "*/*");
        
        StringBuilder content = new StringBuilder();
        
        try (PrintWriter printWriter = new PrintWriter(urlConnection.getOutputStream()); BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null){
	            content.append(line);
            }
            printWriter.flush();
            printWriter.print(params);
        }catch (Exception e){
            log.error("连接天气接口失败:{}",e.getMessage());
        }
        return content.toString();
    }
}
