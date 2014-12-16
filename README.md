# DBPylon
DBPylon is a Java-based `gateway` between a private database and a remote application.
![alt text](https://github.com/VicCebedo/DBPylon/blob/master/docs/sysarchitecture.jpg)


## Why
1. You have a project that the `DB` needs to be in the `cloud`.
2. You check on some `PaaS providers`, and saw some `Free instances`.
3. You registered and found out that the Free instances were `really slow`.
4. So, you decided to just use instances for your DB and `deploy` the App `locally`.
5. But then, you realized that the only way you can get data from your PaaS was through `port-forwarding`.
6. So, you ask yourself "What if there was like a `gateway` that could pass data from `App to DB` and vice-versa?".


## Tested Servers
1. Apache Tomcat 6.0
2. JBoss 6.0


## Tested PaaS
1. RedHat OpenShift


## Compilation Using Eclipse
1. Download the `source` from the `master` branch [here](https://github.com/cebedovii/Pylon/archive/master.zip).
2. `Import` the Project to `Eclipse`.
3. Configure the `Build Path`.
4. Add needed `External JARs` and libraries from the `WebContent/WEB-INF` folder.
5. Configure `MySQLDB.java` with the correct details of your private MySQL Database.
6. Right-click on the Project Folder and `Export as WAR File`.


## Usage

### DB Type ID:
> DB Type ID refers to the ID passed to the client as a parameter. Currently, the only supported database is MySQL.

* MySQL = 1


### Constructor
```java
PylonClient(String SERVER_URL,
		int DB_TYPE_ID,
		String DB_NAME,
		String USERNAME,
		String PASSWORD
	)

// Example:
PylonClient client = new PylonClient(
	"http://localhost:8080/tmp/PylonController?",
	DatabaseMapping.DB_MYSQL,
	"sqlgateway",
	"Test1",
	"Test1"
);
```


#### Insert
```sql
INSERT INTO branches (Name, BranchID, Details) VALUES ('Magallanes', 44, 'None');
```
```java
public static void mySQLInsert() {
	PylonClient client = new PylonClient(
		"http://localhost:8080/tmp/PylonController?",
		DatabaseMapping.DB_MYSQL,
		"sqlgateway",
		"Test1",
		"Test1"
	);
	String[] columnsAndValues = {
		"Name='Magallanes'",
		"BranchID=44",
		"Details='None'"
	};
	boolean success = client.executeMySQLInsert("branches", columnsAndValues);
	System.out.println(success);
}
```


#### Select
```sql
SELECT * FROM items;
```
```java
public static void mySQLSelect() {
	PylonClient client = new PylonClient(
		"http://localhost:8080/tmp/PylonController?",
		DatabaseMapping.DB_MYSQL,
		"sqlgateway",
		"Test1",
		"Test1"
	);
	List<Map<String, SimpleEntry<String, String>>> items = client
			.executeMySQLSelect(
				"items",
				"SELECT * FROM items"
			);
	System.out.println(items.toString());
}
```


#### Update
```sql
UPDATE items SET Name='Keyboard', Price = 100 WHERE Price < 150 AND Deleted = false;
```
```java
public static void mySQLUpdate() {
	PylonClient client = new PylonClient(
		"http://localhost:8080/tmp/PylonController?",
		DatabaseMapping.DB_MYSQL,
		"sqlgateway",
		"Test1",
		"Test1"
	);
	String[] columnsAndValues = {
		"Name='Keyboard'",
		"Price = 100"
	};
	String[] conditions = {
		"Price < 150",
		"Deleted = false"
	};
	boolean success = client.executeMySQLUpdate(
				"items",
				columnsAndValues,
				conditions
			);
	System.out.println(success);
}
```


#### Delete
```sql
DELETE FROM sales WHERE SaleID = 1417419495515 AND Name = 'Pencil';
```
```java
public static void mySQLDelete() {
	PylonClient client = new PylonClient(
		"http://localhost:8080/tmp/PylonController?",
		DatabaseMapping.DB_MYSQL,
		"sqlgateway",
		"Test1",
		"Test1"
	);
	String[] conditions = {
		"SaleID = 1417419495515",
		"Name = 'Pencil'"
	};
	boolean success = client.executeMySQLDelete(
				"sales",
				conditions
			);
	System.out.println(success);
}
```


#### Get Columns List
```java
public static void mySQLGetColumnList() {
	PylonClient client = new PylonClient(
		"http://localhost:8080/tmp/PylonController?",
		DatabaseMapping.DB_MYSQL,
		"sqlgateway",
		"Test1",
		"Test1"
	);
	List<String> columnList = client.executeMySQLGetColumns("branches");
	System.out.println(columnList.toString());
}
```
