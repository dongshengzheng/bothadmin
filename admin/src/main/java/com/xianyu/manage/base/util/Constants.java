/*
 *
 * ALL RIGHTS RESERVED.
 *
 * No part of this publication may be reproduced, stored in a retrieval system, or transmitted,
 * on any form or by any means, electronic, mechanical, photocopying, recording, 
 * or otherwise, without the prior written permission of ShenZhen GreatVision Network Technology Co., Ltd.
 *
 * Amendment History:
 * 
 * Date                   By              Description
 * -------------------    -----------     -------------------------------------------
 * Apr 17, 2015    Sun.Han         Create the class
 */

package com.xianyu.manage.base.util;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName Constants.java
 * @Description:
 * @Date Apr 19, 2015
 */
public class Constants {

    public static String PICTURE_VISIT_FILE_PATH = "";//图片访问的路径

    public static String PICTURE_SAVE_FILE_PATH = "";//图片存放的路径


    public static String getPICTURE_VISIT_FILE_PATH() {
        return PICTURE_VISIT_FILE_PATH;
    }

    public static void setPICTURE_VISIT_FILE_PATH(String pICTURE_VISIT_FILE_PATH) {
        PICTURE_VISIT_FILE_PATH = pICTURE_VISIT_FILE_PATH;
    }

    public static String getPICTURE_SAVE_FILE_PATH() {
        return PICTURE_SAVE_FILE_PATH;
    }

    public static void setPICTURE_SAVE_FILE_PATH(String pICTURE_SAVE_FILE_PATH) {
        PICTURE_SAVE_FILE_PATH = pICTURE_SAVE_FILE_PATH;
    }

    public static void main(String[] args) {
        Constants.setPICTURE_SAVE_FILE_PATH("D:/Tomcat 6.0/webapps/ysj/topic/");
        Constants.setPICTURE_VISIT_FILE_PATH("http://192.168.1.225:8888/ysj/topic/");
    }

}
