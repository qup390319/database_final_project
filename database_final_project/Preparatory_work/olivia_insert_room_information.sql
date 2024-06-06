USE olivia;

-- 插入 room_information 資料(刪除已存在的資料並重新插入)
DELETE FROM room_information WHERE course_room IN ('K205', 'L102', 'M-605', 'I1-018', 'I1-304', 'O-214');

INSERT INTO room_information (course_room, course_building) VALUES 
('K205', '工程一館'),
('L102', '工程五館'),
('M-605', '鴻經館'),
('I1-018', '管理二館'),
('I1-304', '管理二館'),
('O-214', '綜教館');
