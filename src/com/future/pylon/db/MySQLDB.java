package com.future.pylon.db;

public class MySQLDB implements IDatabase {

	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String URL = "localhost";
	public static final String PORT = "3306";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "root";
	public static final String TYPE = "MySQL";

	public String getDriver() {
		return DRIVER;
	}

	public String getUrl() {
		return URL;
	}

	public String getPort() {
		return PORT;
	}

	public String getUsername() {
		return USERNAME;
	}

	public String getPassword() {
		return PASSWORD;
	}

	public String getType() {
		return TYPE;
	}
}
