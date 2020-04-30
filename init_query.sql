drop database wittershoedb;
CREATE DATABASE wittershoedb CHARACTER SET utf8;

use wittershoedb;



insert into mainapp_color(colorName, colorDesc) values
(N'Đen' , N''),
(N'Trắng' , N''),
(N'Đỏ' , N''),
(N'Vàng' , N''),
(N'Nâu' , N''),
(N'Xám' , N''),
(N'Lam' , N''),
(N'Lục' , N''),
(N'Hồng' , N''),
(N'Nhiều màu', N'');
select * from mainapp_color;

insert into mainapp_category(categoryName, categoryThumbnail, categoryDesc) values
(N'Giày da', '1_da.jpg', ''),
(N'Giày lười', '2_luoi.jpg', ''),
(N'Giày thể thao', '3_thethao.jpg', ''),
(N'Giày cao cổ', '4_caoco.jpg', ''),
(N'Giày vải', '5_vai.jpg', ''),
(N'Giày bata', '6_bata.jpg', '');
select * from mainapp_category;

insert into mainapp_brand(brandName, brandDesc) values
(N'Unknown', N''),
(N'Nike', N''),
(N'Adidas', N''),
(N'Gucci', N''),
(N'Louis Vuitton', N''),
(N'Versace', N'');

--      ***********           giay luoi    *******************************
insert into mainapp_shoe(shoeName, shoeThumbnail, active, dateCreated, quantitySold, viewCount, favouriteCount, shoeDesc, category_id, brand_id) values 
(N'Giày lười Louis Vuitton họa tiết bàn cờ GLLV12', N'GLLV12_1.jpg', 1, '2019-09-02', 550, 1500, 1000, N'Giày êm chạy không đau chân', 2, 1),
(N'Giày lười Louis Vuitton họa tiết da nhăn GLLV25',  N'GLLV25_1.jpg', 1, '2020-02-22', 370,1100, 2200, N'Giày êm chạy không đau chân', 2, 1),
(N'Giày lười Louis Vuitton họa tiết ô rạn GLLV09', N'GLLV09_1.jpg', 1, '2020-02-12', 480, 1900, 1600, N'Giày êm chạy không đau chân', 2, 1),
(N'Giày lười Louis Vuitton like au họa tiết rạn GLLV22',  N'GLLV22_1.jpg', 1, '2020-01-12', 290, 2000, 1900, N'Giày êm chạy không đau chân', 2, 1),
(N'Giày lười Versace họa tiết vân lá GLV08', N'GLV08_1.jpg', 1, '2020-03-20', 350, 3000, 2000, N'Giày êm chạy không đau chân', 2, 1);

insert into mainapp_image(imageName, imageDesc ,shoe_id) values
(N'GLLV12_1.jpg', '', 1),
(N'GLLV12_2.jpg', '', 1),
(N'GLLV12_3.jpg', '', 1),
(N'GLLV12_4.jpg', '', 1),
(N'GLLV12_5.jpg', '', 1),
(N'GLLV25_1.jpg', '', 2),
(N'GLLV25_2.jpg', '', 2),
(N'GLLV25_3.jpg', '', 2),
(N'GLLV25_4.jpg', '', 2),
(N'GLLV25_5.jpg', '', 2),
(N'GLLV09_1.jpg', '', 3),
(N'GLLV09_2.jpg', '', 3),
(N'GLLV09_3.jpg', '', 3),
(N'GLLV09_4.jpg', '', 3),
(N'GLLV09_5.jpg', '', 3),
(N'GLLV22_1.jpg', '', 4),
(N'GLLV22_2.jpg', '', 4),
(N'GLLV22_3.jpg', '', 4),
(N'GLLV22_4.jpg', '', 4),
(N'GLLV22_5.jpg', '', 4),
(N'GLV08_1.jpg', '', 5),
(N'GLV08_2.jpg', '', 5),
(N'GLV08_3.jpg', '', 5),
(N'GLV08_4.jpg', '', 5),
(N'GLV08_5.jpg', '', 5);

select * from mainapp_shoe;

--   *************** GIAY the thao ***********************

insert into mainapp_shoe(shoeName, shoeThumbnail, active, dateCreated, quantitySold, viewCount, favouriteCount, shoeDesc, category_id, brand_id) values 
(N'Giày thể thao B771', N'B771_1.jpg', 1, '2020-02-02', 270, 1400, 1970, N'Giày êm chạy không đau chân', 3, 1),
(N'Giày thể thao B798', N'B798_1.jpg', 1, '2019-08-19', 790, 2100, 2300, N'Giày êm chạy không đau chân', 3, 1),
(N'Giày thể thao B967', N'B967_1.jpg', 1, '2019-12-12', 400, 1600, 2200, N'Giày êm chạy không đau chân', 3, 1);

select * from mainapp_shoe;


