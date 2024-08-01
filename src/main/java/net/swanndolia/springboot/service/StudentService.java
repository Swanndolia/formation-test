package net.swanndolia.springboot.service;

import net.swanndolia.springboot.model.Student;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class StudentService {

    private final Map<UUID, Student> students;

    public StudentService() {
        students = new HashMap<>();

        Student studentA = Student.builder()
                .id(UUID.randomUUID())
                .firstName("Toto")
                .lastName("Toto")
                .age(18)
                .mail("Toto@gmail.com")
                .build();
        Student studentB = Student.builder()
                .id(UUID.randomUUID())
                .firstName("Tata")
                .lastName("Tata")
                .age(18)
                .mail("Tata@gmail.com")
                .build();
        Student studentC = Student.builder()
                .id(UUID.randomUUID())
                .firstName("Titi")
                .lastName("Titi")
                .age(18)
                .mail("Titi@gmail.com")
                .build();

        students.put(studentA.getId(), studentA);
        students.put(studentB.getId(), studentB);
        students.put(studentC.getId(), studentC);
    }

    public List<Student> getAllStudents() {
        return students.values().stream().toList();
    }

    public Student getStudentById(UUID id) {
        return students.get(id);
    }

    public List<Student> getStudentByName(String name) {
        return students.values().stream().filter(student -> student.getFirstName().equals(name)).collect(Collectors.toList());
    }

    public void addStudent(Student student) {
        students.put(student.getId(), student);
    }
    public void deleteStudent(UUID id) {
        students.remove(id);
    }

    public void modifyStudent(UUID id, Student student) {
        students.replace(id, new Student(id, student));
    }
}

