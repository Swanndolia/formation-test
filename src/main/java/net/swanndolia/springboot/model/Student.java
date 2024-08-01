package net.swanndolia.springboot.model;

import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class Student {

    private UUID id;
    private String firstName;
    private String lastName;
    private String mail;
    private int age;

    public Student() {
        this.id = UUID.randomUUID();
    }

    public Student(UUID id, Student student) {
        this.id = id;
        this.firstName = student.getFirstName();
        this.lastName = student.getLastName();
        this.mail = student.getMail();
        this.age = student.getAge();
    }

    public Student(String firstName, String lastName, String mail, int age) {
        this.id = UUID.randomUUID();
        this.firstName = firstName;
        this.lastName = lastName;
        this.mail = mail;
        this.age = age;
    }
    public Student(UUID id, String firstName, String lastName, String mail, int age) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.mail = mail;
        this.age = age;
    }
}
