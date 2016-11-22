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

package com.fish.idle.admin.util;

import java.util.UUID;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName UuidUtil.java
 * @Description:
 * @Date Apr 19, 2015
 */
public class UuidUtil {

    public static String get32UUID() {
        String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
        return uuid;
    }

    public static void main(String[] args) {
        System.out.println(get32UUID());
    }
}

