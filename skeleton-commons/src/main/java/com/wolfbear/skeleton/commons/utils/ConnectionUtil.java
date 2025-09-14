package com.wolfbear.skeleton.commons.utils;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author wolfbear
 */
public class ConnectionUtil {
    private static HikariConfig config = new HikariConfig();
    private static HikariDataSource dataSource;
    
    private ConnectionUtil(){}
    
    public static Connection getConnection() throws SQLException{
        config.setJdbcUrl("");
        dataSource = new HikariDataSource(config);
        
        return dataSource.getConnection();
    }
}
