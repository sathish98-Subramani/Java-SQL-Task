use mydatabase;
use book;
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(8,2),
    published_date DATE,
    in_stock INT DEFAULT 1
);

INSERT INTO Books (title, isbn, price, published_date, in_stock)
VALUES
('Python Essentials', 'BK1001', 499.00, '2019-02-15', 12),
('Machine Learning Basics', 'BK1002', 799.00, '2023-06-10', 6),
('Data Structures in C', 'BK1003', 599.00, '2018-09-20', 0),
('Cloud Computing', 'BK1004', 899.00, '2021-11-05', 15);

INSERT INTO Books (title, isbn, price, published_date)
VALUES
('Web Development Guide', 'BK1005', 450.00, '2020-08-18');

ALTER TABLE Books
RENAME COLUMN title TO book_title;

ALTER TABLE Books
MODIFY COLUMN price FLOAT;

ALTER TABLE Books
ADD COLUMN author_name VARCHAR(50) NOT NULL DEFAULT 'AuthorName_Unknown';

UPDATE Books
SET price = price * 0.90
WHERE published_date < '2020-01-01';

DELETE FROM Books
WHERE in_stock = 0;

ALTER TABLE Books
AUTO_INCREMENT = 101;

SELECT book_title, price, published_date
FROM Books
WHERE book_title LIKE '%Guide%'
AND price > 300
ORDER BY price DESC;

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT (CURDATE())
);

INSERT INTO Members (member_name, join_date)
VALUES ('Sathish', '2024-01-15'),
('Surya', '2024-03-20'),
('Sulthan', '2023-09-18'),
('Paramaguru', '2024-07-10');

SELECT *
FROM Members
WHERE YEAR(join_date) = 2024
ORDER BY member_name ASC;