<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Student</title>
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
    <h1>Register New Student</h1>
    <div class="card">
        <form action="${pageContext.request.contextPath}/students" method="post">
            <input type="hidden" name="action" value="add">
            <div class="form-row">
                <div class="form-group">
                    <label for="regNo">Registration Number *</label>
                    <input type="text" id="regNo" name="regNo" placeholder="e.g. 2021/CS/001" required>
                </div>
                <div class="form-group">
                    <label for="name">Full Name *</label>
                    <input type="text" id="name" name="name" placeholder="Enter full name" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" placeholder="student@example.com" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number *</label>
                    <input type="tel" id="phone" name="phone" placeholder="+94 77 123 4567" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="field">Field of Study *</label>
                    <select id="field" name="field" required>
                        <option value="">-- Select Field --</option>
                        <option value="Computer Engineering">Computer Engineering</option>
                        <option value="Electrical Engineering">Electrical Engineering</option>
                        <option value="Civil Engineering">Civil Engineering</option>
                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                        <option value="Electronic Engineering">Electronic Engineering</option>
                        <option value="Chemical Engineering">Chemical Engineering</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dateOfBirth">Date of Birth *</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" required>
                </div>
            </div>
            <div style="display:flex; gap:12px; margin-top:10px;">
                <button type="submit" class="btn btn-success">✔ Register Student</button>
                <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
