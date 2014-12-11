package com.future.pylon.db;

public interface IDatabase {
	public String getDriver();

	public String getUrl();

	public String getPort();

	public String getUsername();

	public String getPassword();

	public String getType();
}
