package com.future.pylon.client;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.AbstractMap.SimpleEntry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.future.pylon.controller.PylonController;
import com.future.pylon.util.TraceUtilities;

public class PylonClient {

	private static final String IDENTIFIER_COLUMN_LIST = "[COLUMN_LIST]";
	private static final String IDENTIFIER_TABLE = "[TABLE]";
	private static final String IDENTIFIER_COLUMN_AND_VALUE = "[COLUMN_AND_VALUE]";
	private static final String IDENTIFIER_CONDITIONS = "[CONDITIONS]";

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

	protected static final int QUERY_TYPE_INSERT = 1;
	protected static final int QUERY_TYPE_SELECT = 2;
	protected static final int QUERY_TYPE_UPDATE = 3;
	protected static final int QUERY_TYPE_DELETE = 4;
	protected static final int QUERY_TYPE_EXECUTE_QUERY = 5;
	protected static final int QUERY_TYPE_EXECUTE_SELECT = 6;
	protected static final int QUERY_TYPE_GET_COLUMN_LIST = 7;

	private String serverURL;
	private int databaseType;
	private String databaseName;
	private String username;
	private String password;
	private String databaseTable;
	private String sql;
	private String rawResponse;
	private int queryType;
	private String[] targetColumns;
	private String[] columnAndValues;
	private String[] conditions;

	public PylonClient(String server, int databaseType, String databaseName,
			String user, String pass) {
		setDatabaseType(databaseType);
		setServerURL(server);
		setDatabaseName(databaseName);
		setUsername(user);
		setPassword(pass);
	}

	private String getUsername() {
		return username;
	}

	private void setUsername(String username) {
		this.username = username;
	}

	private String getPassword() {
		return password;
	}

	private void setPassword(String password) {
		this.password = password;
	}

	private String getDatabaseTable() {
		return databaseTable;
	}

	private void setDatabaseTable(String targetTable) {
		this.databaseTable = targetTable;
	}

	private String getSql() {
		return sql;
	}

	private void setSql(String sql) {
		this.sql = sql;
	}

	private int getQueryType() {
		return queryType;
	}

	private void setQueryType(int queryType) {
		this.queryType = queryType;
	}

	private String[] getTargetColumns() {
		return targetColumns;
	}

	@SuppressWarnings("unused")
	private void setTargetColumns(String... columns) {
		this.targetColumns = columns;
	}

	private String[] getConditions() {
		return conditions;
	}

	private void setConditions(String... conditions) {
		this.conditions = conditions;
	}