insert into mainapp_image(imageName, imageDesc ,shoe_id) values
(N'B771_1.jpg', '', 6),
(N'B771_2.jpg', '', 6),
(N'B771_3.jpg', '', 6),
(N'B771_4.jpg', '', 6),
(N'B771_5.jpg', '', 6),
(N'B798_1.jpg', '', 7),
(N'B798_2.jpg', '', 7),
(N'B798_3.jpg', '', 7),
(N'B798_4.jpg', '', 7),
(N'B798_5.jpg', '', 7),
(N'B967_1.jpg', '', 8),
(N'B967_2.jpg', '', 8),
(N'B967_3.jpg', '', 8),
(N'B967_4.jpg', '', 8),
(N'B967_5.jpg', '', 8);

-- ***************** BATA ********************
insert into mainapp_shoe(shoeName, shoeThumbnail, active, dateCreated, quantitySold, viewCount, favouriteCount, shoeDesc, category_id, brand_id) values 
(N'Giày bata B536', N'B536_1.jpg', 1, '2019-12-29', 420, 1800, 2700, N'Giày êm chạy không đau chân', 6, 1);

select * from mainapp_shoe;

insert into mainapp_image(imageName,imageDesc, shoe_id) values
(N'B536_1.jpg', N'', 9),
(N'B536_2.jpg', N'', 9),
(N'B536_3.jpg', N'', 9),
(N'B536_4.jpg', N'', 9),
(N'B536_5.jpg', N'', 9);

-- giay luoi
insert into mainapp_detailshoe(size, quantityAvailable, oldPrice, newPrice, detailShoeDesc, color_id, shoe_id) values
(41, 20, 560000, 480000, N'', 1, 1),
(42, 10, 560000, 480000, N'',  1, 1),
(43, 15, 560000, 480000, N'',  1, 1),
(44, 1, 560000, 480000, N'',  1, 1),

(41, 20, 520000, 440000, N'',  1, 2),
(42, 30, 520000, 440000, N'',  1, 2),
(43, 10, 520000, 440000, N'',  1, 2),
(44, 8, 520000, 440000, N'',  1, 2),

(41, 10, 600000, 520000, N'',  1, 3),
(42, 12, 600000, 520000, N'',  1, 3),
(43, 18, 600000, 520000, N'',  1, 3),
(44, 9, 600000, 520000, N'',  1, 3),

(41, 11, 480000, 400000, N'',  1, 4),
(42, 22, 480000, 400000, N'',  1, 4),
(43, 38, 480000, 400000, N'',  1, 4),
(44, 9, 480000, 400000, N'',  1, 4),

(41, 20, 650000, 580000, N'',  1, 5),
(42, 30, 650000, 580000, N'',  1, 5),
(43, 10, 650000, 580000, N'',  1, 5),
(44, 8, 650000, 580000, N'',  1, 5);

select * from mainapp_detailshoe;

insert into mainapp_detailshoe(size, quantityAvailable, oldPrice, newPrice, detailShoeDesc, color_id, shoe_id) values
-- giay the thao
(41, 20, 660000, 580000, N'', 1, 6),
(42, 30, 660000, 580000, N'', 1, 6),
(43, 10, 660000, 580000, N'', 1, 6),
(44, 28, 660000, 580000, N'', 1, 6),
(41, 20, 660000, 580000, N'', 2, 6),
(42, 30, 660000, 580000, N'', 2, 6),
(43, 10, 660000, 580000, N'', 2, 6),
(44, 8, 660000, 580000, N'', 2, 6),

(41, 20, 620000, 530000, N'', 1, 7),
(42, 30, 620000, 520000, N'', 1, 7),
(43, 10, 620000, 520000, N'', 1, 7),
(44, 8, 620000, 520000, N'', 1, 7),
(41, 20, 620000, 520000, N'', 2, 7),
(42, 30, 620000, 520000, N'', 2, 7),
(43, 10, 620000, 520000, N'', 2, 7),
(44, 8, 620000, 520000, N'', 2, 7),

(41, 20, 700000, 580000, N'', 1, 8),
(42, 30, 700000, 580000, N'', 1, 8),
(43, 10, 700000, 580000, N'', 1, 8),
(44, 8, 700000, 580000, N'', 1, 8),
(41, 20, 700000, 580000, N'', 2, 8),
(42, 30, 700000, 580000, N'', 2, 8),
(43, 10, 700000, 580000, N'', 2, 8),
(44, 8, 700000, 580000, N'', 2, 8),

-- giay bata
(39, 20, 330000, 260000, N'', 2, 9),
(40, 30, 330000, 260000, N'', 2, 9),
(41, 10, 330000, 260000, N'', 2, 9),
(42, 28, 330000, 260000, N'', 2, 9),
(43, 38, 330000, 260000, N'', 2, 9),
(44, 8, 330000, 260000, N'' , 2, 9);
