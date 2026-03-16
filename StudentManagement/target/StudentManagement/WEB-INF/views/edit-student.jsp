<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
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
    <h1>Edit Student — ${student.regNo}</h1>
    <div class="card">
        <form action="${pageContext.request.contextPath}/students" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="regNo" value="${student.regNo}">
            <div class="form-row">
                <div class="form-group">
                    <label>Registration Number</label>
                    <input type="text" value="${student.regNo}" disabled style="background:#eee; cursor:not-allowed;">
                </div>
                <div class="form-group">
                    <label for="name">Full Name *</label>
                    <input type="text" id="name" name="name" value="${student.name}" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" value="${student.email}" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number *</label>
                    <input type="tel" id="phone" name="phone" value="${student.phone}" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="field">Field of Study *</label>
                    <select id="field" name="field" required>
                        <option value="">-- Select Field --</option>
                        <c:forEach var="f" items="${['Computer Engineering','Electrical Engineering','Civil Engineering','Mechanical Engineering','Electronic Engineering','Chemical Engineering']}">
                            <option value="${f}" <c:if test="${student.field == f}">selected</c:if>>${f}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth *</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required>
                </div>
            </div>
            <div style="display:flex; gap:12px; margin-top:10px;">
                <button type="submit" class="btn btn-primary">💾 Save Changes</button>
                <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
