package com.gx.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class TimeTransformation {
    /**
     * 时间戳转换成日期格式字符串
     * @param seconds 精确到秒的字符串
     * @param
     * @return
     */
    public static String timeStamp2Date(Long seconds,String format) {
        if(seconds == 0){
            return "";
        }
        if(format == null || format.isEmpty()){
            format = "yyyy-MM-dd HH:mm:ss";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date(seconds*1000));
    }

    // 计算两个日期相隔的天数
    public static int nDaysBetweenTwoDate(String firstString, String secondString) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date firstDate = null;
        Date secondDate = null;
        try {
            firstDate = df.parse(firstString);
            secondDate = df.parse(secondString);
        } catch (Exception e) {
            // 日期型字符串格式错误
            System.out.println("日期型字符串格式错误");
        }
        int nDay = (int) ((secondDate.getTime() - firstDate.getTime()) / (24 * 60 * 60 * 1000));
        return nDay;
    }

    /**
     * String 转timestamp
     * @param str
     * @return
     */
    public  static Timestamp stringTimestamp(String str){
        Timestamp time = Timestamp.valueOf(str+" 00:00:00");
        return time;
    }


  private static  SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
    private static  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

    public static List<String> getMonthDay(String date)throws Exception {
        Date date2 = sdfs.parse(date);
        List<String> list = getMonthFullDay(date2);
        List<String> listDay = new ArrayList<String>();
        for (String date1 : list) {
            listDay.add(date1.substring(8, 10));
        }
        return listDay;
    }
    public static List<String> getMonthFullDay(Date date) throws Exception{
        List<String> fullDayList = new ArrayList<String>();
        String dateStr = sdfs.format(date);//format()方法将Date转换成指定格式的String
        int year = Integer.parseInt(dateStr.substring(0, 4));//年
        int month = Integer.parseInt(dateStr.substring(5, 7));//月
        Calendar cal = Calendar.getInstance();// 获得当前日期对象
        cal.clear();// 清除信息

        cal.setTime(date);
        cal.add(Calendar.DATE,0);
        int count = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        for (int j = 0; j <= (count - 1); ) {
            cal.add(Calendar.DATE,  j == 0 ? +0 : +1);
            j++;
            fullDayList.add(sdfs.format(cal.getTime()));
        }
        return fullDayList;
    }


    public static String getLastDay(int year, int month) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, 0);
        return sdf.format(cal.getTime());
    }




    /**
     * 判断当前日期为星期几
     * @param date
     * @return
     */
    public static int dayOfWeek(Date date){
        Calendar aCalendar = Calendar.getInstance();
        aCalendar.setTime(date);
        int weekDay = aCalendar.get(Calendar.DAY_OF_WEEK);
        return weekDay;
    }
    /**
     * 获取指定日期指定天数后的日期
     * @param date 指定日期
     * @param index 指定天数
     * @param flag 是否将时分秒归0
     * @return
     */
    public static Date getNextDate(Date date, int index, boolean flag){
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);// 获得当前时间
        if(flag){
// 日期不变，把时间设定为00：00：00
            cal.set(Calendar.HOUR_OF_DAY, 0);
            cal.set(Calendar.MINUTE, 00);
            cal.set(Calendar.SECOND, 00);
        }
        cal.set(Calendar.DATE, cal.get(Calendar.DATE) + index);
        return cal.getTime();
    }
    public static Date getDate(Date currentDate,int days){
        /*
         * 1，根据传入日期获取下一天日期
         * 2，判断下一天日期是否为工作日，如果是则设置下一次循环日期为此日期
         * 如果不为工作日，为周6，日期前进2天，为周天前进1天
         * 3, 获取指定天数后的工作日
         */
        Date date = currentDate;
        /* 设置循环次数
         * 如果含最后一天则循环 days + 1 天，不需要含最后一天，则循环 days次
         * */
        for(int i = 0; i < days + 1; i++){
            Date nextDate = getNextDate(date,1,false); //获取下一天的日期
            int weekDay = dayOfWeek(nextDate); //下一天日期为星期几
            if(weekDay == 1){ //为星期六
                date = getNextDate(date,2,false);
            }else if(weekDay == 6){ //为星期天
                date = getNextDate(date,3,false);
            }else{
                date = nextDate;
            }
        }
        return date;
    }

    /**
     * TimeStamp转date
     * @param timestamp
     * @return
     */
        public static Date dateToTimestamp(Timestamp timestamp){
            Date d = new Date(timestamp.getTime());
            return d;
        }

    /**
     * 判断两个date是否是同一天
     * @param date1
     * @param date2
     * @return
     */
    public static boolean isSameDay(Date date1, Date date2) {
        if(date1 != null && date2 != null) {
            Calendar cal1 = Calendar.getInstance();
            cal1.setTime(date1);
            Calendar cal2 = Calendar.getInstance();
            cal2.setTime(date2);
            return isSameDay(cal1, cal2);
        } else {
            throw new IllegalArgumentException("The date must not be null");
        }
    }
    public static boolean isSameDay(Calendar cal1, Calendar cal2) {
        if(cal1 != null && cal2 != null) {
            return cal1.get(0) == cal2.get(0) && cal1.get(1) == cal2.get(1) && cal1.get(6) == cal2.get(6);
        } else {
            throw new IllegalArgumentException("The date must not be null");
        }
    }

        /**
         * 切割時間段
         *
         * @param dateType 交易類型 M/D/H/N -->每月/每天/每小時/每分鐘
         * @param start    yyyy-MM-dd HH:mm:ss
         * @param end      yyyy-MM-dd HH:mm:ss
         * @return
         */
        public static List<String> cutDate(String dateType, String start, String end) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date dBegin = sdf.parse(start);
                Date dEnd = sdf.parse(end);
                return findDates(dateType, dBegin, dEnd);
            } catch (Exception e) {
                System.out.println(e);
            }
            return null;
        }

        public static List<String> findDates(String dateType, Date dBegin, Date dEnd) throws Exception {
            List<String> listDate = new ArrayList<>();
            Calendar calBegin = Calendar.getInstance();
            calBegin.setTime(dBegin);
            Calendar calEnd = Calendar.getInstance();
            calEnd.setTime(dEnd);
            while (calEnd.after(calBegin)) {
                switch (dateType) {
                    case "M":
                        calBegin.add(Calendar.MONTH, 1);
                        break;
                    case "D":
                        calBegin.add(Calendar.DAY_OF_YEAR, 1);
                        break;
                    case "H":
                        calBegin.add(Calendar.HOUR, 1);
                        break;
                    case "N":
                        calBegin.add(Calendar.SECOND, 1);
                        break;
                }
                if (calEnd.after(calBegin))
                    listDate.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calBegin.getTime()));
                else
                    listDate.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calEnd.getTime()));
            }
            return listDate;
        }

        public static List<String> twodays( Date startDate,Date endDate){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            List<String> twoday=new ArrayList<String>();
            try{
               /* Date startDate = dateFormat.parse(dateFirst);
                Date endDate = dateFormat.parse(dateSecond);*/
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(startDate);
                while(calendar.getTime().before(endDate)){
                    System.out.println(dateFormat.format(calendar.getTime()));
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                    twoday.add(dateFormat.format(calendar.getTime()));
                }

                System.out.println(dateFormat.format(endDate));

            }catch(Exception e){
                e.printStackTrace();
            }
            return twoday;
        }


    /**
     * MultipartFile 转 File
     *
     * @param file
     * @throws Exception
     */
    public static File multipartFileToFile(MultipartFile file) throws Exception {

        File toFile = null;
        if (file.equals("") || file.getSize() <= 0) {
            file = null;
        } else {
            InputStream ins = null;
            ins = file.getInputStream();
            toFile = new File(file.getOriginalFilename());
            inputStreamToFile(ins, toFile);
            ins.close();
        }
        return toFile;
    }

    //获取流文件
    private static void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除本地临时文件
     * @param file
     */
    public static void delteTempFile(File file) {
        if (file != null) {
            File del = new File(file.toURI());
            del.delete();
        }
    }

}
