<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<nav>
    <a href="${pageContext.request.contextPath}/students" class="brand">🎓 Student MS</a>
    <ul>
        <li><a href="${pageContext.request.contextPath}/students">All Students</a></li>
        <li><a href="${pageContext.request.contextPath}/students?action=add">+ Register</a></li>
    </ul>
</nav>
<div class="container">
    <h1>Student Records</h1>
    <c:if test="${not empty message}">
        <div class="alert alert-${msgType}">${message}</div>
    </c:if>
    <div class="stats-grid">
        <div class="stat-card">
            <h3>${students.size()}</h3>
            <p>Total Students</p>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/students" method="get">
        <input type="hidden" name="action" value="search">
        <div class="search-bar">
            <input type="text" name="keyword" placeholder="Search by name, RegNo or field…" value="${keyword}">
            <button type="submit" class="btn btn-primary">Search</button>
            <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Clear</a>
            <a href="${pageContext.request.contextPath}/students?action=add" class="btn btn-success">+ Register New</a>
        </div>
    </form>
    <div class="card" style="padding:0; overflow:hidden;">
        <c:choose>
            <c:when test="${empty students}">
                <div class="empty-state">
                    <div class="icon">📋</div>
                    <p>No student records found.</p><br>
                    <a href="${pageContext.request.contextPath}/students?action=add" class="btn btn-success">Register First Student</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th><th>Reg No</th><th>Name</th><th>Field</th>
                                <th>Email</th><th>Phone</th><th>Date of Birth</th><th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}" varStatus="loop">
                                <tr>
                                    <td>${loop.count}</td>
                                    <td><strong>${student.regNo}</strong></td>
                                    <td>${student.name}</td>
                                    <td>${student.field}</td>
                                    <td>${student.email}</td>
                                    <td>${student.phone}</td>
                                    <td>${student.dateOfBirth}</td>
                                    <td>
                                        <div class="actions">
                                            <a href="${pageContext.request.contextPath}/students?action=view&regNo=${student.regNo}" class="btn btn-info btn-sm">View</a>
                                            <a href="${pageContext.request.contextPath}/students?action=edit&regNo=${student.regNo}" class="btn btn-warning btn-sm">Edit</a>
                                            <a href="${pageContext.request.contextPath}/students?action=delete&regNo=${student.regNo}"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('Delete student ${student.name}?')">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
