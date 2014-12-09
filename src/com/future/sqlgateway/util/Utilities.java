package com.future.sqlgateway.util;

import java.util.ArrayList;

/**
 * Helper functions.
 * 
 * @author Victorio Cebedo II
 * 
 */
public class Utilities {
	/**
	 * Check if valid number.
	 * 
	 * @param number
	 * @return
	 */
	public static boolean isNumber(String number) {
		try {
			Long.parseLong(number);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	/**
	 * Check if all characters are uppercase.
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isAllUpperCase(String str) {
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			// If char is not a letter, skip it.
			if (!Character.isLetter(c)) {
				continue;
			}
			if (c >= 97 && c <= 122) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Convert array to list of objects.
	 * 
	 * @param array
	 * @return
	 */
	public static ArrayList<String> convertArrayToList(String[] array) {
		ArrayList<String> elemList = new ArrayList<String>();
		for (String element : array) {
			elemList.add(element);
		}
		return elemList;
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static int parseInt(String str) {
		return parseInt(str, 0);
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static int parseInt(String str, int defaultValue) {
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			;
		}
		return defaultValue;
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static float parseFloat(String str, float defaultValue) {
		try {
			return Float.parseFloat(str);
		} catch (Exception e) {
			;
		}
		return defaultValue;
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static float parseFloat(String str) {
		return parseFloat(str, 0);
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static long parseLong(String str) {
		return parseLong(str, 0);
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static boolean parseBoolean(String str) {
		return parseBoolean(str, false);
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static long parseLong(String str, long defaultValue) {
		try {
			return Long.parseLong(str);
		} catch (Exception e) {
			;
		}
		return defaultValue;
	}

	/**
	 * Parse and handle irrelevant inputs.
	 * 
	 * @param str
	 * @param defaultValue
	 * @return
	 */
	public static boolean parseBoolean(String str, boolean defaultValue) {
		try {
			return Boolean.parseBoolean(str);
		} catch (Exception e) {
			;
		}
		return defaultValue;
	}

	public static String capitalizeFirst(String str) {
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
}
