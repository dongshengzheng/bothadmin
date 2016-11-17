package com.fish.idle.admin.system.entity;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName Button.java
 * @Description:
 * @Date 2015年4月29日
 */
public class Button implements java.io.Serializable {

    private static final long serialVersionUID = 8552758267353482774L;
    private Integer buttonId;
    private Integer menuId;
    private String buttonName;
    private String buttonUrl;
    private Integer status;

    private boolean hasButton = false;

    public Integer getButtonId() {
        return buttonId;
    }

    public void setButtonId(Integer buttonId) {
        this.buttonId = buttonId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getButtonName() {
        return buttonName;
    }

    public void setButtonName(String buttonName) {
        this.buttonName = buttonName;
    }

    public String getButtonUrl() {
        return buttonUrl;
    }

    public void setButtonUrl(String buttonUrl) {
        this.buttonUrl = buttonUrl;
    }

    public boolean isHasButton() {
        return hasButton;
    }

    public void setHasButton(boolean hasButton) {
        this.hasButton = hasButton;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
