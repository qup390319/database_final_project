USE olivia;

INSERT INTO department_degree (dept, degree) VALUES 
('數學系', '學士'),
('資訊工程系', '學士'),
('資訊管理系', '學士'),
('資訊工程研究所', '碩士'),
('數學系碩士班', '碩士')
AS new
ON DUPLICATE KEY UPDATE
degree = new.degree;

-- 在這個語句中，給插入的值起了一個別名 new，然後在 ON DUPLICATE KEY UPDATE 子句中使用這個別名來引用插入的值。