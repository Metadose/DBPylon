package com.future.sqlgateway.sample;

import com.future.sqlgateway.client.GatewayClient;

public class Sample {

	public static void main(String[] args) {
		GatewayClient client = new GatewayClient(
				"http://localhost:8080/tmp/Gateway?", "Test1", "Test1");
		boolean success = client.executeQuery("Select * from sales");

		System.out.println(client.getRawResponse());
	}
}
