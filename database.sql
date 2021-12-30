
DROP DATABASE IF EXISTS FRESHSHOPDB ;
CREATE DATABASE IF NOT EXISTS FRESHSHOP;
USE FRESHSHOP;

CREATE TABLE PRODUCTS (
    PRODUCT_ID CHAR(5) NOT NULL,
    IMAGE VARCHAR(100),
    PRODUCT_NAME VARCHAR(100),
    PRODUCT_TYPE VARCHAR(50),
    STONK ENUM('IN STOCK', 'OUT STOCK'), 
    QUANTITY INT(10),
    SOLD INT(10),
    PRICE FLOAT(10),
    IMPORTDATE DATE,
    IMPORTER CHAR(5),
    DETAIL VARCHAR(200),
    ISDELETED BOOL,
    PRIMARY KEY (PRODUCT_ID)
)  ENGINE=INNODB;

create table  CLIENTS 
(
	CLIENT_ID VARCHAR(50) NOT NULL, 
	FIRSTNAME VARCHAR(50), 
    LASTNAME VARCHAR(50), 
	GENDER  ENUM('Female', 'Male'), 
    DOB DATE, 
    PHONE VARCHAR(20),
    IMAGE VARCHAR(100),
    EMAIL VARCHAR(50), 
	PASS VARCHAR(1000),  
    ISDELETED BOOL,
	PRIMARY KEY (CLIENT_ID)
)ENGINE = INNODB;

create table ADMINS
(
	ADMIN_ID CHAR(5) NOT NULL, 
	FIRSTNAME VARCHAR(50), 
    LASTNAME VARCHAR(50), 
    GENDER  ENUM('Female', 'Male'), 
    DOB DATE, 
    EMAIL VARCHAR(50), 
    IMAGE VARCHAR(100),
    USERNAME VARCHAR(50), 
	PASS VARCHAR(50),  
    ISDELETED BOOL,
	PRIMARY KEY (ADMIN_ID)
)ENGINE = INNODB;
    
create table CARTS 
(
	CLIENT_ID CHAR(5) NOT NULL, 
	PRODUCT_ID CHAR(5) NOT NULL, 
	QUANTITY INT(10),  
    ISDELETED BOOL,
	PRIMARY KEY (CLIENT_ID, PRODUCT_ID)
)ENGINE = INNODB;

create table WISHLISTS
(
	CLIENT_ID CHAR(5) NOT NULL, 
	PRODUCT_ID CHAR(5) NOT NULL, 
    ISDELETED BOOL,
	PRIMARY KEY (CLIENT_ID, PRODUCT_ID)
)ENGINE = INNODB;

create table ORDERS 
(
	ORDER_ID CHAR(5) NOT NULL, 
    ORDER_DATE TIMESTAMP,
    ADDRESS VARCHAR(100),
    MANAGER CHAR(5),
    CLIENT_ID CHAR(5),
    ISDELETED BOOL,
	PRIMARY KEY (ORDER_ID)
)ENGINE = INNODB;

create table ORDERS_DETAIL
(
	ORDER_ID CHAR(5) NOT NULL, 
	PRODUCT_ID CHAR(5) NOT NULL, 
    QUANTITY INT(10), 
    PRICE FLOAT(10), 
    ISDELETED BOOL,
	PRIMARY KEY (ORDER_ID, PRODUCT_ID)
)ENGINE = INNODB;

create table DELIVERIES 
(
	DELIVERY_ID CHAR(5) NOT NULL,
    ORDER_ID CHAR(5),
    CLIENT_ID CHAR(5), 
    DELIVERY_DAY DATE,
    DELIVERY_STATUS ENUM("FAILED","SUCCEED"),
    MANAGER CHAR(5),
    ISDELETED BOOL,
	PRIMARY KEY (DELIVERY_ID)
)ENGINE = INNODB;

create table BILLS
(
	ORDER_ID CHAR(5) NOT NULL, 
    DELIVERY_ID CHAR(5) NOT NULL,
    PAYMENT VARCHAR(50),
    DISCOUNT FLOAT(10),
    COUPON FLOAT(10),
    TAX FLOAT(10),
    SHIPPING_COST FLOAT(10),
    ISDELETED BOOL,
	PRIMARY KEY (ORDER_ID, DELIVERY_ID)
)ENGINE = INNODB;

