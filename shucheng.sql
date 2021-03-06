create database books;
go
use books;  --打开数据库
go
create table T_admin --管理员表
( id int identity(1,1) primary key,
  admin varchar(25) not null,
  pwd varchar(12) not null,
  limit bit default(0)--0:普通管理员 1:超级管理员
);
create table T_user --用户基本表
( id int identity(1,1) primary key,
  uname varchar(25),
  pwd varchar(12),
  utype bit default(0),--0:普通用户 1:会员
);

create table T_userInfo --用户信息表
( id int identity(1,1) primary key,
  mail varchar(20),
  phone varchar(11),
  sex bit default(0),--0:男 1:女
  birthday datetime,
  balance float not null,
  uname int,
  constraint T_userInfo_uname_fk foreign key(uname) references T_user(id)
);
create table T_mybook --书架表
(
  id int identity(1,1) primary key,
  title varchar(25) not null,
  cover text not null,
  person int,
  constraint T_mybook_person_fk foreign key(person) references T_user(id)
);
create table T_recharge --充值记录表
( id int identity(1,1) primary key,
  recharge float not null,
  paytime datetime not null,
  person int,
  constraint T_recharge_person_fk foreign key(person) references T_user(id),
);
create table T_category --书籍类型表
( id int identity(1,1) primary key,
  category varchar(25)--文学、小说、工具书
);
create table T_bookInfo --书籍信息表
( id int identity(1,1) primary key,
  title varchar(25),
  cover text,
  author varchar(25),
  price float,
  brief text,
  book text,
  isrecommend bit default(0),--0:不推荐 1：推荐
  onlinetime datetime,
  member bit default(0),--会员免费 0：不免费 1：免费
  ctr int,--点击率
  category int,
  constraint T_bookInfo_category_fk foreign key(category) references T_category(id) 
);
create table T_section --章节表
( id int identity(1,1) primary key,
  s_name varchar(100),--章节名称
  the_book int,--所属书籍编号
  constraint T_section_the_book_fk foreign key(the_book) references T_bookInfo(id),
  s_text text
);

--初始化数据库
--管理员表初始化
insert into T_admin(admin,pwd,limit)
values('sansan','123456',0);
insert into T_admin(admin,pwd,limit)
values('lili','123456',1);
insert into T_admin(admin,pwd,limit)
values('jock','123456',0);

--用户基本表初始化
insert into T_user(uname,pwd,utype)
values('linmiao','123456',0);
insert into T_user(uname,pwd,utype)
values('lisa','123456',0);
insert into T_user(uname,pwd,utype)
values('cqc','123456',0);

--用户信息表初始化
insert into T_userInfo(mail,phone,sex,birthday,balance,uname)
values('237070612@qq.com','17774005385',1,'1996-03-02',50.00,1);

--书架表初始化
insert into T_mybook(title,cover,person)
values('无证之罪','img/book1.jpg',1);

--充值记录表初始化
insert into T_recharge(recharge,paytime,person)
values(50.00,'2017',1);

--书籍类型表初始化
insert into T_category values('文学');
insert into T_category values('小说');
insert into T_category values('工具书');

