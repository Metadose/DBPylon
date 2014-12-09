package com.future.sqlgateway.client;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.future.sqlgateway.calls.GatewayRequest;
import com.future.sqlgateway.util.TraceUtilities;

public class GatewayClient {

	private static final String IDENTIFIER_COLUMN_LIST = "[COLUMN_LIST]";
	private static final String IDENTIFIER_TABLE = "[TABLE]";
	private static final String IDENTIFIER_COLUMN_AND_VALUE = "[COLUMN_AND_VALUE]";
	private static final String IDENTIFIER_CONDITIONS = "[CONDITIONS]";

	public static final String SEPARATOR_PIECES = "[=]";

	private static final String TEMPLATE_INSERT = "INSERT INTO "
			+ IDENTIFIER_TABLE + " " + IDENTIFIER_COLUMN_AND_VALUE;
	private static final String TEMPLATE_SELECT = "SELECT "
			+ IDENTIFIER_COLUMN_LIST + " FROM " + IDENTIFIER_TABLE + " "
			+ IDENTIFIER_CONDITIONS;
	private static final String TEMPLATE_DELETE = "DELETE FROM "
			+ IDENTIFIER_TABLE + " " + IDENTIFIER_CONDITIONS;
	private static final String TEMPLATE_UPDATE = "UPDATE " + IDENTIFIER_TABLE
			+ " SET " + IDENTIFIER_COLUMN_AND_VALUE + " "
			+ IDENTIFIER_CONDITIONS;

	public static final int QUERY_TYPE_INSERT = 1;
	public static final int QUERY_TYPE_SELECT = 2;
	public static final int QUERY_TYPE_UPDATE = 3;
	public static final int QUERY_TYPE_DELETE = 4;

	private String serverURL;
	private String username;
	private String password;
	private String targetTable;
	private String sql;
	private String rawResponse;
	private int queryType;
	private String[] targetColumns;
	private String[] columnAndValues;
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

	public GatewayClient(String user, String pass) {
		setUsername(user);
		setPassword(pass);
	}

	public GatewayClient(String server, String user, String pass) {
		setServerURL(server);
		setUsername(user);
		setPassword(pass);
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

	/**
	 * Generate the sql based on the constructed object.
	 * 
	 * @return
	 */
	public String generateSelectSQL() {
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

	/**
	 * Create a connection to the gateway and output the result.
	 */
	public void execute() {
		if (getQueryType() == QUERY_TYPE_INSERT) {
			setSql(generateInsertSQL());
		} else if (getQueryType() == QUERY_TYPE_SELECT) {
			setSql(generateSelectSQL());
		} else if (getQueryType() == QUERY_TYPE_UPDATE) {
			setSql(generateUpdateSQL());
		} else if (getQueryType() == QUERY_TYPE_DELETE) {
			setSql(generateDeleteSQL());
		}

		TraceUtilities.print(getSql());

		String url = getServerURL() + GatewayRequest.PARAM_USERNAME + "="
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
			setRawResponse(response);
			reader.close();
			stream.close();
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String generateInsertSQL() {
		// INSERT INTO table_name (column1, column2, column3,...) VALUES
		// (value1, value2, value3,...)

		String table = getTargetTable();
		String sql = TEMPLATE_INSERT;
		String[] columnAndVals = getColumnAndValues();

		// Replace table.
		if (table == null || table.isEmpty() || columnAndVals == null
				|| columnAndVals.length == 0) {
			return "";
		}

		sql = sql.replace(IDENTIFIER_TABLE, table);

		String columnStr = "(";
		String valuesStr = "VALUES (";
		int i = 0;

		// Loop through each condition.
		for (String colAndVal : columnAndVals) {
			String column = colAndVal.split("=")[0];
			String value = colAndVal.split("=")[1];

			columnStr += column;
			valuesStr += value;

			// If there's still a next element, add an AND.
			try {
				if (columnAndVals[i + 1] != null) {
					columnStr += ", ";
					valuesStr += ", ";
				}
			} catch (Exception e) {
				;
			}
			i++;
		}
		columnStr += ")";
		valuesStr += ")";
		sql = sql.replace(IDENTIFIER_COLUMN_AND_VALUE, columnStr + valuesStr);

		return sql;
	}

	private String generateDeleteSQL() {
		// DELETE FROM [TABLE] [CONDITIONS]
		String table = getTargetTable();
		String sql = TEMPLATE_DELETE;
		String[] conds = getConditions();

		// Replace table.
		if (table == null || table.isEmpty()) {
			return "";
		}
		sql = sql.replace(IDENTIFIER_TABLE, table);

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

	private String generateUpdateSQL() {
		// UPDATE table_name
		// SET column1=value, column2=value2,...
		// WHERE some_column=some_value

		String table = getTargetTable();
		String sql = TEMPLATE_UPDATE;
		String[] columnAndVals = getColumnAndValues();
		String[] conds = getConditions();

		// Replace table.
		if (table == null || table.isEmpty() || columnAndVals == null
				|| columnAndVals.length == 0) {
			return "";
		}

		sql = sql.replace(IDENTIFIER_TABLE, table);

		String columnValStr = "";
		int i = 0;

		// Loop through each condition.
		for (String colAndVal : columnAndVals) {
			columnValStr += colAndVal;

			// If there's still a next element, add an AND.
			try {
				if (columnAndVals[i + 1] != null) {
					columnValStr += ", ";
				}
			} catch (Exception e) {
				;
			}
			i++;
		}
		sql = sql.replace(IDENTIFIER_COLUMN_AND_VALUE, columnValStr);

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

	public String[] getColumnAndValues() {
		return columnAndValues;
	}

	public void setColumnAndValues(String... columnValue) {
		this.columnAndValues = columnValue;
	}

	public String getRawResponse() {
		return rawResponse;
	}

	public void setRawResponse(String rawResponse) {
		this.rawResponse = rawResponse;
	}

	/**
	 * Get the map of results.
	 * 
	 * @return
	 */
	public List<Map<String, String>> select() {
		execute();
		String rowList = getRawResponse();
		List<Map<String, String>> valuesMapList = new ArrayList<Map<String, String>>();

		for (String row : rowList.split("\n")) {
			row = row.trim();

			Map<String, String> colValuesMap = new HashMap<String, String>();
			String[] columnList = row.split(",");
			for (String column : columnList) {
				String columnName = column.split(SEPARATOR_PIECES)[0];
				String value = column.split(SEPARATOR_PIECES)[1];
				colValuesMap.put(columnName, value);
			}
			valuesMapList.add(colValuesMap);
		}
		return valuesMapList;
	}

	public boolean executeUpdate() {
		execute();
		String response = getRawResponse().trim();
		return response.equals("true") ? true : false;
	}

	public boolean update() {
		return executeUpdate();
	}

	public boolean delete() {
		return executeUpdate();
	}

	public boolean insert() {
		return executeUpdate();
	}

	public String getServerURL() {
		return serverURL;
	}

	public void setServerURL(String serverURL) {
		this.serverURL = serverURL;
	}
}