create table ORDERS_RETURN 
(
	ORDER_ID CHAR(5) NOT NULL, 
    CLIENT_ID CHAR(5) NOT NULL, 
    REASON VARCHAR(100),
    ISDELETED BOOL,
	PRIMARY KEY (ORDER_ID, CLIENT_ID)
)ENGINE = INNODB;

ALTER TABLE PRODUCTS ADD CONSTRAINT fk_p_ad FOREIGN KEY(IMPORTER) REFERENCES ADMINS(ADMIN_ID);

ALTER TABLE CARTS ADD CONSTRAINT fk_c_cl FOREIGN KEY(CLIENT_ID) REFERENCES CLIENTS(CLIENT_ID);
ALTER TABLE CARTS ADD CONSTRAINT fk_c_pd FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID);

ALTER TABLE WISHLISTS ADD CONSTRAINT fk_w_cl FOREIGN KEY(CLIENT_ID) REFERENCES CLIENTS(CLIENT_ID);
ALTER TABLE WISHLISTS ADD CONSTRAINT fk_w_pd FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID);

ALTER TABLE ORDERS ADD CONSTRAINT fk_o_cl FOREIGN KEY(CLIENT_ID) REFERENCES CLIENTS(CLIENT_ID);
ALTER TABLE ORDERS ADD CONSTRAINT fk_o_a FOREIGN KEY(MANAGER) REFERENCES ADMINS(ADMIN_ID);

ALTER TABLE ORDERS_DETAIL ADD CONSTRAINT fk_od_o FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID);
ALTER TABLE ORDERS_DETAIL ADD CONSTRAINT fk_od_p FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID);

ALTER TABLE DELIVERIES ADD CONSTRAINT fk_d_o FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID);
ALTER TABLE DELIVERIES ADD CONSTRAINT fk_d_cl FOREIGN KEY(CLIENT_ID) REFERENCES CLIENTS(CLIENT_ID);
ALTER TABLE DELIVERIES ADD CONSTRAINT fk_d_a FOREIGN KEY(MANAGER) REFERENCES ADMINS(ADMIN_ID);

ALTER TABLE ORDERS_RETURN ADD CONSTRAINT fk_or_o FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID);
ALTER TABLE ORDERS_RETURN ADD CONSTRAINT fk_or_cl FOREIGN KEY(CLIENT_ID) REFERENCES CLIENTS(CLIENT_ID);

ALTER TABLE BILLS ADD CONSTRAINT fk_b_o FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID);
ALTER TABLE BILLS ADD CONSTRAINT fk_b_d FOREIGN KEY(DELIVERY_ID) REFERENCES DELIVERIES(DELIVERY_ID);

INSERT INTO ADMINS VALUES ("A0001","Maria","Iris","FEMALE","1994/1/1","mariairis@gmail.com","/assets/images/accounts/face1.jpg","user01","pass123",false);
INSERT INTO ADMINS VALUES ("A0002","Colin","Delano","MALE","1992/10/22","colindelano@gmail.com","/assets/images/accounts/face2.jpg","user02","pass123",false);
INSERT INTO ADMINS VALUES ("A0003","Bryce","Graham","MALE","1988/3/14","brycegraham@gmail.com","/assets/images/accounts/face3.jpg","user03","pass123",false);
INSERT INTO ADMINS VALUES ("A0004","Amie","Charla","FEMALE","1991/9/8","amiecharla@gmail.com","/assets/images/accounts/face4.jpg","user04","pass123",false);

INSERT INTO CLIENTS VALUES ("C0001","Diana","Granet","Female","2000/12/12","0909354345","/assets/images/clients/client01.jpg","dianagranet@gmail.com","$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri",false);
INSERT INTO CLIENTS VALUES ("C0002","Nicole","Quinn","Female","1995/1/6","0898161616","/assets/images/clients/client02.jpg","nicolequinn@gmail.com","$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri",false);
INSERT INTO CLIENTS VALUES ("C0003","Davis","Lambert","Male","1990/4/24","0797645456","/assets/images/clients/client03.jpg","davislambert@gmail.com","$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri",false);
INSERT INTO CLIENTS VALUES ("C0004","Cecelia","Brandy","Female","1989/1/18","0808483834","/assets/images/clients/client04.jpg","ceceliabrandy@gmail.com","$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri",false);


