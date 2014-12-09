package com.future.sqlgateway.sample;

import com.future.sqlgateway.client.GatewayClient;

public class Sample {

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		// SELECT Barcode,Name,Price FROM items WHERE Price > 5;
		GatewayClient client = new GatewayClient("Test1", "Test1", "sales",
				GatewayClient.QUERY_TYPE_UPDATE);

		// Target columns.
		// Conditions.
		// client.setTargetColumns("Barcode", "Name", "Price");
		// client.setConditions("Price > 5", "Deleted = false");
		client.setColumnAndValues("Name = 'Godzilla'", "Quantity = 500");
		client.setConditions("SaleID = 1417418021031", "ItemID = 1");
		client.execute();
		long runtime = System.currentTimeMillis() - start;
		System.out.println(runtime);
	}
}
