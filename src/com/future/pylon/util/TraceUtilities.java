package com.future.pylon.util;

import com.sun.jmx.snmp.Timestamp;

public class TraceUtilities {

	public static final boolean isTrace = true;

	public static void print(String string) {
		if (isTrace) {
			Timestamp stamp = new Timestamp(System.currentTimeMillis());
			System.out.println(stamp.getDate() + " " + string);
		}
	}
}
