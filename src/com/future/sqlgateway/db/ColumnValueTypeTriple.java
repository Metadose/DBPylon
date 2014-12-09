package com.future.sqlgateway.db;

public class ColumnValueTypeTriple {

	private String name;
	private String value;
	private String dataType;

	public ColumnValueTypeTriple() {
		;
	}

	public ColumnValueTypeTriple(String colName, String colValue,
			String colDataType) {
		setName(colName);
		setValue(colValue);
		setDataType(colDataType);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public static void main(String[] args) {
		;
	}

}
