USE olivia;

-- 插入 course 資料

--先刪除依賴記錄，刪除 course 表中的記錄之前，先刪除依賴於這些記錄的 course_arrangement 表中的相關記錄。

DELETE FROM course_arrangement WHERE course_no IN ('A0001', 'A0002', 'A0003', 'A0004', 'A0005', 'A0006', 'A0007');

DELETE FROM course WHERE course_no IN ('A0001', 'A0002', 'A0003', 'A0004', 'A0005', 'A0006', 'A0007');

INSERT INTO course (course_no, course_name, course_type, course_credit) VALUES 
('A0001', '微積分', '必修', 2),
('A0002', '計算機概論', '必修', 3),
('A0003', '統計學習', '選修', 3),
('A0004', '經濟學', '必修', 3),
('A0005', '統計學', '選修', 3),
('A0006', '音樂欣賞', '選修', 2),
('A0007', '演算法', '選修', 3);

