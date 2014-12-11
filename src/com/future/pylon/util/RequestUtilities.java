package com.future.pylon.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * Helper functions for handling HTTP requests.
 * 
 * @author Victorio Cebedo II
 * 
 */
public class RequestUtilities {

	/**
	 * Get a parameter from the request.<br>
	 * Clean the parameter first before returning.
	 * 
	 * @param request
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static String getParameter(HttpServletRequest request, String param) {
		return getParameter(request, param, "");
	}

	/**
	 * Get a parameter from the request.<br>
	 * Clean the parameter first before returning.
	 * 
	 * @param request
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static String getParameter(HttpServletRequest request, String param,
			String defaultValue) {
		String value = request.getParameter(param);
		return value != null ? value : defaultValue;
	}

	/**
	 * Get a parameter from the request.<br>
	 * Clean the parameter first before returning.
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static int getParameterAsInt(HttpServletRequest request, String param) {
		return getParameterAsInt(request, param, 0);
	}

	/**
	 * Get a parameter from the request.<br>
	 * Clean the parameter first before returning.
	 * 
	 * @param request
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static int getParameterAsInt(HttpServletRequest request,
			String param, int defaultValue) {
		String value = request.getParameter(param);
		return Utilities.parseInt(value, defaultValue);
	}

	/**
	 * Check if parameter has valid values.
	 * 
	 * @param request
	 * @param param
	 */
	public static boolean hasValidValue(HttpServletRequest request, String param) {
		return getParameter(request, param, "").isEmpty() ? false : true;
	}

	/**
	 * Check if all the params in the list are valid.
	 * 
	 * @param request
	 * @param paramList
	 * @return
	 */
	public static boolean paramsAreValid(HttpServletRequest request,
			List<String> paramList) {
		boolean isValid = true;
		for (String param : paramList) {
			isValid = hasValidValue(request, param);
			if (!isValid) {
				return false;
			}
		}
		return isValid;
	}

	/**
	 * Get the parameter as long.
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static long getParameterAsLong(HttpServletRequest request,
			String param) {
		String value = request.getParameter(param);
		return Utilities.parseLong(value);
	}

	/**
	 * Get the parameter as long.
	 * 
	 * @param request
	 * @param param
	 * @return
	 */
	public static boolean getParameterAsBoolean(HttpServletRequest request,
			String param) {
		String value = request.getParameter(param);
		return Utilities.parseBoolean(value);
	}
}