--书籍信息表初始化
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('无证之罪','img/book1.jpg','紫金陈',3.99,'人们往往愿意相信事实和数据，但无意间却会被故事吸引，并沉浸其中。这是为什么呢？因为“我们无法通过智力去影响别人，情感却能做到这一点”（亚里士多德）。经过情感故事包装过的事实，会以洪流般的势头迅速打开人们的心门，进而极大程度地影响人们的心理走势。','text',1,'2010-09-11',0,1000,2);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('有种后宫叫德妃','img/book5.jpg','阿琐',5.99,' 宫斗文坛一直在翘首期盼的高格局划时代之作——高智商高情商宫斗：有种后宫叫德妃传奇：出身包衣，却统领后宫，泽被三朝她出生满族包衣，却逆袭成为千古一帝康熙最宠爱的妃子；她是九龙夺嫡胜者雍正之母，她堪比孝庄慈禧，传奇一生泽被康乾盛世；她以无上大智慧高情商，征服帝王，领袖后宫，缔造史上独一无二的“德妃后宫”。','text/',1,'2017-09-22',0,900,3);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('何所冬暖，何所夏凉','img/book4.jpg','顾西爵',2.99,'  每个人的生命中总会遇到那么一个人，一同经历风雨，然后看见彩虹，天长地久。简安桀一度以为，席郗辰是上天给她安排的不对盘，他对她的纠缠不休，仿佛此生走不出的阴影。','text/',1,'2017-02-11',0,122,1);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('窥破天道','img/book2.jpg','和光同尘真人',1.99,' 在中国股市中大部份股民的眼中，庄家是神秘、鬼神莫测且又强大凶悍的。在波谲云诡的股市里，万丈深渊，不知道隐藏着多少资本大鳄。每逢机会降临，这些平时深藏其中的大鳄们必会兴风作浪，使股民追涨杀跌，深度套牢，乃至割肉，演绎出一幕幕人间悲剧。','text/',1,'2017-06-11',0,234,2);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('这么远那么近','img/book6.jpg','晴空蓝兮',4.99,' 晴空蓝兮经典重现典藏只属于你的美好。你走过许多地方的路，行过许多地方的桥，那么，有没有爱过一个正当最好年龄的人？','text/',1,'2012-09-11',0,567,1);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('后宫2','img/book5.jpg','阿琐',5.99,' 宫斗文坛一直在翘首期盼的高格局划时代之作——高智商高情商宫斗：有种后宫叫德妃传奇：出身包衣，却统领后宫，泽被三朝她出生满族包衣，却逆袭成为千古一帝康熙最宠爱的妃子；她是九龙夺嫡胜者雍正之母，她堪比孝庄慈禧，传奇一生泽被康乾盛世；她以无上大智慧高情商，征服帝王，领袖后宫，缔造史上独一无二的“德妃后宫”。','text/',1,'2017-09-11',0,1011,3);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('后宫3','img/book4.jpg','顾西爵',2.99,'  每个人的生命中总会遇到那么一个人，一同经历风雨，然后看见彩虹，天长地久。简安桀一度以为，席郗辰是上天给她安排的不对盘，他对她的纠缠不休，仿佛此生走不出的阴影。','text/',1,'2017-04-11',0,2333,1);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('谁动了我的奶酪','img/book2.jpg','和光同尘真人',1.99,' 在中国股市中大部份股民的眼中，庄家是神秘、鬼神莫测且又强大凶悍的。在波谲云诡的股市里，万丈深渊，不知道隐藏着多少资本大鳄。每逢机会降临，这些平时深藏其中的大鳄们必会兴风作浪，使股民追涨杀跌，深度套牢，乃至割肉，演绎出一幕幕人间悲剧。','text/',1,'2017-09-01',0,566,2);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('人类简史1','img/book6.jpg','晴空蓝兮',4.99,' 晴空蓝兮经典重现典藏只属于你的美好。你走过许多地方的路，行过许多地方的桥，那么，有没有爱过一个正当最好年龄的人？','text/',1,'2015-09-11',0,989,1);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('人类简史2','img/book7.jpg','晴空蓝兮',4.99,' 晴空蓝兮经典重现典藏只属于你的美好。你走过许多地方的路，行过许多地方的桥，那么，有没有爱过一个正当最好年龄的人？','text/',1,'2016-09-11',0,977,1);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('人类简史3','img/book2.jpg','晴空蓝兮',4.99,' 晴空蓝兮经典重现典藏只属于你的美好。你走过许多地方的路，行过许多地方的桥，那么，有没有爱过一个正当最好年龄的人？','text/',1,'2017-09-11',0,434,1);
insert into T_bookInfo(title,cover,author,price,brief,book,isrecommend,onlinetime,member,ctr,category)
values('人类简史4','img/book3.jpg','晴空蓝兮',4.99,' 晴空蓝兮经典重现典藏只属于你的美好。你走过许多地方的路，行过许多地方的桥，那么，有没有爱过一个正当最好年龄的人？','text/',1,'2011-05-11',0,212,1);


