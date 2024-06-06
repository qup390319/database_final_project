USE olivia;

-- 計算每個學生系所和課程領域的學生人次
SELECT 
    s.student_dept AS 學生系所,
    cf.curriculum_field AS 課程領域,
    COUNT(*) AS 人次,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM enrollment) * 100, 2) AS 占比
FROM 
    enrollment e
JOIN 
    course_arrangement ca ON e.course_arrangement_id = ca.arrangement_id
JOIN 
    curriculum_field cf ON ca.course_no = cf.course_no
JOIN 
    student s ON e.student_id = s.student_id
GROUP BY 
    s.student_dept, cf.curriculum_field
ORDER BY 
    s.student_dept, cf.curriculum_field;

