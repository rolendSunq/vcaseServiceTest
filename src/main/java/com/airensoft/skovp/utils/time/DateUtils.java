package com.airensoft.skovp.utils.time;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.SimpleTimeZone;

public class DateUtils {
	public static Date StringToDate(String stringDate) {
		Date date = null;
		try {
			String from = stringDate.replace("/", "-");
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			date = transFormat.parse(from);
		} catch (Exception e) {
			return null;
		}
		return date;
	}

	public static String TimestamptToString(Integer timestamp) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date date = new Date(timestamp * 1000L);
		return transFormat.format(date);
	}

	// 1달 전
	public static int getMonthAgoDate() {
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		cal.add(Calendar.MONTH, -1); // 한달전 날짜 가져오기
		Date monthago = cal.getTime();
		/*SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		return formatter.format(monthago);*/
		Long longTime = new Long(monthago.getTime()/1000L);
		return longTime.intValue();
	}
	
	// 현재 달
	public static int getMonthDate() {
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		cal.add(Calendar.MONTH, 0); // 현재 날짜 가져오기
		Date todayMonth = cal.getTime();
		/*SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
		return formatter.format(todayMonth);*/
		Long longTime = new Long(todayMonth.getTime()/1000L);
		return longTime.intValue();
	}
	
	public static String getMontDateTime() {
		Calendar cal = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST"));
		cal.add(Calendar.MONTH, 0); // 현재 날짜 가져오기
		Date todayMonth = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("MMddHHmmss", Locale.KOREA);
		return formatter.format(todayMonth);
	}
}
