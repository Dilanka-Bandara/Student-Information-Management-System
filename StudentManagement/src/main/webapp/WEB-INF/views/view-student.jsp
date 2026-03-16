<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student</title>
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
    <h1>Student Profile</h1>
    <div class="card">
        <h2 style="margin-bottom:20px;">${student.name}</h2>
        <div class="detail-grid">
            <div class="detail-item">
                <label>Registration Number</label>
                <p>${student.regNo}</p>
            </div>
            <div class="detail-item">
                <label>Full Name</label>
                <p>${student.name}</p>
            </div>
            <div class="detail-item">
                <label>Email Address</label>
                <p>${student.email}</p>
            </div>
            <div class="detail-item">
                <label>Phone Number</label>
                <p>${student.phone}</p>
            </div>
            <div class="detail-item">
                <label>Field of Study</label>
                <p>${student.field}</p>
            </div>
            <div class="detail-item">
                <label>Date of Birth</label>
                <p>${student.dateOfBirth}</p>
            </div>
        </div>
        <div style="margin-top:24px; display:flex; gap:12px;">
            <a href="${pageContext.request.contextPath}/students?action=edit&regNo=${student.regNo}" class="btn btn-warning">✏ Edit</a>
            <a href="${pageContext.request.contextPath}/students?action=delete&regNo=${student.regNo}"
               class="btn btn-danger"
               onclick="return confirm('Delete this student permanently?')">🗑 Delete</a>
            <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">← Back</a>
        </div>
    </div>
</div>
</body>
</html>
