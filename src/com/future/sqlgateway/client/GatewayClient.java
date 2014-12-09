package com.future.sqlgateway.client;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.future.sqlgateway.calls.GatewayRequest;

public class GatewayClient {

	private static final String QUERY_SERVER_URL = "http://localhost:8080/tmp/Gateway?";

	private static final String IDENTIFIER_COLUMN_LIST = "[COLUMN_LIST]";
	private static final String IDENTIFIER_TABLE = "[TABLE]";
	private static final String IDENTIFIER_CONDITIONS = "[CONDITIONS]";
	private static final String TEMPLATE_SELECT = "SELECT "
			+ IDENTIFIER_COLUMN_LIST + " FROM " + IDENTIFIER_TABLE + " "
			+ IDENTIFIER_CONDITIONS;

	private String username;
	private String password;
	private String targetTable;
	private String sql;
	private int queryType;
	private String[] targetColumns;
	private String[] conditions;

	public GatewayClient() {
		;
	}

	public GatewayClient(String user, String pass, String table, int type) {
		setUsername(user);
		setPassword(pass);
		setTargetTable(table);
		setQueryType(type);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTargetTable() {
		return targetTable;
	}

	public void setTargetTable(String targetTable) {
		this.targetTable = targetTable;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public int getQueryType() {
		return queryType;
	}

	public void setQueryType(int queryType) {
		this.queryType = queryType;
	}

	public static void main(String[] args) {
		;
	}

	public String[] getTargetColumns() {
		return targetColumns;
	}

	public void setTargetColumns(String... columns) {
		this.targetColumns = columns;
	}

	public String[] getConditions() {
		return conditions;
	}

	public void setConditions(String... conditions) {
		this.conditions = conditions;
	}

	public String generateSQL() {
		// SELECT [COLUMN_LIST] FROM [TABLE] [CONDITIONS]
		String table = getTargetTable();
		String sql = TEMPLATE_SELECT;
		String[] cols = getTargetColumns();
		String[] conds = getConditions();

		// Replace table.
		if (table == null || table.isEmpty()) {
			return "";
		}
		sql = sql.replace(IDENTIFIER_TABLE, table);

		// Set the column list.
		if (cols == null) {
			sql = sql.replace(IDENTIFIER_COLUMN_LIST, "*");
		} else {
			String colsStr = "";
			for (String col : cols) {
				colsStr += col + ",";
			}
			colsStr = colsStr.substring(0, colsStr.length() - 1);
			sql = sql.replace(IDENTIFIER_COLUMN_LIST, colsStr);
		}

		// Set the conditions.
		if (conds != null) {
			String condsStr = "WHERE ";
			int index = 0;

			// Loop through each condition.
			for (String condition : conds) {
				condsStr += condition;

				// If there's still a next element, add an AND.
				try {
					if (conds[index + 1] != null) {
						condsStr += " AND ";
					}
				} catch (Exception e) {
					;
				}
				index++;
			}
			sql = sql.replace(IDENTIFIER_CONDITIONS, condsStr);
		} else {
			sql = sql.replace(IDENTIFIER_CONDITIONS, "");
		}

		return sql;
	}

	public void execute() {
		setSql(generateSQL());

		String url = QUERY_SERVER_URL + GatewayRequest.PARAM_USERNAME + "="
				+ getUsername() + "&" + GatewayRequest.PARAM_PASSWORD + "="
				+ getPassword() + "&" + GatewayRequest.PARAM_QUERY_TYPE + "="
				+ getQueryType() + "&" + GatewayRequest.PARAM_TARGET_TABLE
				+ "=" + getTargetTable() + "&" + GatewayRequest.PARAM_SQL + "="
				+ getSql();
		url = url.replaceAll(" ", "%20");
		try {
			URL urlCall = new URL(url);
			HttpURLConnection conn = (HttpURLConnection) urlCall
					.openConnection();

			InputStreamReader stream = new InputStreamReader(
					conn.getInputStream());
			BufferedReader reader = new BufferedReader(stream);
			String line;
			String response = "";
			while ((line = reader.readLine()) != null) {
				if (line.isEmpty()) {
					continue;
				}
				response += line + "\n";
			}
			System.out.print(response);
			reader.close();
			stream.close();
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
