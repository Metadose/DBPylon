package com.future.sqlgateway.util;

import com.sun.jmx.snmp.Timestamp;

public class TraceUtilities {

	public static void print(String string) {
		System.out.println(new Timestamp(System.currentTimeMillis()).toString()
				+ " " + string);
	}

}