--章节表初始化
insert into T_section(s_name,the_book)
values('第一章化茧成蝶1',1);
insert into T_section(s_name,the_book)
values('第二章化茧成蝶2',1);
insert into T_section(s_name,the_book)
values('第三章化茧成蝶3',1);
insert into T_section(s_name,the_book)
values('第四章化茧成蝶4',1);
insert into T_section(s_name,the_book)
values('第五章化茧成蝶5',1);
insert into T_section(s_name,the_book)
values('第六章化茧成蝶6',1);
insert into T_section(s_name,the_book)
values('第七章化茧成蝶7',1);
insert into T_section(s_name,the_book)
values('第八章化茧成蝶8',1);
insert into T_section(s_name,the_book)
values('第九章化茧成蝶9',1);
insert into T_section(s_name,the_book)
values('第十章化茧成蝶10',1);
insert into T_section(s_name,the_book)
values('第十一章化茧成蝶11',1);
insert into T_section(s_name,the_book)
values('第十二章化茧成蝶12',1);
insert into T_section(s_name,the_book)
values('第十三章化茧成蝶13',1);
insert into T_section(s_name,the_book)
values('第十四章化茧成蝶14',1);
insert into T_section(s_name,the_book)
values('第十五章化茧成蝶15',1);
insert into T_section(s_name,the_book)
values('第十六章化茧成蝶16',1);
insert into T_section(s_name,the_book)
values('第十七章化茧成蝶17',1);
insert into T_section(s_name,the_book)
values('第十八章化茧成蝶18',1);
insert into T_section(s_name,the_book)
values('第十九章化茧成蝶19',1);
insert into T_section(s_name,the_book)
values('第二十章化茧成蝶20',1);
insert into T_section(s_name,the_book)
values('第一章你不是我的唯一1',2);
insert into T_section(s_name,the_book)
values('第二章你不是我的唯一2',2);
insert into T_section(s_name,the_book)
values('第三章你不是我的唯一3',2);
insert into T_section(s_name,the_book)
values('第四章你不是我的唯一4',2);
insert into T_section(s_name,the_book)
values('第五章你不是我的唯一5',2);
insert into T_section(s_name,the_book)
values('第六章你不是我的唯一6',2);
insert into T_section(s_name,the_book)
values('第七章你不是我的唯一7',2);
insert into T_section(s_name,the_book)
values('第八章你不是我的唯一8',2);
insert into T_section(s_name,the_book)
values('第九章你不是我的唯一9',2);
insert into T_section(s_name,the_book)
values('第十章你不是我的唯一10',2);
insert into T_section(s_name,the_book)
values('第十一章你不是我的唯一11',2);
insert into T_section(s_name,the_book)
values('第十二章你不是我的唯一12',2);
insert into T_section(s_name,the_book)
values('第十三章你不是我的唯一13',2);
insert into T_section(s_name,the_book)
values('第十四章你不是我的唯一14',2);
insert into T_section(s_name,the_book)
values('第十五章你不是我的唯一15',2);
insert into T_section(s_name,the_book)
values('第十六章你不是我的唯一16',2);
insert into T_section(s_name,the_book)
values('第十七章你不是我的唯一17',2);
insert into T_section(s_name,the_book)
values('第十八章你不是我的唯一18',2);
insert into T_section(s_name,the_book)
values('第十九章你不是我的唯一19',2);
insert into T_section(s_name,the_book)
values('第二十章你不是我的唯一20',2);




select*from T_admin;
select*from T_recharge;
select*from T_mybook;
select*from T_userInfo;
select*from T_user;
select*from T_category;
select*from T_bookInfo;
select*from T_section;


