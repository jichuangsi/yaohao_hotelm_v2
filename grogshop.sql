/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.25-log : Database - grogshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`grogshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `grogshop`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '账户类型',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

/*Table structure for table `anser` */

DROP TABLE IF EXISTS `anser`;

CREATE TABLE `anser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) NOT NULL,
  `answer` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `anser` */

insert  into `anser`(`id`,`questionId`,`answer`,`time`) values (7,1,'辉煌饿','2020-04-09 15:32:48'),(9,3,'股份认购VS下','2020-04-09 17:46:20'),(12,27,'大家好','2020-04-10 10:23:19'),(18,27,'<p>记忆总是储存一些难忘的人和事，有些记忆是刻骨的，任岁月怎样地流逝，都带不走它的痕迹，甚至也没有模糊的可能。那晚，我们唱着歌走，过去岁月里的那一夜歌声，永远烙在了心里，再也不会忘记。每每想起总有着一丝苦涩的味道泛上心头，泪水就悄悄含在了眼里。<img src=\"../images/888342f874e640fab83ae67312273070.jpg\" title=\"888342f874e640fab83ae67312273070.jpg\" alt=\"888342f874e640fab83ae67312273070.jpg\"/></p><p>那年，中专毕业刚分配工作，四十五岁的父亲就患了绝症，这对于整个家是毁灭性的打击，对于我这个长女更是迎头一棒，农家的劳力垮了就等于家抽掉了脊梁。尽管想尽所有的办法，依然不能让父亲的病情逆转，只好在痛苦的煎熬中，整日以泪洗面，心酸地看着父亲，一步一步走向生命的末尾。</p><p>一天请假回家看望父亲，不巧母亲也病了。一张床上躺着两位亲人，目睹着父亲苍黄的脸色，面对着母亲烧得红赤的脸庞，无法形容心中的苦有多浓烈。在家住了一晚，无奈第二天要赶回城里上班，早晨四点我就要从家里出发到镇上赶六点的班车。平日早起搭车都有母亲送我，可这次要我一人走过黑暗寂静的田野，对于胆小十几岁的我是难以做到的，于是弟妹担起了送我的重任。妹妹只有十二岁，弟弟只有八岁，说是让他们送我，倒不如说是让他们给我壮胆，就这样我们出发了。</p><p>凌晨四时，乡村尚沉睡在梦乡里，没有一丝的声响，即使有一根针掉到地上，也能听到坠落的声音。一把手电筒的光束划破了夜的帷幕，射出去好远好远，在光的照射下黑暗悄悄留出一条光的路。幼小的弟妹走在前，我紧跟在后面，三个单薄的身影就这样，静悄悄走在黑暗的乡村小道上。所幸有一束光亮壮胆，否则不知心中的怯懦有多强烈。但我不敢有半点的情绪流露，作为姐姐我要把强大的一面展示给弟妹。<img src=\"../images/08bd6f6c773241ffbb944660b0412e3b.jpg\" title=\"08bd6f6c773241ffbb944660b0412e3b.jpg\" alt=\"08bd6f6c773241ffbb944660b0412e3b.jpg\"/></p>','2020-04-13 18:47:53'),(19,28,'<p>这里写你的初始化内容</p>','2020-04-13 10:40:39'),(20,28,'<p>这里写你的初始化内容</p>','2020-04-13 11:22:44'),(21,28,'<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" poster=\"../img/time.jpg\" width=\"420\" height=\"280\" src=\"../upload/34405decd3334e5ba86c06dccf0f9f90.mp4\" data-setup=\"{}\"></video></p>','2020-04-13 19:24:15'),(22,28,'<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">记忆总是储存一些难忘的人和事，有些记忆是刻骨的，任岁月怎样地流逝，都带不走它的痕迹，甚至也没有模糊的可能。那晚，我们唱着歌走，过去岁月里的那一夜歌声，永远烙在了心里，再也不会忘记。每每想起总有着一丝苦涩的味道泛上心头，泪水就悄悄含在了眼里。<img src=\"../images/34da80d0e7ff443ea3c37a5792bf5ec8.jpg\" title=\"34da80d0e7ff443ea3c37a5792bf5ec8.jpg\" alt=\"34da80d0e7ff443ea3c37a5792bf5ec8.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">那年，中专毕业刚分配工作，四十五岁的父亲就患了绝症，这对于整个家是毁灭性的打击，对于我这个长女更是迎头一棒，农家的劳力垮了就等于家抽掉了脊梁。尽管想尽所有的办法，依然不能让父亲的病情逆转，只好在痛苦的煎熬中，整日以泪洗面，心酸地看着父亲，一步一步走向生命的末尾。<img src=\"../images/f52f738f36294fa0bc13fb3f622adc6f.jpg\" title=\"f52f738f36294fa0bc13fb3f622adc6f.jpg\" alt=\"f52f738f36294fa0bc13fb3f622adc6f.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">一天请假回家看望父亲，不巧母亲也病了。一张床上躺着两位亲人，目睹着父亲苍黄的脸色，面对着母亲烧得红赤的脸庞，无法形容心中的苦有多浓烈。在家住了一晚，无奈第二天要赶回城里上班，早晨四点我就要从家里出发到镇上赶六点的班车。平日早起搭车都有母亲送我，可这次要我一人走过黑暗寂静的田野，对于胆小十几岁的我是难以做到的，于是弟妹担起了送我的重任。妹妹只有十二岁，弟弟只有八岁，说是让他们送我，倒不如说是让他们给我壮胆，就这样我们出发了。</p><p><br/></p>','2020-04-13 13:54:33'),(23,28,'<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">记忆总是储存一些难忘的人和事，有些记忆是刻骨的，任岁月怎样地流逝，都带不走它的痕迹，甚至也没有模糊的可能。那晚，我们唱着歌走，过去岁月里的那一夜歌声，永远烙在了心里，再也不会忘记。每每想起总有着一丝苦涩的味道泛上心头，泪水就悄悄含在了眼里。<video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"undefined../upload/6aa08a703806477aa56ed4a4cc9f200b.mp4\" data-setup=\"{}\"></video></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">那年，中专毕业刚分配工作，四十五岁的父亲就患了绝症，这对于整个家是毁灭性的打击，对于我这个长女更是迎头一棒，农家的劳力垮了就等于家抽掉了脊梁。尽管想尽所有的办法，依然不能让父亲的病情逆转，只好在痛苦的煎熬中，整日以泪洗面，心酸地看着父亲，一步一步走向生命的末尾。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">一天请假回家看望父亲，不巧母亲也病了。一张床上躺着两位亲人，目睹着父亲苍黄的脸色，面对着母亲烧得红赤的脸庞，无法形容心中的苦有多浓烈。在家住了一晚，无奈第二天要赶回城里上班，早晨四点我就要从家里出发到镇上赶六点的班车。平日早起搭车都有母亲送我，可这次要我一人走过黑暗寂静的田野，对于胆小十几岁的我是难以做到的，于是弟妹担起了送我的重任。妹妹只有十二岁，弟弟只有八岁，说是让他们送我，倒不如说是让他们给我壮胆，就这样我们出发了。</p><p><br/></p>','2020-04-13 14:15:48'),(25,29,'<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"../upload/ed329c0035c44a9ca424f441ccade2d4.mp4\" data-setup=\"{}\"></video></p>','2020-04-13 14:40:39'),(26,29,'<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">凌晨四时，乡村尚沉睡在梦乡里，没有一丝的声响，即使有一根针掉到地上，也能听到坠落的声音。一把手电筒的光束划破了夜的帷幕，射出去好远好远，在光的照射下黑暗悄悄留出一条光的路。幼小的弟妹走在前，我紧跟在后面，三个单薄的身影就这样，静悄悄走在黑暗的乡村小道上。所幸有一束光亮壮胆，否则不知心中的怯懦有多强烈。但我不敢有半点的情绪流露，作为姐姐我要把强大的一面展示给弟妹。<video class=\"edui-upload-video  vjs-default-skin  video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src data-setup=\"{}\"></video></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">不平整的山道上，一粒粒砂石在夜空下惬意地躺着，寂静中，只听三双脚踩上去发出“嚓嚓嚓”的声音，就像踩在夜的弦上，被乐手在筝上轻轻刮擦着，即使声音很轻，在这样的夜里也变得十分地清晰。真怕那声响引来老虎，引来暗角里的鬼怪，恐惧感油然而生，只觉全身的毛孔都张开，一个个的小疙瘩挣扎着挤出体表，头发也竖立起来。不敢往左右看，感觉周边的黑影里可能藏着东西，又疑心背后是不是有什么跟着，不知年幼的弟妹怕不怕，不敢问更不敢声张，怕问了引起弟妹恐慌就更胆怯了，否则夜更增长它的恐惧。<img src=\"../images/932bd3a299de4a7da269e91a0958f91b.png\" title=\"932bd3a299de4a7da269e91a0958f91b.png\" alt=\"932bd3a299de4a7da269e91a0958f91b.png\"/><img src=\"../images/37353f12c03f4f1c96b0f6f1f267b943.jpg\" title=\"37353f12c03f4f1c96b0f6f1f267b943.jpg\" alt=\"37353f12c03f4f1c96b0f6f1f267b943.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绕过老屋，穿过小桥，到了空旷的田野里。阵阵冷风从耳边不停地刮过，一阵又一阵的凉意侵袭来，夜更显得幽冷，田野的空旷静的可怕。常听人说起老虎出没的事，想着要是冷不防，老虎就出现在视野里怎么办，身子后边是不是也跟着老虎，我感到毛骨悚然，更不敢回头去看。突然前方有一堆黑影，吓的猛地将手电筒的光束对准它直射过去，原来是一棵矮胖的树，不禁暗暗松了一口气。</p><p><br/></p>','2020-04-13 15:21:02'),(27,29,'<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">凌晨四时，乡村尚沉睡在梦乡里，没有一丝的声响，即使有一根针掉到地上，也能听到坠落的声音。一把手电筒的光束划破了夜的帷幕，射出去好远好远，在光的照射下黑暗悄悄留出一条光的路。幼小的弟妹走在前，我紧跟在后面，三个单薄的身影就这样，静悄悄走在黑暗的乡村小道上。所幸有一束光亮壮胆，否则不知心中的怯懦有多强烈。但我不敢有半点的情绪流露，作为姐姐我要把强大的一面展示给弟妹。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">不平整的山道上，一粒粒砂石在夜空下惬意地躺着，寂静中，只听三双脚踩上去发出“嚓嚓嚓”的声音，就像踩在夜的弦上，被乐手在筝上轻轻刮擦着，即使声音很轻，在这样的夜里也变得十分地清晰。真怕那声响引来老虎，引来暗角里的鬼怪，恐惧感油然而生，只觉全身的毛孔都张开，一个个的小疙瘩挣扎着挤出体表，头发也竖立起来。不敢往左右看，感觉周边的黑影里可能藏着东西，又疑心背后是不是有什么跟着，不知年幼的弟妹怕不怕，不敢问更不敢声张，怕问了引起弟妹恐慌就更胆怯了，否则夜更增长它的恐惧。<img src=\"../images/d39b0b65c6bd4890b3d54b402f58bb6c.jpg\" title=\"d39b0b65c6bd4890b3d54b402f58bb6c.jpg\" alt=\"d39b0b65c6bd4890b3d54b402f58bb6c.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绕过老屋，穿过小桥，到了空旷的田野里。阵阵冷风从耳边不停地刮过，一阵又一阵的凉意侵袭来，夜更显得幽冷，田野的空旷静的可怕。常听人说起老虎出没的事，想着要是冷不防，老虎就出现在视野里怎么办，身子后边是不是也跟着老虎，我感到毛骨悚然，更不敢回头去看。突然前方有一堆黑影，吓的猛地将手电筒的光束对准它直射过去，原来是一棵矮胖的树，不禁暗暗松了一口气。</p><p><img src=\"../images/ab8047cc87314a749cc13cd1781c773e.jpg\" title=\"ab8047cc87314a749cc13cd1781c773e.jpg\" alt=\"ab8047cc87314a749cc13cd1781c773e.jpg\"/></p>','2020-04-13 15:55:59'),(30,30,'<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">凌晨四时，乡村尚沉睡在梦乡里，没有一丝的声响，即使有一根针掉到地上，也能听到坠落的声音。一把手电筒的光束划破了夜的帷幕，射出去好远好远，在光的照射下黑暗悄悄留出一条光的路。幼小的弟妹走在前，我紧跟在后面，三个单薄的身影就这样，静悄悄走在黑暗的乡村小道上。所幸有一束光亮壮胆，否则不知心中的怯懦有多强烈。但我不敢有半点的情绪流露，作为姐姐我要把强大的一面展示给弟妹。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"../images/e5a3770a02104a9cbb9879bd40e6cbb7.jpg\" title=\"e5a3770a02104a9cbb9879bd40e6cbb7.jpg\" alt=\"e5a3770a02104a9cbb9879bd40e6cbb7.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">不平整的山道上，一粒粒砂石在夜空下惬意地躺着，寂静中，只听三双脚踩上去发出“嚓嚓嚓”的声音，就像踩在夜的弦上，被乐手在筝上轻轻刮擦着，即使声音很轻，在这样的夜里也变得十分地清晰。真怕那声响引来老虎，引来暗角里的鬼怪，恐惧感油然而生，只觉全身的毛孔都张开，一个个的小疙瘩挣扎着挤出体表，头发也竖立起来。不敢往左右看，感觉周边的黑影里可能藏着东西，又疑心背后是不是有什么跟着，不知年幼的弟妹怕不怕，不敢问更不敢声张，怕问了引起弟妹恐慌就更胆怯了，否则夜更增长它的恐惧。<video class=\"edui-upload-video video-js vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"../upload/836b45fb66b748af8125621d0bf24a3e.mp4\" data-setup=\"{}\"></video></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绕过老屋，穿过小桥，到了空旷的田野里。阵阵冷风从耳边不停地刮过，一阵又一阵的凉意侵袭来，夜更显得幽冷，田野的空旷静的可怕。常听人说起老虎出没的事，想着要是冷不防，老虎就出现在视野里怎么办，身子后边是不是也跟着老虎，我感到毛骨悚然，更不敢回头去看。突然前方有一堆黑影，吓的猛地将手电筒的光束对准它直射过去，原来是一棵矮胖的树，不禁暗暗松了一口气。</p><p><br/></p>','2020-04-14 10:11:04'),(31,27,'<p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">凌晨四时，乡村尚沉睡在梦乡里，没有一丝的声响，即使有一根针掉到地上，也能听到坠落的声音。一把手电筒的光束划破了夜的帷幕，射出去好远好远，在光的照射下黑暗悄悄留出一条光的路。幼小的弟妹走在前，我紧跟在后面，三个单薄的身影就这样，静悄悄走在黑暗的乡村小道上。所幸有一束光亮壮胆，否则不知心中的怯懦有多强烈。但我不敢有半点的情绪流露，作为姐姐我要把强大的一面展示给弟妹。<img src=\"../images/e003303d63ce4a57828c8407526ecfc5.jpg\" title=\"e003303d63ce4a57828c8407526ecfc5.jpg\" alt=\"e003303d63ce4a57828c8407526ecfc5.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">不平整的山道上，一粒粒砂石在夜空下惬意地躺着，寂静中，只听三双脚踩上去发出“嚓嚓嚓”的声音，就像踩在夜的弦上，被乐手在筝上轻轻刮擦着，即使声音很轻，在这样的夜里也变得十分地清晰。真怕那声响引来老虎，引来暗角里的鬼怪，恐惧感油然而生，只觉全身的毛孔都张开，一个个的小疙瘩挣扎着挤出体表，头发也竖立起来。不敢往左右看，感觉周边的黑影里可能藏着东西，又疑心背后是不是有什么跟着，不知年幼的弟妹怕不怕，不敢问更不敢声张，怕问了引起弟妹恐慌就更胆怯了，否则夜更增长它的恐惧。<img src=\"../images/8317f68e981a42d0ac8096e09653636b.png\" title=\"8317f68e981a42d0ac8096e09653636b.png\" alt=\"8317f68e981a42d0ac8096e09653636b.png\"/><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"../upload/e83f0f689f23416a8a0abf6160d2aaec.mp4\" data-setup=\"{}\"></video></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; line-height: 2.8em; text-indent: 28px; color: rgb(102, 102, 102); font-family: Arial; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">绕过老屋，穿过小桥，到了空旷的田野里。阵阵冷风从耳边不停地刮过，一阵又一阵的凉意侵袭来，夜更显得幽冷，田野的空旷静的可怕。常听人说起老虎出没的事，想着要是冷不防，老虎就出现在视野里怎么办，身子后边是不是也跟着老虎，我感到毛骨悚然，更不敢回头去看。突然前方有一堆黑影，吓的猛地将手电筒的光束对准它直射过去，原来是一棵矮胖的树，不禁暗暗松了一口气。</p><p><br/></p>','2020-04-13 18:43:53');

