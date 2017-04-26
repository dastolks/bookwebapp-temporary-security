<%-- 
    Document   : listAuthors
    Created on : Sep 21, 2015, 9:36:05 PM
    Author     : jlombardo
    Purpose    : display list of author records and (in the future) provide
                 a way to add/edit/delete records
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Search</title>
    </head>
    <body>
        <h1>Book Search</h1>
        <p><b>Instructions: </b>Enter</p>

        <form method="POST" action="BookController?action=search">
            <table width="500" border="1" cellspacing="0" cellpadding="4">
                <tr>
                    <td>
                    <input type="submit" value="Search" name="mysubmit" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><b>Author: </b></td>
                    <td>
                        <select id='author' name='author'>
                            <option value='All' selected>All</option>
                            <c:forEach var="auth" items="${authors}" varStatus="rowCount">
                                <option value='${auth.authorId}'>${auth.authorName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b>ISBN (all or starting with): </b></td>
                    <td><input type='text' id="isbn" name='isbn'/></td>
                </tr>
                <tr>
                    <td><b>Title (all or starting with): </b></td>
                    <td><input type='text' id="title" name='title'/></td>
                </tr>
            </table>
        </form>
<p>Click here to go back to Home Page <a href="index.html">Home</a></p>

        <c:if test="${errMsg != null}">
            <p style="font-weight: bold;color: red;width:500px;">Sorry, data could not be retrieved:<br>
                ${errMsg}</p>
            </c:if>        
    </body>
</html>
