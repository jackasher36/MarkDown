# Log4j properties

```properties
log4j.rootLogger=DEBUG, stdout

# SqlMap logging configuration...
log4j.logger.com.ibatis=DEBUG
log4j.logger.com.ibatis.common.jdbc.SimpleDataSource=DEBUG
log4j.logger.com.ibatis.sqlmap.engine.cache.CacheModel=DEBUG
log4j.logger.com.ibatis.sqlmap.engine.impl.SqlMapClientImpl=DEBUG
log4j.logger.com.ibatis.sqlmap.engine.builder.xml.SqlMapParser=DEBUG
log4j.logger.com.ibatis.common.util.StopWatch=DEBUG
log4j.logger.java.sql.Connection=DEBUG
log4j.logger.java.sql.Statement=DEBUG
log4j.logger.java.sql.PreparedStatement=DEBUG
log4j.logger.java.sql.ResultSet=DEBUG

# Console output...
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
log4j.appender.stdout.layout.ConversionPattern=%5p [%t] - %m%n
```

