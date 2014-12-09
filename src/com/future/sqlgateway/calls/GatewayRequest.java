package com.future.sqlgateway.calls;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.future.sqlgateway.client.GatewayClient;
import com.future.sqlgateway.db.DAO;
import com.future.sqlgateway.util.RequestUtilities;

public class GatewayRequest extends HttpServletRequestWrapper {
	public static final String COLUMN_USERNAME = "Username";
	public static final String COLUMN_PASSWORD = "Password";
	public static final String COLUMN_DATE_TIME = "DateTime";

	public static final String PARAM_USERNAME = "username";
	public static final String PARAM_PASSWORD = "password";
	public static final String PARAM_TARGET_TABLE = "targetTable";
	public static final String PARAM_SQL = "sql";
	public static final String PARAM_QUERY_TYPE = "queryType";

	private String username;
	private String password;
	private String targetTable;
	private String sql;
	private int queryType;

	public GatewayRequest(HttpServletRequest request) {
		super(request);
		setUsername(RequestUtilities.getParameter(request, PARAM_USERNAME));
		setPassword(RequestUtilities.getParameter(request, PARAM_PASSWORD));
		setTargetTable(RequestUtilities.getParameter(request,
				PARAM_TARGET_TABLE));
		setSql(RequestUtilities.getParameter(request, PARAM_SQL));
		setQueryType(RequestUtilities.getParameterAsInt(request,
				PARAM_QUERY_TYPE));
	}

	public static void main(String[] args) {
		;
	}

	public boolean isAuthorized() {
		String usr = getUsername();
		String pw = getPassword();

		DAO dao = new DAO();
		String creds = dao.getCredentials(usr, pw);
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
				&& isValid(getSql())) {
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
		return getQueryType() == GatewayClient.QUERY_TYPE_UPDATE ? true : false;
	}

	public boolean isDelete() {
		return getQueryType() == GatewayClient.QUERY_TYPE_DELETE ? true : false;
	}

	public boolean isSelect() {
		return getQueryType() == GatewayClient.QUERY_TYPE_SELECT ? true : false;
	}

	public boolean isInsert() {
		return getQueryType() == GatewayClient.QUERY_TYPE_INSERT ? true : false;
	}

	public boolean isExecuteQuery() {
		return getQueryType() == GatewayClient.QUERY_TYPE_EXECUTE_QUERY ? true
				: false;
	}

	public boolean isExecuteSelect() {
		return getQueryType() == GatewayClient.QUERY_TYPE_EXECUTE_SELECT ? true
				: false;
	}

	public int getQueryType() {
		return queryType;
	}

	public void setQueryType(int queryType) {
		this.queryType = queryType;
	}

	public String getTargetTable() {
		return targetTable;
	}

	public void setTargetTable(String targetTable) {
		this.targetTable = targetTable;
	}

}
