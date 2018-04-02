DROP DATABASE IF EXISTS shopping;
CREATE DATABASE shopping DEFAULT CHARACTER SET utf8;
USE shopping;

##用户表
CREATE TABLE user (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  password varchar(255) NOT NULL default '',
  userType tinyint(4) NOT NULL default '1' COMMENT '1:普通用户 2:销售商 3:管理员',
  address varchar(255) DEFAULT NULL,
  receiver varchar(255) DEFAULT NULL,
  mobile varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  level int(11) NOT NULL default '1' COMMENT '1:vip1 2:vip2 3:vip3 4:vip4',
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO user VALUES (1,'admin','admin',3,null,null,null,null,6);
INSERT INTO user VALUES (2,'saler','saler',2,null,null,null,null,6);
INSERT INTO user VALUES (3,'bill','bill',1,null,null,null,null,1);
INSERT INTO user VALUES (4,'mike','mike',1,'招行','李四','18818216470','li@163.com',2);

##类别表
CREATE TABLE category (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
INSERT INTO category VALUES (68,'品牌女装');
INSERT INTO category VALUES (69,'时尚男鞋');
INSERT INTO category VALUES (71,'男士西服');
INSERT INTO category VALUES (72,'男士手拿包 ');
INSERT INTO category VALUES (73,'男表');
INSERT INTO category VALUES (74,'女表');
INSERT INTO category VALUES (75,'空调');
INSERT INTO category VALUES (76,'冰箱');
INSERT INTO category VALUES (77,'原汁机');
INSERT INTO category VALUES (78,'扫地机器人 ');
INSERT INTO category VALUES (79,'平衡车');
INSERT INTO category VALUES (80,'电热水器');
INSERT INTO category VALUES (81,'沙发');
INSERT INTO category VALUES (82,'马桶');
INSERT INTO category VALUES (83,'平板电视');

##商品表
CREATE TABLE product (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  detail varchar(255) DEFAULT NULL,
  price float DEFAULT NULL,
  stock int(11) DEFAULT NULL,
  cid int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_product_category FOREIGN KEY (cid) REFERENCES category (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
INSERT INTO product VALUES (87,'Konka/康佳 LED32S1卧室32吋安卓智能无线WIFI网络液晶平板电视机','32吋电视机 8核智能 网络 全国联保 送货上门',1699,98,83);
INSERT INTO product VALUES (88,'Hisense/海信 LED49EC320A 49吋led液晶电视机智能网络平板电视50','新品特惠 十核智能 内置WiFi 咨询有惊喜',2799,90,83);
INSERT INTO product VALUES (89,'Hisense/海信 LED40EC520UA 40英寸4K智能平板液晶电视机WIFI网络','周末 特惠 2189 元还送 精美礼品',2399,82,83);
INSERT INTO product VALUES (90,'Changhong/长虹 65S1安卓智能12核65英寸网络平板LED液晶电视机70','屏大影院 高配12核 安卓智能',4499.01,84,83);
INSERT INTO product VALUES (91,'夏普屏PANDA/熊猫 LE39D71S 39英寸智能WiFi液晶平板电视40 42 43','屏大影院 高配12核 安卓智能',2499,75,83);
INSERT INTO product VALUES (147,'乐洁士智能马桶高品质全自动遥控感应一体式智能坐便器座便器','全国联保 清洗烘干 气泡按摩 座圈加热 断电冲水',8960,48,82);
INSERT INTO product VALUES (148,'箭牌马桶/ARROW AB1118脲醛盖板连体喷射虹吸式坐便器座便器正品','领券更优惠 品质脲醛盖 千城送装 送安装配件',1976,65,82);
INSERT INTO product VALUES (149,'纳蒂兰卡1066卫浴漩冲虹吸式马桶350坑距坐便器可配智能盖座便器','盖板易拆 送全套配件 500区县 送货入户安装',1670,93,82);
INSERT INTO product VALUES (150,'德国DGPOSY超漩式彩色马桶缓降坐便器静音节水抽水马桶连体座便器','纳米自洁釉 漩涡排污 静音节水 净重50kg',2399,79,82);
INSERT INTO product VALUES (151,'纳蒂兰卡 1082卫浴洁具 钻石切边 坐便器 虹吸式抽水马桶 座便器','高性价比 造型新颖 钻石品质 时尚尊贵 好评如潮',1900,64,82);
INSERT INTO product VALUES (202,'新款布艺沙发 可拆洗大小户型客厅简约家居贵妃组合L型转角布沙发','匠心独运 欧式美式设计 头层真皮 三包到家',5198,94,81);
INSERT INTO product VALUES (203,'凯米蒂亚欧式真皮沙发组合客厅奢华转角皮艺蓝色沙发美式实木家具','匠心独运 欧式美式设计 头层真皮 三包到家',18398,27,81);
INSERT INTO product VALUES (204,'南台布艺沙发组合可拆洗简约现代客厅整装家具布艺沙发组合大户型','16CM坐垫 16CM坐垫 重要的 事情 说三遍',6576,63,81);
INSERT INTO product VALUES (205,'依然美佳欧式布艺沙发组合可拆洗新款实木雕花大户型奢华别墅家具','高档户型客厅 精湛雕花工艺 实木框架 经典款式',10012,51,81);
INSERT INTO product VALUES (206,'雅居汇欧式沙发组合实木雕花客厅高档奢华大户型住宅家具布艺沙发','热卖推荐 端庄大气 四色可选 五年质保 品质服务',32450,51,81);
INSERT INTO product VALUES (262,'Vatti/华帝 DDF60-i14007 60升遥控电储水式电热水器家用速热洗澡','热水器狂欢 专享特价 送货入户 免费安装',2399,80,80);
INSERT INTO product VALUES (263,'Haier/海尔 EC6005-T+  60升电热水器  洗澡淋浴 防电墙 送装同步','3D速热 即用即洗 遥控智能控制 预约洗',1999,37,80);
INSERT INTO product VALUES (264,'哆啦A梦weber I2-80 威博电热水器80升储水式智能速热洗澡淋浴60','阿里智能 每天限送 20份大礼包 全国联保 包邮',1799,79,80);
INSERT INTO product VALUES (265,'Vanward/万和 DSCF50-C32双盾电热水器速热联保安装 洗澡 50L省电','搪瓷超强内胆 高效节能 迅电速热 双盾保护',999,17,80);
INSERT INTO product VALUES (266,'Haier/海尔 EC8003-I/80升洗澡淋浴/储热电热水器防电墙/送货入户','机控遥控 一级节能 自动关机 触摸智能控制',1799,71,80);
INSERT INTO product VALUES (317,'乐行天下R1N智能电动平衡车双轮成人思维体感车两轮儿童代步车','12期免息 智能显示屏 APP遥控 双轮平衡',15960,15,79);
INSERT INTO product VALUES (318,'乐途智能电动悬浮滑板车太空轮平行车蓝牙自平衡独轮代步车','电动平衡 独轮滑板 蓝牙播放 新潮代步车',3885,70,79);
INSERT INTO product VALUES (319,'瑞士米高micro g-bike+ chopper儿童平衡车二轮自行车','可折叠 退货赔运费 续航50 公里更轻更远',899,13,79);
INSERT INTO product VALUES (320,'力达康成人电动滑板车折叠锂电池迷你型可折叠两轮代步车','可折叠 退货赔运费 续航50 公里更轻更远',4160,82,79);
INSERT INTO product VALUES (321,'两轮平衡车双轮儿童思维漂移电动扭扭车智能滑板车成人体感代步车','可折叠 退货赔运费 续航50 公里更轻更远',889,64,79);
INSERT INTO product VALUES (373,'洁霸BF522多功能洗地机刷地机酒店家用地毯清洗机 擦地机抛光机','纯铜电机 厂家直销 售后无忧',1900,39,78);
INSERT INTO product VALUES (374,'Proscenic Swan天鹅扫地机器人 智能家用擦地机拖地全自动吸尘器','非常夏日 直降300元 WIFI智控 卷吸互换',6580,65,78);
INSERT INTO product VALUES (375,'海尔拖地机器人家用全自动擦地机湿拖扫洗地电动智能懒人无线超薄','仿人跪式 干湿两拖 自动充电 精准导航 规划清洁',3999,30,78);
INSERT INTO product VALUES (376,'莱克扫地吸尘器 家用超薄拖地机器人WR10智能静音全自动','新品上市 3000pa 大吸力 无惧毛发缠绕',1299,11,78);
INSERT INTO product VALUES (377,'公众智能扫地机器人家用全自动电动清洁地毯擦拖地一体机吸尘器','扫拖一体 纤薄高效锂电 限时疯抢 不缠毛发',2499,88,78);
INSERT INTO product VALUES (429,'Philips/飞利浦榨汁机原汁家用HR1884多功能水果冰淇淋机慢汁机','',2899,40,77);
INSERT INTO product VALUES (430,'Whirlpool/惠而浦WJU-VP152B原汁机多功能家用大口径料理榨果汁机','整投整榨 原汁无氧化 纯铜电机 三挡压榨',1099,22,77);
INSERT INTO product VALUES (431,'Ranbem/瑞本611原汁机大口径低慢速榨汁家用水果汁迷你豆浆机电动','新款上市 96mm口径 45慢磨转速 出汁率高',2680,35,77);
INSERT INTO product VALUES (432,'AUX/奥克斯 AUX-Y3802原汁机低速 慢磨水果榨汁机果汁机','大功率慢榨 浓度调节 噪音小 易清洗 快捷清洗',999,50,77);
INSERT INTO product VALUES (433,'惠而浦WJU-VS208J原汁机家用慢榨多功能榨汁机果汁机豆浆机炸汁机','大功率慢榨 浓度调节 噪音小 易清洗 快捷清洗',1499,35,77);
INSERT INTO product VALUES (449,'MeiLing/美菱 BCD-560WUCX对开门电冰箱家用冰箱WIFI智能风冷无霜','家用冰箱 WIFI智能 风冷无霜',3399,54,76);
INSERT INTO product VALUES (450,'FRESTECH/新飞 BCD-286WDKSM阿里云智能wifi风冷无霜智控两门冰箱','阿里云智能 远程WIFI 智控 风冷无霜',3599,68,76);
INSERT INTO product VALUES (451,'Konka/康佳 BCD-558WEGY5SWT对开冰箱家用一级节能风冷无霜电冰箱','阿里云智能 风冷无霜 大容量 一级能效节能',3000,74,76);
INSERT INTO product VALUES (452,'【阿里智能】Galanz/格兰仕 BCD-251WTHG(T) 三门电冰箱251升风冷','风冷无霜 一级能效 智能控温 菱格面板 立体风',3299,63,76);
INSERT INTO product VALUES (453,'Haier/海尔 BCD-618WDVGU1海尔变频对开门风冷智能控温双门电冰箱','手机智能控制 玫瑰金外观 杀菌净味系统 变频',6999,22,76);
INSERT INTO product VALUES (509,'AUX/奥克斯 KFR-26GW/BpTYC19+1大1匹高端智能云变频冷暖挂机空调','30秒速冷 一级能效 ECO节能 阿里智能 除湿',3799,15,75);
INSERT INTO product VALUES (510,'Kelon/科龙 KFR-26GW/EFQRA2(1N20) 大1匹二级变频智能冷暖挂机','二级变频 阿里智能 高效除甲醛 快速制冷暖',2599,78,75);
INSERT INTO product VALUES (511,'TCL KFRd-35GW/EP13 大1.5匹冷暖电辅空调1.5P挂机定频壁挂式包邮','快速冷暖 四重静音 每日前5名 好礼2选1',2399,64,75);
INSERT INTO product VALUES (512,'Panasonic/松下 KFR-36GW/BpSJ1S大1.5匹直流变频冷暖挂式空调','原装变频压缩 机静音除雾霾 送货入户 0元分期',3999,59,75);
INSERT INTO product VALUES (513,'Panasonic/松下 KFR-36GW/SH2-1大1.5匹二级能效静音空调挂机','原装压缩机 品质保证 二级能效',3399,71,75);
INSERT INTO product VALUES (565,'正品雷克斯韩版简约时尚潮流真皮石英情侣表女士手表女表皮带防水','时尚之选 做精致女人 精美包装 支持货到付款',1280,82,74);
INSERT INTO product VALUES (566,'正港手表女四叶草防水手链表简约潮流学生女表韩版时尚石英表正品','热销万只 4.9分好评 代写贺卡 质保一年',143.71,23,74);
INSERT INTO product VALUES (567,'罗宾 钢带女表 女士腕表 水钻夜光防水石英表 潮流时尚复古手表女','正品 水钻刻度 钢带女表 买一送三 赠送运费险',990,54,74);
INSERT INTO product VALUES (568,'浪铂正品长方形手表女表皮带时尚潮流石英表防水真皮学生休闲腕表','今日拍下 自动减30 送真皮表带 石榴石手链',998,81,74);
INSERT INTO product VALUES (569,'宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮','陈小春代言 宾格正品 情侣手表 同款还有男表',488,16,74);
INSERT INTO product VALUES (620,'依伦新款超薄手表 男表真皮带休闲时尚男士腕表潮流防水石英表','简约两针 深度防水 进口机芯 送真皮表带 运费险',1280,64,73);
INSERT INTO product VALUES (621,'【入门】西铁城CITIZEN新品超值体验机械手表男表NH8350-59AB/EB','全国联保 3期0利息 大气简约 新品',1700,60,73);
INSERT INTO product VALUES (622,'正品手表男精钢商务休闲男士手表石英表时尚潮流夜光超薄男表防水','机构质检 防水夜光 赠送皮表带 特价抢购',699,34,73);
INSERT INTO product VALUES (623,'正品名仕爵手表男机械表夜光精钢防水大表盘 全自动时尚潮流男表','终身保修 正品 全自动 机械表 镂空机械表',1900,85,73);
INSERT INTO product VALUES (624,'飞克手表 男表皮带手表 防水商务休闲男士手表 腕表 石英表手表','正品进口机芯 蓝宝石镜面 指针星期显示',1999,82,73);
INSERT INTO product VALUES (673,'劳迪莱斯男士手包休闲手拿包牛皮大容量钱包男包软面小包包手抓包','牛皮手包 耐磨耐用 多卡位设计',185,24,72);
INSERT INTO product VALUES (674,'英伦邦纹男士手包牛皮大容量真皮手拿包手抓包双拉链商务正品软皮','意大利牛皮 纹路自然漂亮 更耐用更尊贵 手感棒',588,42,72);
INSERT INTO product VALUES (675,'唯美诺新款男士手包男包真皮大容量小羊皮手拿包信封包软皮夹包潮','优质羊皮 大容量 品牌做工 超软手感 终身包保修',498,84,72);
INSERT INTO product VALUES (676,'宾度 男士手包真皮大容量手拿包牛皮个性潮男包手抓包软皮信封包','专注品质领卷 顺丰包邮 头层牛皮 大容量 软皮',568,79,72);
INSERT INTO product VALUES (677,'MAXFEEL休闲男士手包真皮手拿包大容量信封包手抓包夹包软韩版潮','无理由退换货 赠退货运费险',888,98,72);
INSERT INTO product VALUES (729,'【新】罗蒙羊毛西服套装男修身商务职业装2016年秋季新款#1S51126','高端大气 商务休闲 时尚潮流 全国包邮 赠运费险',2199,96,71);
INSERT INTO product VALUES (730,'男士西服套装修身英伦竖条纹休闲西装男套装三件套新郎结婚礼服春','今赠马甲衬衫 精致竖条纹 奢华品质 精细做工',729,30,71);
INSERT INTO product VALUES (731,'西服套装男夏季新郎结婚礼服三件套伴郎服薄款西服大码西装男套装','亮眼帅气 优雅休闲 格调气质 时尚格子 结婚首选',1988,10,71);
INSERT INTO product VALUES (732,'三件套Actionmates新款韩版修身休闲格子西服套装男士小西装礼服','韩国进口面料 韩版立体裁剪 版型好 送领结领带',799,56,71);
INSERT INTO product VALUES (733,'Action mates韩版修身男士西服套装发型师休闲小西装结婚礼服潮','包邮申通 韩版修身 版型好 不容错过',699,79,71);
INSERT INTO product VALUES (784,'DOGEXI透气真皮男鞋子雕花男士休闲鞋反绒皮英伦低帮板鞋男潮鞋秋','牛皮鞋面 猪皮内里 标准运动鞋码',289,21,69);
INSERT INTO product VALUES (785,'花花公子男鞋夏季小白鞋男士休闲鞋白鞋板鞋白色平底百搭鞋子男潮','天猫正品 百搭小白鞋 顺丰包邮',330,44,69);
INSERT INTO product VALUES (786,'花花公子皮鞋男士商务休闲男鞋夏季英伦真皮系带休闲鞋男板鞋子','高端大气 商务休闲 时尚潮流 全国包邮 赠运费险',368,23,69);
INSERT INTO product VALUES (787,'酷队秋季运动鞋情侣鞋跑步鞋潮男鞋子透气休闲鞋飞织低帮潮鞋系带','高端大气 商务休闲 时尚潮流 全国包邮 赠运费险',328,73,69);
INSERT INTO product VALUES (788,'木林森夏季男鞋休闲鞋男英伦真皮男士休闲皮鞋圆头系带青年潮鞋子','头层牛皮 时尚休闲 韩版潮流 型男必备',326,96,69);
INSERT INTO product VALUES (844,'拉夏贝尔puella普埃拉2016休闲修身五分袖一字领收腰套装20007986','',369,71,68);
INSERT INTO product VALUES (845,'拉夏贝尔 7m莫丽菲尔2016秋新款条纹五分袖连衣裙套装女70006522','8月3日 新品',399,79,68);
INSERT INTO product VALUES (846,'女巫2016欧洲站夏季新品欧美时尚绣花衬衣上衣九分裤两件套装高端','女巫高端定制 欧美时尚 两件套',928,29,68);
INSERT INTO product VALUES (847,'妖精的口袋P360度漂浮秋装欧美半身裙短款外套时尚套装女两件套','口袋特殊材质 拼接 品质扣子 水洗色 套装',399,73,68);
INSERT INTO product VALUES (848,'妖精的口袋P几枚礼物秋装甜美连帽短外套印花休闲裤时尚套装女','帽里撞色 植绒抽绳装饰 质感吊钟 图案印花 套装',339,87,68);


##订单表
CREATE TABLE `order` (
  id int(11) NOT NULL AUTO_INCREMENT,
  orderCode varchar(255) DEFAULT NULL UNIQUE,
  num int(11) DEFAULT NULL,
  payment float DEFAULT NULL,
  address varchar(255) DEFAULT NULL,
  receiver varchar(255) DEFAULT NULL,
  mobile varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  userMessage varchar(255) DEFAULT NULL,
  salerMessage varchar(255) DEFAULT NULL,
  createDate datetime DEFAULT NULL,
  status int(11) NOT NULL default '1' COMMENT '1:等待商家发货 2:等待用户确认收货 3:用户订单被拒绝 4:订单关闭',
  uid int(11) DEFAULT NULL,
  pid int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_order_user FOREIGN KEY (uid) REFERENCES user (id),
  CONSTRAINT fk_order_product FOREIGN KEY (pid) REFERENCES product (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
INSERT INTO `order` VALUES (1,'20180326161432',1,789,'上海大学','李驰骋','18818216483','li@163.com','质量好','已发货','2018-03-26 16:14:32',3,4,730);
INSERT INTO `order` VALUES (2,'20180326161534',1,1900,'招行','张三','18818216411','yuan@163.com',null,null,'2018-03-26 16:15:34',1,4,623);
INSERT INTO `order` VALUES (3,'20180326161912',4,578,'招行','张三','18818216411','zhang@163.com',null,null,'2018-03-26 16:19:12',2,4,673);