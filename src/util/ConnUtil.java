package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class ConnUtil {
	public static Connection getConnection() throws Exception {
		DataSource dataSource = (DataSource) new InitialContext()
				.lookup("java:comp/env/jdbc/mySql");
		return dataSource.getConnection();
	}

	public static DataSource getDataSource() {
		Properties props = new Properties();
		FileInputStream fis;
		BasicDataSource ds = new BasicDataSource();

		try {
			fis = new FileInputStream("db.properties");
			props.load(fis);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		ds.setDriverClassName(props.getProperty("MYSQL_DB_DRIVER_CLASS"));
		ds.setUrl(props.getProperty("MYSQL_DB_URL"));
		ds.setUsername(props.getProperty("MYSQL_DB_USERNAME"));
		ds.setPassword(props.getProperty("MYSQL_DB_PASSWORD"));
		return ds;
	}


	private static DataSource getDataSource1() {
		Properties props = new Properties();
		FileInputStream fis;
		MysqlDataSource mysqlDS = null;
		try {
			fis = new FileInputStream("db.properties");
			props.load(fis);
			mysqlDS = new MysqlDataSource();
			mysqlDS.setURL(props.getProperty("MYSQL_DB_URL"));
			mysqlDS.setUser(props.getProperty("MYSQL_DB_USERNAME"));
			mysqlDS.setPassword(props.getProperty("MYSQL_DB_PASSWORD"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mysqlDS;
	}
}