#----------------------------------PRODUCT
INSERT INTO PRODUCTS VALUES ("P0001","/assets/images/products/PD-01.jpg","CARROT","Root and tuberous","IN STOCK",50,50,40,"2021-11-5","A0001",
"carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot",false);
INSERT INTO PRODUCTS VALUES ("P0002","/assets/images/products/PD-02.jpg","POTATO","Root and tuberous","IN STOCK",28,62,70,"2021-11-10","A0001",
"potato potato potato potato potato potato potato potato potato potato potato potato potato potato potato",false);
INSERT INTO PRODUCTS VALUES ("P0003","/assets/images/products/PD-03.jpg","APPLE","Fruits","OUT STOCK",0,90,100,"2021-3-31","A0001",
"apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple",false);
INSERT INTO PRODUCTS VALUES ("P0004","/assets/images/products/PD-04.jpg","TOMATO","Fruits","IN STOCK",33,67,30,"2021-10-28","A0003",
"tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato",false);
INSERT INTO PRODUCTS VALUES ("P0005","/assets/images/products/PD-05.jpg","GREEN ONION 200g","Bulbs","IN STOCK",50,45,40,"2021-11-5","A0003",
"green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion", false);
INSERT INTO PRODUCTS VALUES ("P0006","/assets/images/products/PD-06.jpg","GREEN ONION 500g","Bulbs","IN STOCK",25,45,75,"2021-11-5","A0003",
"green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion",false);
INSERT INTO PRODUCTS VALUES ("P0007","/assets/images/products/PD-07.jpg","CAULIFLOWER","Vegetables","IN STOCK",20,80,35,"2021-10-28","A0002",
"cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower",false);
INSERT INTO PRODUCTS VALUES ("P0008","/assets/images/products/PD-08.jpg","EGGPLANT","Vegetables","IN STOCK",50,50,25,"2021-11-5","A0001",
"eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant",false);
INSERT INTO PRODUCTS VALUES ("P0009","/assets/images/products/PD-09.jpg","PUMPKIN","Vegetables","IN STOCK",38,62,35,"2021-11-10","A0001",
"pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin",false);


INSERT INTO PRODUCTS VALUES ("P0010","/assets/images/products/PD-10.jpg","PEAS 200g","Podded vegetables","IN STOCK",100,0,20,"2021-11-10","A0001",
"peas peas peas peas peas peas peas peas peas peas peas peas peas peas peas",false);
INSERT INTO PRODUCTS VALUES ("P0011","/assets/images/products/PD-11.jpg","PEAS 500g","Podded vegetables","IN STOCK",70,30,40,"2021-11-10","A0001",
"peas peas peas peas peas peas peas peas peas peas peas peas peas peas peas",false);
INSERT INTO PRODUCTS VALUES ("P0012","/assets/images/products/PD-12.jpg","LEMON 350g","Fruits","IN STOCK",77,23,25,"2021-10-28","A0003",
"lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon",false);
INSERT INTO PRODUCTS VALUES ("P0013","/assets/images/products/PD-13.jpg","GARLIC 150g","Bulbs","IN STOCK",122,38,10,"2021-11-10","A0003",
"garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic",false);
INSERT INTO PRODUCTS VALUES ("P0014","/assets/images/products/PD-14.jpg","SHALLOT 150g","Bulbs","IN STOCK",110,40,15,"2021-11-10","A0003",
"shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot",false);
INSERT INTO PRODUCTS VALUES ("P0015","/assets/images/products/PD-15.jpg","GREEN BEANS 200g","Podded vegetables","OUT STOCK",0,99,30,"2021-3-31","A0001",
"green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans",false);
INSERT INTO PRODUCTS VALUES ("P0016","/assets/images/products/PD-16.jpg","BLACK BEANS 200g","Podded vegetables","IN STOCK",38,62,30,"2021-10-28","A0002",
"black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans",false);
INSERT INTO PRODUCTS VALUES ("P0017","/assets/images/products/PD-17.jpg","BANANA","Fruits","IN STOCK",60,50,40,"2021-3-31","A0001",
"banana banana banana banana banana banana banana banana banana banana banana banana banana banana banana",false);
INSERT INTO PRODUCTS VALUES ("P0018","/assets/images/products/PD-18.jpg","GREEN BEANS 500g","Podded vegetables","IN STOCK",9,91,70,"2021-3-31","A0001",
"green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans",false);


