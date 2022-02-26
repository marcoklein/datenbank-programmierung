import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.lang.RuntimeException;
import java.util.Properties;

public class App {

    public static final String SCHEMA_NAME = "favnum";

    public static void main(String[] args) throws SQLException {
        if (args.length == 0) {
            throw new RuntimeException("Please provide the database password as a command line argument.");
        }
        System.out.println("Hello, World!");
        String url = String.format("jdbc:postgresql://localhost:5432/postgres?currentSchema=%s", SCHEMA_NAME);
        Properties props = new Properties();
        props.setProperty("user", "postgres");
        // password is passed in as first argument through command line
        props.setProperty("password", args[0]);
        Connection conn = DriverManager.getConnection(url, props);

        // %s = print string from argument, %n = new line
        System.out.printf("Connection established: %s%n", conn.getMetaData().getURL());

        // create schema and insert test data
        createSchema(conn);
        insertData(conn);
        queryData(conn);

        // free the connection
        conn.close();
    }

    public static void createSchema(Connection conn) throws SQLException {
        final Statement stmt = conn.createStatement();

        final String createSchemaSql = String.format("CREATE SCHEMA IF NOT EXISTS %s", SCHEMA_NAME);
        System.out.printf("Creating schema with: %s%n", createSchemaSql);
        stmt.executeUpdate(createSchemaSql);

        final String createTableSql = String.join(" ", "CREATE TABLE IF NOT EXISTS favorite_number",
                "(id SERIAL PRIMARY KEY, number INT4, reason VARCHAR(255))");
        System.out.printf("Creating table with: %s%n", createTableSql);
        stmt.executeUpdate(createTableSql);

        stmt.close();
    }

    public static void insertData(Connection conn) throws SQLException {
        // you can also use conn.createStatement() in conjunction with executeQuery()
        // however, this is prone to SQL injection as the normal statement does not
        // sanitize query params
        // therefore: always use a PreparedStatement if you have user input!

        final PreparedStatement stmt = conn
                .prepareStatement("INSERT INTO favorite_number (number, reason) VALUES (?, ?)");

        stmt.setInt(1, 1);
        stmt.setString(2, "One is cool.");
        System.out.println("Inserting data");
        stmt.executeUpdate();

        stmt.close();
    }

    public static void queryData(Connection conn) throws SQLException {
        final Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT * FROM favorite_number");
        System.out.println("Reading all entries...");
        while (rs.next()) {
            final int id = rs.getInt("id");
            final int number = rs.getInt("number");
            final String reason = rs.getString("reason");
            System.out.printf("Entry: id=%d, number=%d, reason=%s%n", id, number, reason);
        }

        stmt.close();
    }

    /**
     * Example of a stored procedure for lecture 4.
     * 
     * @param conn
     * @throws SQLException
     */
    public static void insertDataProcedure(Connection conn) throws SQLException {
        String sql = "CALL insert_data(?,?)";
        CallableStatement stmt = conn.prepareCall(sql);

        stmt.setString(1, "brown");
        stmt.setString(2, "project x");

        stmt.executeUpdate();

        stmt.close();
        conn.close();
    }
}
