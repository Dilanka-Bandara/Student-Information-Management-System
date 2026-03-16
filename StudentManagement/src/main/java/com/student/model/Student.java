package com.student.model;

import java.time.LocalDate;

/**
 * Model class representing a Student entity.
 * Maps to the 'students' table in the database.
 */
public class Student {

    private int id;
    private String regNo;
    private String name;
    private String email;
    private String phone;
    private String field;
    private LocalDate dateOfBirth;

    public Student() {}

    public Student(String regNo, String name, String email,
                   String phone, String field, LocalDate dateOfBirth) {
        this.regNo = regNo;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.field = field;
        this.dateOfBirth = dateOfBirth;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getRegNo() { return regNo; }
    public void setRegNo(String regNo) { this.regNo = regNo; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getField() { return field; }
    public void setField(String field) { this.field = field; }

    public LocalDate getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(LocalDate dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    @Override
    public String toString() {
        return "Student{id=" + id + ", regNo='" + regNo + "', name='" + name + "'}";
    }
}