INSERT INTO PRODUCTS VALUES ("P0019","/assets/images/products/PD-19.jpg","BLACK BEANS 500g","Podded vegetables","IN STOCK",16,84,70,"2021-10-28","A0002",
"black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans",false);
INSERT INTO PRODUCTS VALUES ("P0020","/assets/images/products/PD-20.jpg","PINEAPPLE","Fruits","IN STOCK",15,75,38,"2021-11-10","A0002",
"pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple",false);
INSERT INTO PRODUCTS VALUES ("P0021","/assets/images/products/PD-21.jpg","SOYBEAN 200g","Podded vegetables","IN STOCK",65,25,19,"2021-3-31","A0001",
"soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean",false);
INSERT INTO PRODUCTS VALUES ("P0022","/assets/images/products/PD-22.jpg","SOYBEAN 500g","Podded vegetables","IN STOCK",40,50,40,"2021-3-31","A0001",
"soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean",false);
INSERT INTO PRODUCTS VALUES ("P0023","/assets/images/products/PD-23.jpg","PEAR","Fruits","IN STOCK",33,77,30,"2021-10-28","A0002",
"pear pear pear pear pear pear pear pear pear pear pear pear pear pear pear",false);
INSERT INTO PRODUCTS VALUES ("P0024","/assets/images/products/PD-24.jpg","LIME 200g","Fruits","OUT STOCK",0,110,25,"2021-10-28","A0002",
"lime lime lime lime lime lime lime lime lime lime lime lime lime lime lime",false);
INSERT INTO PRODUCTS VALUES ("P0025","/assets/images/products/PD-25.jpg","CABBAGE","Vegetables","IN STOCK",8,92,45,"2021-11-10","A0001",
"cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage",false);
INSERT INTO PRODUCTS VALUES ("P0026","/assets/images/products/PD-26.jpg","MUSHROOM 200g","Vegetables","IN STOCK",20,80,50,"2021-11-10","A0001",
"mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom",false);
INSERT INTO PRODUCTS VALUES ("P0027","/assets/images/products/PD-27.jpg","MUSHROOM 500g","Vegetables","IN STOCK",30,70,110,"2021-11-10","A0001",
"mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom",false);


INSERT INTO PRODUCTS VALUES ("P0028","/assets/images/products/PD-28.jpg","CORN","Vegetables","IN STOCK",56,44,10,"2021-3-31","A0003",
"corn corn corn corn corn corn corn corn corn corn corn corn corn corn corn",false);
INSERT INTO PRODUCTS VALUES ("P0029","/assets/images/products/PD-29.jpg","CELERY 200g","Vegetables","IN STOCK",13,107,30,"2021-10-28","A0003",
"celery celery celery celery celery celery celery celery celery celery celery celery celery celery celery",false);
INSERT INTO PRODUCTS VALUES ("P0030","/assets/images/products/PD-30.jpg","STRAWBERRY 200g","Fruits","IN STOCK",17,83,60,"2021-11-10","A0003",
"strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry",false);
INSERT INTO PRODUCTS VALUES ("P0031","/assets/images/products/PD-31.jpg","CHERRY 200g","Fruits","IN STOCK",28,72,55,"2021-11-10","A0003",
"cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry",false);
INSERT INTO PRODUCTS VALUES ("P0032","/assets/images/products/PD-32.jpg","STRAWBERRY 500g","Fruits","IN STOCK",20,60,120,"2021-11-10","A0003",
"strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry",false);
INSERT INTO PRODUCTS VALUES ("P0033","/assets/images/products/PD-33.jpg","CHERRY 500g","Fruits","IN STOCK",3,107,120,"2021-11-10","A0003",
"cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry",false);
INSERT INTO PRODUCTS VALUES ("P0034","/assets/images/products/PD-34.jpg","BEET","Root and tuberous","IN STOCK",50,40,40,"2021-11-5","A0001",
"beet beet beet beet beet beet beet beet beet beet beet beet beet beet beet",false);
INSERT INTO PRODUCTS VALUES ("P0035","/assets/images/products/PD-35.jpg","SWEET POTATO","Root and tuberous","IN STOCK",50,50,35,"2021-11-10","A0001",
"sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato",false);
INSERT INTO PRODUCTS VALUES ("P0036","/assets/images/products/PD-36.jpg","GREEN GRAPES","Fruits","IN STOCK",19,91,35,"2021-3-31","A0002",
"green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes",false);


