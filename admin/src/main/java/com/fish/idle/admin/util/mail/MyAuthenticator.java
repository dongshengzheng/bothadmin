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

package com.fish.idle.admin.util.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


/**
 * @author Sun.Han
 * @version 1.0
 * @FileName MyAuthenticator.java
 * @Description: 邮件发送验证信息
 * @Date Apr 19, 2015
 */
public class MyAuthenticator extends Authenticator {
    String userName = null;
    String password = null;

    public MyAuthenticator() {
    }

    public MyAuthenticator(String username, String password) {
        this.userName = username;
        this.password = password;
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
    }
}   
