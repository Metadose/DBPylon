package com.future.sqlgateway.sample;

import java.util.List;
import java.util.Map;

import com.future.sqlgateway.client.GatewayClient;

public class Sample {

	public static void main(String[] args) {
		GatewayClient client = new GatewayClient(
				"http://localhost:8080/tmp/Gateway?", "Test1", "Test1");
		client.setQueryType(GatewayClient.QUERY_TYPE_SELECT);
		client.setTargetTable("sales");
		client.setConditions("SaleID = 12123455");
		List<Map<String, String>> result = client.select();

		System.out
				.println(result.toString() + "\n\n" + client.getRawResponse());

		client.setQueryType(GatewayClient.QUERY_TYPE_UPDATE);
		client.setColumnAndValues("Price = 999");
		boolean success = client.update();
		System.out.println("\n\n" + success);
	}
}
