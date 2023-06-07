																					   <%@ page contentType="text/html; charset=utf-8" %>

<HTML>

<TITLE>JAVA INFOMATION</TITLE>

<HEAD>

<STYLE type="text/css">

<!--

body {background-color: #ffffff; color: #000000;}

body, td, th, h1, h2 {font-family: sans-serif;}

pre {margin: 0px; font-family: monospace;}

a:link {color: #000099; text-decoration: none; background-color: #ffffff;}

a:hover {text-decoration: underline;}

table {border-collapse: collapse;}

.center {text-align: center;}

.center table { margin-left: auto; margin-right: auto; text-align: left;}

.center th { text-align: center !important; }

td, th { border: 1px solid #000000; font-size: 75%; vertical-align: baseline;}

h1 {font-size: 150%;}

h2 {font-size: 125%;}

.p {text-align: left;}

.e {background-color: #ccccff; font-weight: bold; color: #000000;}

.h {background-color: #9999cc; font-weight: bold; color: #000000;}

.v {background-color: #cccccc; color: #000000; word-break:break-all;}

i {color: #666666; background-color: #cccccc;}

img {float: right; border: 0px;}

hr {width: 600px; background-color: #cccccc; border: 0px; height: 1px; color: #000000;}

//-->

</STYLE>

</HEAD>

<BODY>

<CENTER>

<TABLE border="0" cellpadding="3" width="100%">

<TR class="h">

    <TD>

    <A href="http://java.sun.com"><IMG border="0" src="http://java.sun.com/im/logo_java.gif" alt="Java Logo" /></A>

    <H1 class="p">Java Version <%= System.getProperty("java.vm.version") %></H1>

    </TD>

</TR>

</TABLE>

<BR />

<%!

    static String nf(long l){

        java.text.NumberFormat nf = java.text.NumberFormat.getInstance();

        return nf.format(l);

    }

%>

<%

    Runtime rt = Runtime.getRuntime();

 %>

<H1>JVM Memory Information</H1>

<TABLE border="0" cellpadding="3" width="100%">

    <TR><TD class="e" width="30%">maxMemory</TD><TD class="v"><%= nf(rt.maxMemory()) %> bytes</TD></TR>

    <TR><TD class="e" width="30%">totalMemory</TD><TD class="v"><%= nf(rt.totalMemory()) %> bytes</TD></TR>

    <TR><TD class="e" width="30%">freeMemory</TD><TD class="v"><%= nf(rt.freeMemory()) %> bytes</TD></TR>

    <TR><TD class="e" width="30%">availableProcessors</TD><TD class="v"><%= rt.availableProcessors() %></TD></TR>

</TABLE>

 

<H1>System Information</H1>

<TABLE border="0" cellpadding="3" width="100%">

<%

    java.util.Enumeration e = null;

    String key;

 

    java.util.Properties prop = System.getProperties();

    e = prop.propertyNames();

    while(e.hasMoreElements()){

        key = (String)e.nextElement();

 %>

    <TR><TD class="e" width="30%"><%= key %></TD><TD class="v"><%= System.getProperty(key) %></TD></TR>

<%

    }

 %>

</TABLE>

 

<H1>Encoding Information</H1>

<TABLE border="0" cellpadding="3" width="100%">

    <TR><TD class="e" width="30%">Locale Default Encoding</TD><TD class="v"><%= java.util.Locale.getDefault() %></TD></TR>

    <TR><TD class="e" width="30%">File Encoding</TD><TD class="v"><%= System.getProperty("file.encoding") %></TD></TR>

    <TR><TD class="e" width="30%">OutputStreamWriter Encoding</TD><TD class="v"><%= new java.io.OutputStreamWriter(System.out).getEncoding() %></TD></TR>

</TABLE>

 

<H1>Request Information</H1>

<TABLE border="0" cellpadding="3" width="100%">

    <TR><TD class="e" width="30%">Method</TD><TD class="v"><%= request.getMethod() %></TD></TR>

    <TR><TD class="e" width="30%">Request URI</TD><TD class="v"><%= request.getRequestURI() %></TD></TR>

    <TR><TD class="e" width="30%">Protocol</TD><TD class="v"><%= request.getProtocol() %></TD></TR>

    <TR><TD class="e" width="30%">PathInfo</TD><TD class="v"><%= request.getPathInfo() %></TD></TR>

    <TR><TD class="e" width="30%">Remote Address</TD><TD class="v"><%= request.getRemoteAddr() %></TD></TR>

    <TR class="h"><TH colspan="2">Headers</TH></TR>

<%

    e = request.getHeaderNames();

    while(e.hasMoreElements()){

        key = (String)e.nextElement();

 %>

    <TR><TD class="e" width="30%"><%= key %></TD><TD class="v"><%= request.getHeader(key) %></TD></TR>

<%

    }

 %>

    <TR class="h"><TH colspan="2">Sessions</TH></TR>

    <TR><TD class="e" width="30%">Session ID</TD><TD class="v"><%= session.getId() %></TD></TR>

    <TR><TD class="e" width="30%">Created</TD><TD class="v"><%= new java.util.Date(session.getCreationTime()) %></TD></TR>

    <TR><TD class="e" width="30%">Last Accessed</TD><TD class="v"><%= new java.util.Date(session.getLastAccessedTime()) %></TD></TR>

<%

    e = session.getAttributeNames();

    while (e.hasMoreElements()) {

        key = (String)e.nextElement();

 %>

    <TR><TD class="e" width="30%"><%= key %></TD><TD class="v"><%= session.getAttribute(key) %></TD></TR>

<%

    }

 %>

    <TR class="h"><TH colspan="2">Cookies</TH></TR>

<%

    Cookie[] cookies = request.getCookies();

    if ((cookies != null) && (cookies.length > 0)) {

        for (int i = 0; i < cookies.length; i++) {

            Cookie c = cookies[i];

 %>

    <TR><TD class="e" width="30%"><%= c.getName() %></TD><TD class="v"><%= c.getValue() %></TD></TR>

<%

        }

    }

 %>

    <TR class="h"><TH colspan="2">Parameters</TH></TR>

<%

    e = request.getParameterNames();

    while (e.hasMoreElements()) {

        key = (String)e.nextElement();

 %>

    <TR><TD class="e" width="30%"><%= key %></TD><TD class="v"><%= request.getParameter(key) %></TD></TR>

<%

    }

 %>

</TABLE>

 

<H1>Database Information</H1>

<%

    String className = request.getParameter("className");

    String dbUrl = request.getParameter("dbUrl");

    String dbUser = request.getParameter("dbUser");

    String dbPwd = request.getParameter("dbPwd");

    String query = request.getParameter("query");

 

    className = (className == null || "".equals(className))?"":className;

    dbUrl = (dbUrl == null || "".equals(dbUrl))?"":dbUrl;

    dbUser = (dbUser == null || "".equals(dbUser))?"":dbUser;

    dbPwd = (dbPwd == null || "".equals(dbPwd))?"":dbPwd;

    query = (query == null || "".equals(query))?"":query;

 

    //if("".equals(className) || "".equals(dbUrl) || "".equals(dbUser) || "".equals(dbPwd)) {

%>

<FORM name="form1" method="post" action="javaInfo.jsp">

<TABLE border="0" cellpadding="3" width="100%">

    <TR>

        <TD class="e" width="30%">JDBC Driver Class</TD>

        <TD class="v">

        <INPUT type="text" name="className" value="<%= className %>" style="width:40%">

        <INPUT type="submit" name="submit" value="Submit">

        <INPUT type="reset" name="reset" value="Reset">

        <INPUT type="button" name="button" value="Reload" onClick="location.href='javaInfo.jsp'">

        <BR>ex) oracle.jdbc.driver.OracleDriver</TD>

    </TR>

    <TR>

        <TD class="e" width="30%">Database URL</TD>

        <TD class="v">

        <INPUT type="text" name="dbUrl" value="<%= dbUrl %>" style="width:50%"><BR>ex) jdbc:oracle:thin:@127.0.0.1:1521:ORCL</TD>

    </TR>

    <TR>

        <TD class="e" width="30%">User Name</TD>

        <TD class="v"><INPUT type="text" name="dbUser" value="<%= dbUser %>" style="width:30%"><BR>ex) scott</TD>

    </TR>

    <TR>

        <TD class="e" width="30%">Password</TD>

        <TD class="v"><INPUT type="text" name="dbPwd" value="<%= dbPwd %>" style="width:30%"><BR>ex) tiger</TD>

    </TR>

    <TR>

        <TD class="e" width="30%">Validation Query</TD>

        <TD class="v"><TEXTAREA name="query" cols="35" rows="3" style="width:50%"><%= query %></TEXTAREA><BR>ex) select sysdate from dual</TD>

    </TR>

<%

    //}

    if(!"".equals(className) && !"".equals(dbUrl) && !"".equals(dbUser) && !"".equals(dbPwd)) {

%>

<%

    try {

        Class.forName(className);

    } catch(ClassNotFoundException err){

%>

    <TR><TD class="e" width="30%"><FONT style="color:red">ClassNotFoundException</FONT></TD><TD class="v"><FONT style="color:red"><%= err.getMessage() %></FONT></TD></TR>

<%

    }//end of if

 

    java.sql.DatabaseMetaData dmd = null;

    java.sql.Connection conn = null;

 

    java.sql.Statement stmt = null;

    java.sql.ResultSet rs = null;

    java.sql.ResultSetMetaData rsmd = null;

 

    try {

        conn = java.sql.DriverManager.getConnection(dbUrl, dbUser, dbPwd);

        dmd = conn.getMetaData();

%>

    <TR><TD class="e" width="30%">Driver Name</TD><TD class="v"><%= dmd.getDriverName() %></TD></TR>

    <TR><TD class="e" width="30%">Driver Version</TD><TD class="v"><%= dmd.getDriverVersion() %></TD></TR>

    <TR><TD class="e" width="30%">Driver Major Version</TD><TD class="v"><%= dmd.getDriverMajorVersion() %></TD></TR>

    <TR><TD class="e" width="30%">Driver Minor Version</TD><TD class="v"><%= dmd.getDriverMinorVersion() %></TD></TR>

    <TR><TD class="e" width="30%">Database Product Name</TD><TD class="v"><%= dmd.getDatabaseProductName() %></TD></TR>

    <TR><TD class="e" width="30%">Database Product Version</TD><TD class="v"><%= dmd.getDatabaseProductVersion() %></TD></TR>

<%

        if(!"".equals(query)) {

            long stime = System.currentTimeMillis();

            stmt = conn.createStatement();

            rs = stmt.executeQuery(query);

 

            rsmd = rs.getMetaData();

            int colCnt = rsmd.getColumnCount();

%>

    <TR class="h"><TH colspan="2">Query Result</TH></TR>

</TABLE>

</FORM>

 

<TABLE><TR><TD height="1" style="border:0"></TD></TR></TABLE>

 

<DIV STYLE="OVERFLOW-X:scroll;Height=auto;Width=100%">

<TABLE border="0" cellpadding="3" width="100%">

<%

            int rowCnt = 0;

            int maxCnt = 25;

            while(rs.next()) {

                rowCnt++;

                if(rowCnt == (maxCnt + 1)) break;

                if(rowCnt == 1) {

%>

    <TR>

        <TD class="e">NO</TD>

<%

                    for (int k = 1; k <= colCnt; k++) {

%>

        <TD class="e"><%= rsmd.getColumnName(k).toUpperCase() %></TD>

<%

                    }//end of for

%>

    </TR>

<%

                }//end of if

%>

    <TR>

        <TD class="v"><%= rowCnt %></TD>

<%

                    for (int k = 1; k <= colCnt; k++) {

%>

        <TD class="v"><%= rs.getString(k) %></TD>

<%

                    }//end of for

%>

    </TR>

<%

            }//end of while

            long etime = System.currentTimeMillis();

%>

    <TR>

        <TD class="e" colspan="<%= colCnt %>>">Only <%= maxCnt %> rows selected in <%= (etime - stime) %> ms.</TD>

    </TR>

<%

        }//end of if

    } catch(java.sql.SQLException err) {

%>

    <TR><TD class="e" width="30%"><FONT style="color:red">SQLException</FONT></TD><TD class="v"><FONT style="color:red"><%= err.getMessage() %></FONT></TD></TR>

<%

    } finally {

        if ( rs != null ) try{rs.close();}catch(Exception err){out.println(err.getMessage());}

        if ( stmt != null ) try{stmt.close();}catch(Exception err){out.println(err.getMessage());}

        if ( conn != null ) try{conn.close();}catch(Exception err){out.println(err.getMessage());}

    }//end of try

%>

</TABLE>

</DIV>

<%

    }//end of if

%>

</CENTER>

 

</BODY>

</HTML>