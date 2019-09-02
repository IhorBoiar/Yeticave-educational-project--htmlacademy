INSERT INTO categories (name, sim_code) VALUES
    ('Доски и лыжи', 'boards'),
    ('Крепления' 'fastening'),
    ('Ботинки' 'boots'),
    ('Одежда' 'clothes'),
    ('Инструменты' 'instruments'),
    ('Разное' 'other');
// Существующий список категорий;

INSERT INTO users (name, email, password) VALUES
    ('ihor', 'e@i.ua', 'secret', 'Russia, St.P'),
    ('vasya', 'b@i.ua', 'secret', 'Ukraine, Rovno'),
    ('sasha', 'a@i.ua', 'secret', 'Belarus, Minsk');
// Придумайте пару пользователей;


INSERT INTO lots (name, description, price, img, category_id, time_exit) VALUES
    ('2014 Rossignol District Snowboard', 'here is description', 10999, 'img/lot-1.jpg', 1, '2019-10-10 15:00'),
    ('DC Ply Mens 2016/2017 Snowboard', 'here is description', 15999, 'img/lot-2.jpg', 1, '2019-10-16'),
    ('Крепления Union Contact Pro 2015 года размер L/XL', 'here is description', 8000, 'img/lot-3.jpg', 2, '2019-10-10 15:25'),
    ('Ботинки для сноуборда DC Mutiny Charocal', 'here is description', 10999, 'img/lot-4.jpg', 3, '2019-10-13'),
    ('Куртка для сноуборда DC Mutiny Charocal', 'here is description', 7500, 'img/lot-5.jpg', 4, '2019-10-21'),
    ('Маска Oakley Canopy', 'here is description', 5400, 'img/lot-6.jpg', 6, '2019-10-31');
// Существующий список объявлений;

INSERT INTO bets (price, user_id, lot_id) VALUES
    (1000, 1, 3),
    (2000, 2, 2),
    (3000, 3, 4);
// Добавьте пару ставок для любого объявления.

SELECT l.id, name, description, price, img, category_id, time_exit, user_id FROM lots l
JOIN categories c
ON c.category_id = l.id;
//

SELECT l.id, name, description, price, img, category_id, time_exit, user_id FROM lots l
JOIN users u
ON u.id = l.user_id;


SELECT b.price FROM bets b
JOIN users u
ON b.user_id = u.id;
// 

SELECT b.price FROM bets b
JOIN lots l
ON b.lot_id = l.id;
//

SELECT * FROM categories;
// получить все категории;

SELECT name, category_id FROM lots ORDER BY dd_add DESC;
// получить самые новые, открытые лоты. Каждый лот должен включать название,
стартовую цену, ссылку на изображение, цену, название категории;

SELECT name, category_id FROM lots;
// показать лот по его id. Получите также название категории, к которой принадлежит лот;

UPDATE lots SET name = 'Changed item' WHERE id = 2;
// обновить название лота по его идентификатору;

SELECT * FROM bets ORDER BY date DESC; 
// получить список ставок для лота по его идентификатору с сортировкой по дате.