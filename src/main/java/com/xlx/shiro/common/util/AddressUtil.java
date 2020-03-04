package com.xlx.shiro.common.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.lionsoul.ip2region.*;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Objects;

/**
 * 自定义地址工具类
 *
 * @author xielx at 2020/3/4 17:08
 */
@Slf4j
public class AddressUtil {

    private static final String RESOURCES_PATH = "/ip2region/ip2region.db";
    
    /**
     * 根据ip获取位置
     * @param ip 计算机ip
     * @return str
     */
    public static String getCityInfo(String ip){
        DbSearcher dbSearcher = null;
        try{
            String path = AddressUtil.class.getResource(RESOURCES_PATH).getPath();
            File dbFile = new File(path);
            // 判断资源文件是否存在
            if (!dbFile.exists()){
                String tmpdir = System.getProperties().getProperty("java.io.tmpdir");
                path = tmpdir + "ip.db";
                dbFile = new File(path);
                FileUtils.copyInputStreamToFile(Objects.requireNonNull(AddressUtil.class.getClassLoader().getResourceAsStream(RESOURCES_PATH)),dbFile);
            }
    
            DbConfig dbConfig = new DbConfig();
            dbSearcher = new DbSearcher(dbConfig,dbFile.getPath());
            // 反射获取
            Method method = null;
            method = dbSearcher.getClass().getMethod("btreeSearch",String.class);
            DataBlock dataBlock = null;
            if (!Util.isIpAddress(ip)){
                log.error("IP校验异常:传入的 ip [{}] 无效",ip);
            }
            dataBlock = (DataBlock) method.invoke(dbSearcher,ip);
    
            return dataBlock.getRegion();
        } catch (Exception e) {
            log.error("获取地址信息异常:{}",e.getMessage());
        }finally {
            if (dbSearcher != null){
                try {
                    dbSearcher.close();
                } catch (IOException e) {
                    log.error("DbSearcher 关闭失败!");
                }
            }
        }
        return "";
    }


}
