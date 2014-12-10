package com.future.sqlgateway.sample;

import java.util.AbstractMap.SimpleEntry;
import java.util.List;
import java.util.Map;

import com.future.sqlgateway.client.GatewayClient;

public class Sample {

	public static void main(String[] args) {
		GatewayClient client = new GatewayClient(
				"http://localhost:8080/tmp/Gateway?", "Test1", "Test1");
		// client.setQueryType(GatewayClient.QUERY_TYPE_SELECT);
		// client.setTargetTable("sales");
		List<Map<String, SimpleEntry<String, String>>> rows = client
				.executeSelect("auditlogs", "select * from auditlogs");

		System.out.println(client.getRawResponse());
	}
}
