package com.future.pylon.sample;

import java.net.UnknownHostException;
import java.util.List;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

public class SampleMongoDB {

	public static void main(String[] args) throws UnknownHostException {
		mongoAddUser();
	}

	public static void mongoAddUser() throws UnknownHostException {
		MongoClient mongo = new MongoClient("localhost", 27017);
		DB db = mongo.getDB("test");
		db.addUser("mongo_user1", "mongo_pass1".toCharArray());
	}

	public static void mongoTest() throws UnknownHostException {

		// Since 2.10.0, uses MongoClient
		MongoClient mongo = new MongoClient("localhost", 27017);
		MongoClient mongoClient = new MongoClient();
		DB db = mongoClient.getDB("test");
		boolean auth = db.authenticate("username", "password".toCharArray());

		List<String> dbs = mongo.getDatabaseNames();
		for (String dbase : dbs) {
			System.out.println(dbase);
		}

		// DB db = mongo.getDB("testdb");
		DBCollection table = db.getCollection("user");
	}
}