/*Table structure for table `bookingcommission` */

DROP TABLE IF EXISTS `bookingcommission`;

CREATE TABLE `bookingcommission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phoneName` varchar(255) DEFAULT NULL,
  `money` decimal(8,2) DEFAULT '0.00',
  `supplierId` int(11) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bookingcommission` */

/*Table structure for table `commodity` */

DROP TABLE IF EXISTS `commodity`;

CREATE TABLE `commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `commodityTypeID` int(11) DEFAULT NULL COMMENT '商品类别ID',
  `uOMID` int(11) DEFAULT NULL COMMENT '计量单位ID',
  `commodityName` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `salePrice` decimal(8,2) DEFAULT NULL COMMENT '销售价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `commodity` */

/*Table structure for table `consumptiontype` */

DROP TABLE IF EXISTS `consumptiontype`;

CREATE TABLE `consumptiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '消费类型',
  `status` int(11) NOT NULL COMMENT '状态0启用后1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `consumptiontype` */

insert  into `consumptiontype`(`id`,`name`,`status`) values (1,'被铺清理费',1),(2,'日常用品',1),(3,'其他费用',1),(4,'出差',1),(6,'买菜',1),(7,'突然',1);

/*Table structure for table `dailyconsumption` */

DROP TABLE IF EXISTS `dailyconsumption`;

CREATE TABLE `dailyconsumption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierId` int(11) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL COMMENT '房间id',
  `roomNumber` varchar(255) DEFAULT NULL COMMENT '房号',
  `money` decimal(8,2) DEFAULT NULL COMMENT '消费金额',
  `time` varchar(255) DEFAULT NULL COMMENT '消费时间',
  `cid` int(11) DEFAULT NULL COMMENT '消费类型',
  `content` varchar(11) DEFAULT NULL COMMENT '内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dailyconsumption` */

