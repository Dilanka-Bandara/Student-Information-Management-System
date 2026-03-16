-- ============================================================
--  Student Management System – Database Setup Script
--  Run this in MySQL before starting the application.
-- ============================================================

CREATE DATABASE IF NOT EXISTS student_db
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE student_db;

CREATE TABLE IF NOT EXISTS students (
    id            INT          NOT NULL AUTO_INCREMENT,
    reg_no        VARCHAR(50)  NOT NULL UNIQUE,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL,
    phone         VARCHAR(20)  NOT NULL,
    field         VARCHAR(100) NOT NULL,
    date_of_birth DATE         NOT NULL,
    created_at    TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- Sample data (optional)
INSERT INTO students (reg_no, name, email, phone, field, date_of_birth) VALUES
('2021/CE/001', 'Amal Perera',    'amal@student.jfn.ac.lk',  '+94771234567', 'Computer Engineering',  '2001-03-14'),
('2021/CE/002', 'Nisha Fernando', 'nisha@student.jfn.ac.lk', '+94772345678', 'Computer Engineering',  '2001-07-22'),
('2021/EE/001', 'Kasun Silva',    'kasun@student.jfn.ac.lk', '+94773456789', 'Electrical Engineering','2000-11-05'),
('2022/CV/001', 'Priya Raj',      'priya@student.jfn.ac.lk', '+94774567890', 'Civil Engineering',     '2002-01-30');

SELECT * FROM students;
