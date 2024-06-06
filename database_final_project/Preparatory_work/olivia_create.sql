USE olivia;

 -- 建立部門學位表
CREATE TABLE department_degree (
    dept VARCHAR(50) PRIMARY KEY,
    degree VARCHAR(50) NOT NULL
);

-- 建立學生表
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    student_dept VARCHAR(50) NOT NULL,
    student_grade INT NOT NULL,
    student_status VARCHAR(20) NOT NULL,
    student_class VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_dept) REFERENCES department_degree(dept)
);

-- 建立課程表
CREATE TABLE course (
    course_no VARCHAR(50) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_type VARCHAR(20) NOT NULL,
    course_credit INT NOT NULL
);

-- 建立課程領域表
CREATE TABLE curriculum_field (
    curriculum_field VARCHAR(100) PRIMARY KEY,
    course_no VARCHAR(50),
    FOREIGN KEY (course_no) REFERENCES course(course_no)
);

-- 建立教室資訊表
CREATE TABLE room_information (
    course_room VARCHAR(20) PRIMARY KEY,
    course_building VARCHAR(50) NOT NULL
);

-- 建立課程安排表
CREATE TABLE course_arrangement (
    arrangement_id INT PRIMARY KEY,
    course_no VARCHAR(50) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    course_room VARCHAR(20) NOT NULL,
    course_time VARCHAR(50) NOT NULL,
    course_limit INT NOT NULL,
    course_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (course_no) REFERENCES course(course_no),
    FOREIGN KEY (course_room) REFERENCES room_information(course_room)
);

-- 建立教師表
CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50) NOT NULL
);

-- 建立教授課程表
CREATE TABLE teach (
    teacher_id INT,
    course_arrangement_id INT,
    PRIMARY KEY (teacher_id, course_arrangement_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);

-- 建立選課表
CREATE TABLE enrollment (
    student_id INT,
    course_arrangement_id INT,
    select_result VARCHAR(20) NOT NULL,
    PRIMARY KEY (student_id, course_arrangement_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);

-- 建立課程評分表
CREATE TABLE course_score (
    student_id INT,
    course_arrangement_id INT,
    course_score FLOAT,
    PRIMARY KEY (student_id, course_arrangement_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);

-- 建立教學評量表
CREATE TABLE course_feedback (
    student_id INT,
    course_arrangement_id INT,
    feedback_rank INT,
    PRIMARY KEY (student_id, course_arrangement_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_arrangement_id) REFERENCES course_arrangement(arrangement_id)
);

-- 建立點名表
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_no VARCHAR(50),
    attendance_date DATE,
    attendance_status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_no) REFERENCES course(course_no)
);
