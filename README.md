# Pylon
Pylon is a Java-based gateway between a private database and a remote application.


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

### MySQL
**PylonClient.java Constructor**
```java
public PylonClient(String SERVER_URL, int DB_TYPE_ID, String DB_NAME, String USERNAME, String PASSWORD)
```

#### Insert
```java
public static void mySQLInsert() {
	PylonClient client = new PylonClient("http://localhost:8080/tmp/PylonController?", DatabaseMapping.DB_MYSQL, "sqlgateway", "Test1", "Test1");

	String[] columnsAndValues = { "Name='Magallanes'", "BranchID=44", "Details='None'" };

	boolean success = client.executeMySQLInsert("branches", columnsAndValues);

	System.out.println(success);
}
```
#### Select

#### Update

#### Delete

#### Get Columns List

