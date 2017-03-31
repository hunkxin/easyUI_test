package com.yike.DAO;

public class AccBase {
	private String level;
	private String index;
	private String accordion_id;
	private String group;
	private String accordion_name;
	private String icon;
	private String system_module;
	private String url;
	private String status;
	private String lastmodifier;
	private String creator;
	private String create_time;
	private String modify_time;
	private int id;
	private String iconCls;
	private String state;
	private String _parentId;
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getAccordion_id() {
		return accordion_id;
	}
	public void setAccordion_id(String accordion_id) {
		this.accordion_id = accordion_id;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getAccordion_name() {
		return accordion_name;
	}
	public void setAccordion_name(String accordion_name) {
		this.accordion_name = accordion_name;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getSystem_module() {
		return system_module;
	}
	public void setSystem_module(String system_module) {
		this.system_module = system_module;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getLastmodifier() {
		return lastmodifier;
	}
	public void setLastmodifier(String lastmodifier) {
		this.lastmodifier = lastmodifier;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getModify_time() {
		return modify_time;
	}
	public void setModify_time(String modify_time) {
		this.modify_time = modify_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String get_parentId() {
		return _parentId;
	}
	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}
	public AccBase(String level, String index, String accordion_id, String group, String accordion_name, String icon,
			String system_module, String url, String status, String lastmodifier, String creator, String create_time,
			String modify_time, int id, String iconCls, String state, String _parentId) {
		super();
		this.level = level;
		this.index = index;
		this.accordion_id = accordion_id;
		this.group = group;
		this.accordion_name = accordion_name;
		this.icon = icon;
		this.system_module = system_module;
		this.url = url;
		this.status = status;
		this.lastmodifier = lastmodifier;
		this.creator = creator;
		this.create_time = create_time;
		this.modify_time = modify_time;
		this.id = id;
		this.iconCls = iconCls;
		this.state = state;
		this._parentId = _parentId;
	}
	
}
