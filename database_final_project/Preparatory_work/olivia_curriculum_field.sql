USE olivia;

-- 刪除現有的表（如果存在）
DROP TABLE IF EXISTS curriculum_field;

-- 重新創建表，使用組合主鍵
CREATE TABLE curriculum_field (
    curriculum_field VARCHAR(100),
    course_no VARCHAR(50),
    PRIMARY KEY (curriculum_field, course_no),
    FOREIGN KEY (course_no) REFERENCES course(course_no)
);

-- 插入 curriculum_field 表數據
INSERT INTO curriculum_field (curriculum_field, course_no) VALUES 
('理論數學', 'A0001'), -- 微積分
('基礎知識', 'A0002'), -- 計算機概論
('人工智慧', 'A0002'), -- 計算機概論 (第二領域)
('財務工程', 'A0003'), -- 統計學習
('統計推論', 'A0003'), -- 統計學習 (第二領域)
('基礎知識', 'A0004'), -- 經濟學
('基礎知識', 'A0005'), -- 統計學
('人文思想', 'A0006'), -- 音樂欣賞
('人工智慧', 'A0007'), -- 演算法
('資料科學', 'A0007'); -- 演算法 (第二領域)