	/**
	 * Generate the sql based on the constructed object.
	 * 
	 * @return
	 */
	private String generateSelectSQL() {
		// SELECT [COLUMN_LIST] FROM [TABLE] [CONDITIONS]
		String table = getDatabaseTable();
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
	private void execute() {
		if (getQueryType() == QUERY_TYPE_INSERT) {
			setSql(generateInsertSQL());
		} else if (getQueryType() == QUERY_TYPE_SELECT) {
			setSql(generateSelectSQL());
		} else if (getQueryType() == QUERY_TYPE_UPDATE) {
			setSql(generateUpdateSQL());
		} else if (getQueryType() == QUERY_TYPE_DELETE) {
			setSql(generateDeleteSQL());
		}

		TraceUtilities.print(getSql() == null ? "null SQL on " + getQueryType()
				: getSql());

		String url = getServerURL();
		url += Query.PARAM_USERNAME + "=" + getUsername() + "&";
		url += Query.PARAM_PASSWORD + "=" + getPassword() + "&";
		url += Query.PARAM_QUERY_TYPE + "=" + getQueryType() + "&";
		url += Query.PARAM_DATABASE_TYPE + "=" + getDatabaseType() + "&";
		url += Query.PARAM_DATABASE_NAME + "=" + getDatabaseName() + "&";
		url += Query.PARAM_DATABASE_TABLE + "=" + getDatabaseTable() + "&";
		url += Query.PARAM_SQL + "=" + getSql();

		url = url.replaceAll("(\\r|\\n|\\r\\n)+", "\\\\n").replaceAll(" ",
				"%20");

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

		String table = getDatabaseTable();
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
		String table = getDatabaseTable();
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

		String table = getDatabaseTable();
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

	private String[] getColumnAndValues() {
		return columnAndValues;
	}

	private void setColumnAndValues(String... columnValue) {
		this.columnAndValues = columnValue;
	}

	private String getRawResponse() {
		return rawResponse;
	}

	private void setRawResponse(String rawResponse) {
		this.rawResponse = rawResponse;
	}

	/**
	 * Get the map of results.
	 * 
	 * @return
	 */
	private List<Map<String, SimpleEntry<String, String>>> select() {
		execute();
		String rowList = getRawResponse();
		List<Map<String, SimpleEntry<String, String>>> valuesMapList = new ArrayList<Map<String, SimpleEntry<String, String>>>();

		if (rowList.isEmpty()) {
			return new ArrayList<Map<String, SimpleEntry<String, String>>>();
		}
		for (String row : rowList.split("\n")) {
			row = row.trim();

			Map<String, SimpleEntry<String, String>> colValuesMap = new HashMap<String, SimpleEntry<String, String>>();
			String[] columnList = row.split(",");
			for (String column : columnList) {
				String columnName = column
						.split(PylonController.SEPARATOR_PIECES)[0];
				String value = column.split(PylonController.SEPARATOR_PIECES)[1];
				String dataType = column
						.split(PylonController.SEPARATOR_PIECES)[2];
				SimpleEntry<String, String> entry = new SimpleEntry<String, String>(
						value, dataType);

				colValuesMap.put(columnName, entry);
			}
			valuesMapList.add(colValuesMap);
		}
		return valuesMapList;
	}

	private boolean executeUpdate() {
		execute();
		String response = getRawResponse().trim();
		return response.equals("true") ? true : false;
	}

	/**
	 * Execute a MySQL update query.
	 * 
	 * @param table
	 * @param columnsAndValues
	 * @param conditions
	 * @return
	 */
	public boolean executeMySQLUpdate(String table, String[] columnsAndValues,
			String[] conditions) {
		setDatabaseTable(table);
		setColumnAndValues(columnsAndValues);
		setConditions(conditions);
		setQueryType(QUERY_TYPE_UPDATE);

		return executeUpdate();
	}

	/**
	 * Execute a MySQL Delete query.
	 * 
	 * @param table
	 * @param conditions
	 * @return
	 */
	public boolean executeMySQLDelete(String table, String[] conditions) {
		setDatabaseTable(table);
		setConditions(conditions);
		setQueryType(QUERY_TYPE_DELETE);
		return executeUpdate();
	}

	/**
	 * Execute a MySQL Insert query.
	 * 
	 * @param table
	 * @param columnsAndValues
	 * @return
	 */
	public boolean executeMySQLInsert(String table, String[] columnsAndValues) {
		setDatabaseTable(table);
		setColumnAndValues(columnsAndValues);
		setQueryType(QUERY_TYPE_INSERT);
		return executeUpdate();
	}

	private String getServerURL() {
		return serverURL;
	}

	private void setServerURL(String serverURL) {
		this.serverURL = serverURL;
	}

	public boolean executeMySQLQuery(String sql) {
		setSql(sql);
		setQueryType(QUERY_TYPE_EXECUTE_QUERY);
		execute();
		String response = getRawResponse().trim();
		return response.equals("true") ? true : false;
	}

	/**
	 * Execute a MySQL select query.
	 * 
	 * @param table
	 * @param sqlString
	 * @return
	 */
	public List<Map<String, SimpleEntry<String, String>>> executeMySQLSelect(
			String table, String sqlString) {
		setDatabaseTable(table);
		setSql(sqlString);
		setQueryType(QUERY_TYPE_EXECUTE_SELECT);
		return select();
	}

	/**
	 * Get list of columns in the database table.
	 * 
	 * @param table
	 * @return
	 */
	public List<String> executeMySQLGetColumns(String table) {
		setDatabaseTable(table);
		setQueryType(QUERY_TYPE_GET_COLUMN_LIST);
		execute();

		List<String> columnList = new ArrayList<String>();
		for (String column : getRawResponse().split("\n")[0].split(",")) {
			columnList.add(column.trim());
		}
		return columnList;
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