INSERT INTO PRODUCTS VALUES ("P0037","/assets/images/products/PD-37.jpg","CHICKPEA 200g","Podded vegetables","IN STOCK",43,57,30,"2021-10-28","A0002",
"chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea",false);
INSERT INTO PRODUCTS VALUES ("P0038","/assets/images/products/PD-38.jpg","RED ONION 200g","Bulbs","OUT STOCK",6,94,55,"2021-11-10","A0001",
"red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion",false);
INSERT INTO PRODUCTS VALUES ("P0039","/assets/images/products/PD-39.jpg","TARO","Root and tuberous","IN STOCK",12,88,20,"2021-11-10","A0004",
"taro taro taro taro taro taro taro taro taro taro taro taro taro taro taro",false);
INSERT INTO PRODUCTS VALUES ("P0040","/assets/images/products/PD-40.jpg","APRICOT","Fruits","IN STOCK",22,78,40,"2021-11-10","A0004",
"apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot",false);
INSERT INTO PRODUCTS VALUES ("P0041","/assets/images/products/PD-41.jpg","TURNIPS","Root and tuberous","OUT STOCK",0,101,30,"2021-3-31","A0004",
"carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot",false);
INSERT INTO PRODUCTS VALUES ("P0042","/assets/images/products/PD-42.jpg","PAPAYA","Fruits","IN STOCK",33,67,30,"2021-10-28","A0002",
"papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya",false);
INSERT INTO PRODUCTS VALUES ("P0043","/assets/images/products/PD-43.jpg","CUCUMBER","Vegetables","IN STOCK",50,50,25,"2021-11-5","A0001",
"cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber",false);
INSERT INTO PRODUCTS VALUES ("P0044","/assets/images/products/PD-44.jpg","BELL PEPPER 350g","Vegetables","IN STOCK",28,72,25,"2021-11-10","A0001",
"bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper",false);
INSERT INTO PRODUCTS VALUES ("P0045","/assets/images/products/PD-45.jpg","MANGO","Fruits","IN STOCK",50,60,50,"2021-11-5","A0001",
"mango mango mango mango mango mango mango mango mango mango mango mango mango mango mango",false);


INSERT INTO PRODUCTS VALUES ("P0046","/assets/images/products/PD-46.jpg","BLUEBERRY 200g","Fruits","IN STOCK",28,62,50,"2021-11-10","A0004",
"blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry",false);
INSERT INTO PRODUCTS VALUES ("P0047","/assets/images/products/PD-47.jpg","BLACKBERRY 200g","Fruits","IN STOCK",18,62,60,"2021-11-10","A0003",
"blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry",false);
INSERT INTO PRODUCTS VALUES ("P0048","/assets/images/products/PD-48.jpg","BLUEBERRY 500g","Fruits","IN STOCK",10,80,110,"2021-11-10","A0004",
"blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry",false);
INSERT INTO PRODUCTS VALUES ("P0049","/assets/images/products/PD-49.jpg","BLACKBERRY 500g","Fruits","IN STOCK",7,103,125,"2021-11-10","A0003",
"blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry",false);
INSERT INTO PRODUCTS VALUES ("P0050","/assets/images/products/PD-50.jpg","PEACH","Fruits","IN STOCK",50,55,45,"2021-11-5","A0004",
"peach peach peach peach peach peach peach peach peach peach peach peach peach peach peach",false);
INSERT INTO PRODUCTS VALUES ("P0051","/assets/images/products/PD-51.jpg","ORANGE","Fruits","IN STOCK",28,72,30,"2021-11-10","A0001",
"orange orange orange orange orange orange orange orange orange orange orange orange orange orange orange",false);
INSERT INTO PRODUCTS VALUES ("P0052","/assets/images/products/PD-52.jpg","HOT PEPPER 100g","Vegetables","IN STOCK",69,21,9,"2021-3-31","A0004",
"hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper",false);
INSERT INTO PRODUCTS VALUES ("P0053","/assets/images/products/PD-53.jpg","BROCCOLI","Vegetables","IN STOCK",5,100,40,"2021-3-31","A0004",
"broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli",false);
INSERT INTO PRODUCTS VALUES ("P0054","/assets/images/products/PD-54.jpg","WATERMELON","Fruits","IN STOCK",12,88,50,"2021-11-5","A0001",
"watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon",false);

