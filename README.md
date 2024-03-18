# Login Session Test JSP

- Java EE 9+
- JDK 17

## Tomcat context.xml direct path : login-demo.xml

`<CATALINA_HOME>/conf/Catalina/localhost/login-demo.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>

<Context path="/login-demo" docBase="<my-path>/java-webapp-login-session-check/src/main/webapp" debug="0" reloadable="true" crossContext="true" privileged="true"/>
```

### Maven build and context.xml

```bash
# Maven Version
Apache Maven 3.9.6 (bc0240f3c744dd6b6ec2920b3cd08dcc295161ae)
Maven home: /opt/homebrew/Cellar/maven/3.9.6/libexec
Java version: 21.0.1, vendor: Homebrew, runtime: /opt/homebrew/Cellar/openjdk/21.0.1/libexec/openjdk.jdk/Contents/Home
Default locale: ko_KR, platform encoding: UTF-8
OS name: "mac os x", version: "14.3.1", arch: "aarch64", family: "mac"
```

### Build

```bash
mvn package
```

### login-demo.xml

`<CATALINA_HOME>/conf/Catalina/localhost/login-demo.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>

<Context path="/login-demo" docBase="<my-path>/java-webapp-login-session-check/target/login-demo.war" debug="0" reloadable="true" crossContext="true" privileged="true"/>
```