/*Table structure for table `finance` */

DROP TABLE IF EXISTS `finance`;

CREATE TABLE `finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplierId` int(11) DEFAULT NULL,
  `roomId` int(11) DEFAULT NULL,
  `roomNumber` int(11) DEFAULT NULL,
  `yearM` varchar(255) DEFAULT NULL COMMENT '时间(月)',
  `PHP` double DEFAULT '0' COMMENT '菲律宾币',
  `RMB` double DEFAULT '0' COMMENT '人名币',
  `rent` double DEFAULT '0' COMMENT '房租',
  `water` double DEFAULT '0' COMMENT '水费',
  `electricity` double DEFAULT '0' COMMENT '电费',
  `maintenanceCost` double DEFAULT '0' COMMENT '维修费',
  `network` double DEFAULT '0' COMMENT '网费',
  `buildingManagementFee` double DEFAULT '0' COMMENT '大厦管理费',
  `linenCleaningfee` double DEFAULT '0' COMMENT '被子清洗费',
  `dailySupplies` double DEFAULT '0' COMMENT '日常消费',
  `otherExpenses` double DEFAULT '0' COMMENT '其他',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `finance` */

/*Table structure for table `guestroomlevel` */

DROP TABLE IF EXISTS `guestroomlevel`;

CREATE TABLE `guestroomlevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestRoomLevel` varchar(255) NOT NULL COMMENT '房间等级',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '房型出租1；床位2:整租3：合约',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `guestroomlevel` */

