package com.future.sqlgateway.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.future.sqlgateway.calls.GatewayRequest;
import com.future.sqlgateway.util.Utilities;

public class DAO {

	private Connection connection;

	public DAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sqlgateway", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		;
	}

	private Map<String, Object> constructResultMap(
			Map<String, Object> resultMap, String column, ResultSet result) {
		try {
			Object object;
			if (column.equals(GatewayRequest.COLUMN_DATE_TIME)) {
				object = result.getTimestamp(column);
			} else {
				object = result.getObject(column);
			}

			if (object instanceof Long) {
				resultMap.put(column, result.getLong(column));

			} else if (object instanceof String) {
				resultMap.put(column, result.getString(column));

			} else if (object instanceof Boolean) {
				resultMap.put(column, result.getBoolean(column));

			} else if (object instanceof Timestamp) {
				resultMap.put(column, object);

			} else if (object instanceof Integer) {
				resultMap.put(column, result.getInt(column));

			} else if (object instanceof Float) {
				resultMap.put(column, result.getFloat(column));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * Execute a select statement.
	 * 
	 * @param sql
	 * @param sql2
	 * @param valuesMap
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, Object>> executeQuery(String table, String sql) {
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet result = stmt.executeQuery();
			List<String> columnNames = getColumnNames(table, sql);
			List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();

			// Loop through each resulting row.
			while (result.next()) {
				Map<String, Object> resultMap = new HashMap<String, Object>();
				for (String column : columnNames) {
					resultMap = constructResultMap(resultMap, column, result);
				}
				mapList.add(resultMap);
			}
			result.close();
			stmt.close();
			connection.close();
			return mapList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<String> getColumnNames(String table, String sql) {
		int selectIndex = sql.indexOf("SELECT") + "SELECT".length();
		int fromIndex = sql.indexOf("FROM") + "FROM".length();
		sql = sql.substring(selectIndex, fromIndex).replace("FROM", "")
				.replace(" ", "");

		// If sql is asterisk, get all column names.
		if (sql.equals("*")) {
			try {
				// Prepare the statement.
				PreparedStatement stmt = connection
						.prepareStatement("SELECT * FROM " + table);
				ResultSet result = stmt.executeQuery();

				// Get the metadata and count.
				ResultSetMetaData metaData = result.getMetaData();
				int columnCount = metaData.getColumnCount();

				// The column count starts from 1.
				List<String> cols = new ArrayList<String>();
				for (int i = 1; i < columnCount + 1; i++) {
					String colName = metaData.getColumnName(i);
					cols.add(colName);
				}

				result.close();
				stmt.close();
				return cols;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// If not all, get columns from query.
		List<String> columns = Utilities.convertArrayToList(sql.split(","));
		return columns;
	}

	/**
	 * Execute an update or delete statement.
	 * 
	 * @param sql
	 * @param sql2
	 * @param valuesMap
	 * @return
	 */
	public boolean executeUpdate(String sql) {
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.executeUpdate();
			stmt.close();
			connection.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public String getCredentials(String userName, String password) {
		String sql = "SELECT * FROM credentials WHERE Username = ? AND Password = ? AND Deleted = false LIMIT 1";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, userName);
			stmt.setString(2, password);
			ResultSet result = stmt.executeQuery();

			String creds = "";
			while (result.next()) {
				String user = result.getString(GatewayRequest.COLUMN_USERNAME);
				String pass = result.getString(GatewayRequest.COLUMN_PASSWORD);
				creds = user + GatewayRequest.SEPARATOR_PIECES + pass;
			}
			return creds;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
}
