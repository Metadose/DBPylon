package com.future.sqlgateway.sample;

import com.future.sqlgateway.client.GatewayClient;

public class Sample {

	public static void main(String[] args) {
		// SELECT Barcode,Name,Price FROM items WHERE Price > 5;
		GatewayClient client = new GatewayClient("Test1", "Test1",
				"credentials", GatewayClient.QUERY_TYPE_INSERT);

		// Target columns.
		// Conditions.
		// client.setTargetColumns("Barcode", "Name", "Price");
		// client.setConditions("Price > 5", "Deleted = false");
		client.setColumnAndValues("Username = 'Coffee'", "Password = 'Latte'");
		// client.setConditions("Quantity > 10", "ItemID = 1");
		client.execute();
	}
}