insert  into `guestroomlevel`(`id`,`guestRoomLevel`,`status`) values (1,'单人普通房',1),(2,'二人普通房',1),(3,'多人间',1),(4,'豪华间',1),(5,'单人间',2),(6,'双人间',2),(8,'单人房',3);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(100) NOT NULL COMMENT '订单号',
  `status` int(11) NOT NULL COMMENT '1未确认 2已确认 3 已撤销 4待入住 5已入住 6退房',
  `platformId` int(11) NOT NULL COMMENT '平台',
  `hotelmId` int(11) DEFAULT NULL COMMENT '供应商ID',
  `roomId` int(11) DEFAULT NULL COMMENT '房间ID',
  `money` double DEFAULT NULL COMMENT '价格',
  `currency` int(11) DEFAULT NULL COMMENT '1人名币 2菲律宾币',
  `checkinTime` timestamp NULL DEFAULT NULL COMMENT '入住时间',
  `checkoutTime` timestamp NULL DEFAULT NULL COMMENT '退房时间',
  `orderTime` timestamp NULL DEFAULT NULL COMMENT '订单时间',
  `passengerId` int(11) DEFAULT NULL COMMENT '预定id',
  `isdao` int(11) DEFAULT NULL COMMENT '1未到账 2到账',
  `daoTime` timestamp NULL DEFAULT NULL COMMENT '到账时间',
  `checkinNumber` int(11) DEFAULT NULL COMMENT '入住床位数',
  `checkinRoom` int(11) DEFAULT NULL COMMENT '入住人数',
  `account` int(11) DEFAULT NULL COMMENT '账户',
  `checkinDay` int(11) DEFAULT NULL COMMENT '入住天数',
  `type` int(11) DEFAULT NULL COMMENT '1自有床2合约3自有整',
  `in` varchar(255) DEFAULT NULL COMMENT '入住时间点',
  `out` varchar(255) DEFAULT NULL COMMENT '退房时间点',
  `hometype` int(11) DEFAULT NULL COMMENT '房型',
  `inpasssId` int(11) DEFAULT NULL COMMENT '入住人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `passenger` */