#----------------------------------PRODUCT

INSERT INTO CARTS VALUES ("C0001","P0001",2,false);
INSERT INTO CARTS VALUES ("C0001","P0002",5,false);
INSERT INTO CARTS VALUES ("C0003","P0001",5,false);
INSERT INTO CARTS VALUES ("C0004","P0005",10,false);

INSERT INTO WISHLISTS VALUES ("C0001","P0001",false);
INSERT INTO WISHLISTS VALUES ("C0004","P0003",false);
INSERT INTO WISHLISTS VALUES ("C0002","P0003",false);
INSERT INTO WISHLISTS VALUES ("C0003","P0005",false);

INSERT INTO ORDERS VALUES ("O0001","2021-11-10 18:34:09","23-5 Nguyen Van Cu, Phuong 1, Quan 5, Ho Chi Minh", "A0004", "C0003",false);
INSERT INTO ORDERS VALUES ("O0002","2021-11-10 19:02:31","62 Cong Hoa, Phuong 4, Quan Tan Binh, Ho Chi Minh", "A0002", "C0001",false);
INSERT INTO ORDERS VALUES ("O0003","2021-11-11 07:10:54","23-5 Nguyen Van Cu, Phuong 1, Quan 5, Ho Chi Minh", "A0004", "C0002",false);
INSERT INTO ORDERS VALUES ("O0004","2021-11-13 10:27:52","120 Hoang Hoa Tham, Phuong 2, Quan 4, Ho Chi Minh", "A0002", "C0004",false);
INSERT INTO ORDERS VALUES ("O0005","2021-11-14 14:18:02","62 Cong Hoa, Phuong 4, Quan Tan Binh, Ho Chi Minh", "A0001", "C0001",false);
INSERT INTO ORDERS VALUES ("O0006","2021-11-14 16:44:27","23-5 Nguyen Van Cu, Phuong 1, Quan 5, Ho Chi Minh", "A0003", "C0003",false);

INSERT INTO ORDERS_DETAIL VALUES ("O0001","P0001",5,40,false);
INSERT INTO ORDERS_DETAIL VALUES ("O0001","P0002",2,70,false); 
INSERT INTO ORDERS_DETAIL VALUES ("O0002","P0005",7,30,false);
INSERT INTO ORDERS_DETAIL VALUES ("O0003","P0002",4,70,false);
INSERT INTO ORDERS_DETAIL VALUES ("O0004","P0001",5,40,false);
INSERT INTO ORDERS_DETAIL VALUES ("O0004","P0002",2,70,false); 
INSERT INTO ORDERS_DETAIL VALUES ("O0004","P0005",7,30,false);
INSERT INTO ORDERS_DETAIL VALUES ("O0005","P0001",10,40,false);
INSERT INTO ORDERS_DETAIL VALUES ("O0006","P0002",4,70,false);

INSERT INTO DELIVERIES VALUES ("D0001","O0002","C0001","2021-11-11","FAILED","A0001",false);
INSERT INTO DELIVERIES VALUES ("D0002","O0002","C0001","2021-11-12","SUCCEED","A0001",false);
INSERT INTO DELIVERIES VALUES ("D0003","O0001","C0003","2021-11-12","SUCCEED","A0003",false);
INSERT INTO DELIVERIES VALUES ("D0004","O0003","C0002","2021-11-13","SUCCEED","A0004",false);
INSERT INTO DELIVERIES VALUES ("D0005","O0004","C0004","2021-11-14","FAILED","A0001",false);

INSERT INTO ORDERS_RETURN VALUES ("O0004","C0004","damaged goods",false);
INSERT INTO ORDERS_RETURN VALUES ("O0005","C0001","order is canceled",false);
INSERT INTO ORDERS_RETURN VALUES ("O0006","C0003","order is canceled",false);

INSERT INTO BILLS VALUES ("O0002","D0001","cash on delivery", 40, 10, 2, 0,false);
INSERT INTO BILLS VALUES ("O0002","D0002","cash on delivery", 10, 10, 2, 0,false);
INSERT INTO BILLS VALUES ("O0001","D0003","credit card", 10, 10, 4, 5,false);
INSERT INTO BILLS VALUES ("O0003","D0004","credit card", 20, 15, 2, 5,false);
INSERT INTO BILLS VALUES ("O0004","D0005","cash on delivery", 30, 0, 4, 0,false);