package com.xlx.shiro.system.dto;

import com.alibaba.fastjson.JSON;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 树形菜单
 *
 * @author xielx on 2019/9/5
 */
@Data
public class TreeDTO<T> {
	
	/**
	 * 节点id
	 */
	private String id;
	/**
	 * 图标
	 */
	private String icon;
	/**
	 * url
	 */
	private String url;
	/**
	 * 显示节点文本
	 */
	private String text;
	/**
	 * 节点状态:open/closed
	 */
	private Map<String, Object> state;
	/**
	 * 节点是否被选中
	 */
	private boolean checked = false;
	/**
	 * 节点属性
	 */
	private Map<String,Object> attributes;
	/**
	 * 子节点
	 */
	private List<TreeDTO<T>> children = new ArrayList<>();
	
	/**
	 * 父ID
	 */
	private String parentId;
	/**
	 * 是否有父节点
	 */
	private boolean hasParent = false;
	/**
	 * 是否有子节点
	 */
	private boolean hasChildren = false;
	
	@Override
	public String toString() {
		
		return JSON.toJSONString(this);
	}
}