DROP TABLE IF EXISTS `passenger`;

CREATE TABLE `passenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '旅客ID',
  `genderName` int(11) DEFAULT NULL COMMENT '性别',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phoneNumber` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `passenger` */

/*Table structure for table `platform` */

DROP TABLE IF EXISTS `platform`;

CREATE TABLE `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '平台名字',
  `isYong` int(11) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `platform` */

insert  into `platform`(`id`,`name`,`isYong`) values (1,'缤客',0),(2,'安可达',0),(3,'爱彼迎',0),(4,'途家',0);

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotelm` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `createTime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `question` */

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `guestRoomLevelID` int(11) DEFAULT NULL COMMENT '客房等级ID',
  `roomNumber` varchar(10) DEFAULT NULL COMMENT '房间号',
  `roomAmount` varchar(10) DEFAULT NULL COMMENT '床位数',
  `referencePrice` decimal(8,2) DEFAULT NULL COMMENT '参考价',
  `supplierID` int(11) DEFAULT NULL COMMENT '供应商ID',
  `time` bigint(20) DEFAULT NULL COMMENT '新增使间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`guestRoomLevelID`,`roomNumber`,`roomAmount`,`referencePrice`,`supplierID`,`time`) values (1,8,'1','1','1.00',1,1588211631),(47,1,'1614','3','260.00',1,1583492227),(48,1,'1711','3','320.00',1,1583492227),(49,1,'2709','2','260.00',1,1583492244),(50,1,'2716','2','260.00',1,1583492262),(51,1,'2811','6','260.00',1,1583405826),(52,1,'2912','8','260.00',1,1583405826),(53,1,'3316','2','260.00',1,1583578626),(54,1,'4515','4','260.00',1,1583578626);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `supplierName` varchar(300) NOT NULL COMMENT '供应商名字',
  `isenabled` int(11) DEFAULT NULL COMMENT '启用，0启用，1不启用',
  `have` int(11) DEFAULT NULL COMMENT '是否自有1是 2不是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`supplierName`,`isenabled`,`have`) values (1,'JDH酒店式公寓',0,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL COMMENT '管理员等级1超级2普通',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`userName`,`password`,`grade`) values (1,'sa','123',1),(2,'admin','12345',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
