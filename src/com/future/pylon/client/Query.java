package com.future.pylon.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.future.pylon.db.MySQLDAO;
import com.future.pylon.util.RequestUtilities;

public class Query extends HttpServletRequestWrapper {
	public static final String COLUMN_USERNAME = "Username";
	public static final String COLUMN_PASSWORD = "Password";
	public static final String COLUMN_DATE_TIME = "DateTime";

	public static final String PARAM_USERNAME = "username";
	public static final String PARAM_PASSWORD = "password";
	public static final String PARAM_DATABASE_TYPE = "databaseType";
	public static final String PARAM_DATABASE_NAME = "databaseName";
	public static final String PARAM_DATABASE_TABLE = "databaseTable";
	public static final String PARAM_SQL = "sql";
	public static final String PARAM_QUERY_TYPE = "queryType";

	private String username;
	private String password;
	private int databaseType;
	private String databaseName;
	private String databaseTable;
	private String sql;
	private int queryType;

	public Query(HttpServletRequest request) {
		super(request);
		setUsername(RequestUtilities.getParameter(request, PARAM_USERNAME));
		setPassword(RequestUtilities.getParameter(request, PARAM_PASSWORD));
		setDatabaseType(RequestUtilities.getParameterAsInt(request,
				PARAM_DATABASE_TYPE));
		setDatabaseName(RequestUtilities.getParameter(request,
				PARAM_DATABASE_NAME));
		setDatabaseTable(RequestUtilities.getParameter(request,
				PARAM_DATABASE_TABLE));
		setSql(RequestUtilities.getParameter(request, PARAM_SQL));
		setQueryType(RequestUtilities.getParameterAsInt(request,
				PARAM_QUERY_TYPE));
	}

	public static void main(String[] args) {
		;
	}

	/**
	 * Is the request authorized?<br>
	 * Check in database if the username and password are present.
	 * 
	 * @return
	 */
	public boolean isAuthorized() {
		MySQLDAO dao = new MySQLDAO(getDatabaseName());
		String creds = dao.getCredentials(getUsername(), getPassword());
		if (creds.isEmpty()) {
			return false;
		}
		return true;
	}

	/**
	 * Check validity of parameters.
	 * 
	 * @return
	 */
	public boolean hasValidParams() {
		if (isValid(getUsername()) && isValid(getPassword())
				&& (isGetColumnList() || isValid(getSql()))) {
			return true;
		}
		return false;
	}

	private boolean isValid(String str) {
		return str != null && !str.isEmpty() ? true : false;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String user) {
		this.username = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String pass) {
		this.password = pass;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public boolean isUpdate() {
		return getQueryType() == PylonClient.QUERY_TYPE_UPDATE ? true : false;
	}

	public boolean isDelete() {
		return getQueryType() == PylonClient.QUERY_TYPE_DELETE ? true : false;
	}

	public boolean isSelect() {
		return getQueryType() == PylonClient.QUERY_TYPE_SELECT ? true : false;
	}

	public boolean isInsert() {
		return getQueryType() == PylonClient.QUERY_TYPE_INSERT ? true : false;
	}

	public boolean isGetColumnList() {
		return getQueryType() == PylonClient.QUERY_TYPE_GET_COLUMN_LIST ? true
				: false;
	}

	public boolean isExecuteQuery() {
		return getQueryType() == PylonClient.QUERY_TYPE_EXECUTE_QUERY ? true
				: false;
	}

	public boolean isExecuteSelect() {
		return getQueryType() == PylonClient.QUERY_TYPE_EXECUTE_SELECT ? true
				: false;
	}

	public int getQueryType() {
		return queryType;
	}

	public void setQueryType(int queryType) {
		this.queryType = queryType;
	}

	public String getDatabaseTable() {
		return databaseTable;
	}

	public void setDatabaseTable(String targetTable) {
		this.databaseTable = targetTable;
	}

	public String getDatabaseName() {
		return databaseName;
	}

	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}

	public int getDatabaseType() {
		return databaseType;
	}

	public void setDatabaseType(int databaseType) {
		this.databaseType = databaseType;
	}
}
