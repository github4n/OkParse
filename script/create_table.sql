CREATE TABLE LOT_ODDS_ASIA (
                ID INT AUTO_INCREMENT NOT NULL,
        	OK_MATCH_ID NUMERIC(10) NOT NULL,
                ODDS_CORP_NAME VARCHAR(20) NOT NULL,
                HANDICAP NUMERIC(4,2) NOT NULL,
                HOST_ODDS NUMERIC(5,2) NOT NULL,
                VISITING_ODDS NUMERIC(5,2) NOT NULL,
                INIT_TIME VARCHAR(10) NOT NULL,
                INIT_HANDICAP NUMERIC(4,2) NOT NULL,
                INIT_HOST_ODDS NUMERIC(5,2) NOT NULL,
                INIT_VISITING_ODDS NUMERIC(5,2) NOT NULL,
                LOSS_RATIO NUMERIC(4,2) NOT NULL,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

CREATE TABLE LOT_ODDS_ASIA_CHANGE (
                ID INT AUTO_INCREMENT NOT NULL,
		OK_MATCH_ID NUMERIC(10) NOT NULL,
                ODDS_CORP_NAME VARCHAR(20) NOT NULL,
                ODDS_SEQ INT NOT NULL,
                ODDS_TIME DATETIME NOT NULL,
                TIME_BEFORE_MATCH VARCHAR(10) NOT NULL,
                HANDICAP NUMERIC(4,2) NOT NULL,
                HOST_ODDS NUMERIC(5,2) NOT NULL,
                VISITING_ODDS NUMERIC(5,2) NOT NULL,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

CREATE TABLE LOT_ODDS_EURO_CHANGE (
                ID INT AUTO_INCREMENT NOT NULL,
		OK_MATCH_ID NUMERIC(10) NOT NULL,
                ODDS_CORP_NAME VARCHAR(20) NOT NULL,
                ODDS_SEQ INT NOT NULL,
                ODDS_TIME DATETIME NOT NULL,
                TIME_BEFORE_MATCH VARCHAR(10) NOT NULL,
                HOST_ODDS NUMERIC(5,2) NOT NULL,
                EVEN_ODDS NUMERIC(5,2) NOT NULL,
                VISITING_ODDS NUMERIC(5,2) NOT NULL,
                HOST_PROB NUMERIC(4,2) NOT NULL,
                EVEN_PROB NUMERIC(4,2) NOT NULL,
                VISITING_PROB NUMERIC(4,2) NOT NULL,
                HOST_KELLY NUMERIC(4,2) NOT NULL,
                EVEN_KELLY NUMERIC(4,2) NOT NULL,
                VISITING_KELLY NUMERIC(4,2) NOT NULL,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

CREATE TABLE LOT_ODDS_EURO_CHANGE_DAILY (
                OK_URL_DATE VARCHAR(10) NOT NULL,
                MATCH_SEQ INT NOT NULL,
                ODDS_CORP_NAME VARCHAR(50) NOT NULL,
                ODDS_SEQ INT NOT NULL,
                ODDS_TIME DATETIME NOT NULL,
                TIME_BEFORE_MATCH VARCHAR(10) NOT NULL,
                HOST_ODDS NUMERIC(5,2) NOT NULL,
                EVEN_ODDS NUMERIC(5,2) NOT NULL,
                VISITING_ODDS NUMERIC(5,2) NOT NULL,
                HOST_PROB NUMERIC(4,2) NOT NULL,
                EVEN_PROB NUMERIC(4,2) NOT NULL,
                VISITING_PROB NUMERIC(4,2) NOT NULL,
                HOST_KELLY NUMERIC(4,2) NOT NULL,
                EVEN_KELLY NUMERIC(4,2) NOT NULL,
                VISITING_KELLY NUMERIC(4,2) NOT NULL,
                LOSS_RATIO NUMERIC(4,2) NOT NULL,
                CHANGE_NUM INT DEFAULT 0,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, ODDS_CORP_NAME, ODDS_SEQ)
);

-- 2015-05-15 去掉主键 ID INT AUTO_INCREMENT NOT NULL, 添加 OK_URL_DATE, MATCH_SEQ.  清空原表里的数据.
CREATE TABLE LOT_ODDS_EURO (
                OK_URL_DATE VARCHAR(10) NOT NULL,
                MATCH_SEQ INT NOT NULL,
                ODDS_CORP_NAME VARCHAR(50) NOT NULL,
                HOST_ODDS NUMERIC(5,2) NOT NULL,
                EVEN_ODDS NUMERIC(5,2) NOT NULL,
                VISITING_ODDS NUMERIC(5,2) NOT NULL,
                INIT_TIME VARCHAR(10) NOT NULL,
                INIT_HOST_ODDS NUMERIC(5,2) NOT NULL,
                INIT_EVEN_ODDS NUMERIC(5,2) NOT NULL,
                INIT_VISITING_ODDS NUMERIC(5,2) NOT NULL,
                HOST_KELLY NUMERIC(4,2) NOT NULL,
                EVEN_KELLY NUMERIC(4,2) NOT NULL,
                VISITING_KELLY NUMERIC(4,2) NOT NULL,
                LOSS_RATIO NUMERIC(4,2) NOT NULL,
                TIMESTAMP DATETIME NOT NULL,
	        PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, ODDS_CORP_NAME)
);

CREATE TABLE LOT_MATCH (
                ID INT AUTO_INCREMENT NOT NULL,
                OK_MATCH_ID NUMERIC(10) NOT NULL,
                MATCH_NAME VARCHAR(20) NOT NULL,
                MATCH_SEQ INT NOT NULL,
                MATCH_TIME DATETIME NOT NULL,
                CLOSE_TIME DATETIME,
                HOST_TEAM_NAME VARCHAR(20) NOT NULL,
                VISITING_TEAM_NAME VARCHAR(20) NOT NULL,
                HOST_GOALS INT,
	       	VISITING_GOALS INT,
		OK_URL_DATE VARCHAR(10) NOT NULL,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

CREATE TABLE LOT_BF_TURNOVER_DETAIL (
                ID INT NOT NULL,
                SEQ INT NOT NULL,
                TO_TIME DATETIME NOT NULL,
                HOST_PRICE NUMERIC(4,2) NOT NULL,
                HOST_TOTAL NUMERIC(10) NOT NULL,
                HOST_SINGLE NUMERIC(8),
                HOST_BUY_SELL VARCHAR(1),
                EVEN_PRICE NUMERIC(4,2) NOT NULL,
                EVEN_TOTAL NUMERIC(10) NOT NULL,
                EVEN_SINGLE NUMERIC(8),
                EVEN_BUY_SELL VARCHAR(1),
                VISITING_PRICE NUMERIC(4,2) NOT NULL,
                VISITING_TOTAL NUMERIC(10) NOT NULL,
                VISITING_SINGLE NUMERIC(8),
                VISITING_BUY_SELL VARCHAR(1),
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID, SEQ)
);

CREATE TABLE LOT_TRANS_PROP (
                ID INT NOT NULL,
                HOST_BF NUMERIC(4,2),
                EVEN_BF NUMERIC(4,2),
                VISITING_BF NUMERIC(4,2),
                HOST_COMP NUMERIC(4,2),
                EVEN_COMP NUMERIC(4,2),
                VISITING_COMP NUMERIC(4,2),
                HOST_BJ_SINGLE NUMERIC(4,2),
                EVEN_BJ_SINGLE NUMERIC(4,2),
                VISITING_BJ_SINGLE NUMERIC(4,2),
                HOST_BF_PROLOSS_INDEX INT,
                EVEN_BF_PROLOSS_INDEX INT,
                VISITING_BF_PROLOSS_INDEX INT,
                HOST_COMP_PROLOSS_INDEX INT,
                EVEN_COMP_PROLOSS_INDEX INT,
                VISITING_COMP_PROLOSS_INDEX INT,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

CREATE TABLE LOT_ALL_AVERAGE (
                ID INT NOT NULL,
                HOST_ODDS NUMERIC(5,2),
                EVEN_ODDS NUMERIC(5,2),
                VISITING_ODDS NUMERIC(5,2),
                HOST_PROB NUMERIC(4,2),
                EVEN_PROB NUMERIC(4,2),
                VISITING_PROB NUMERIC(4,2),
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

CREATE TABLE LOT_BF_LISTING (
                ID INT NOT NULL,
                HOST_BUYERS_PRICE NUMERIC(4,2) ,
                HOST_BUYERS_QUANTITY NUMERIC(8) ,
                EVEN_BUYERS_PRICE NUMERIC(4,2) ,
                EVEN_BUYERS_QUANTITY NUMERIC(8),
                VISITING_BUYERS_PRICE NUMERIC(4,2),
                VISITING_BUYERS_QUANTITY NUMERIC(8),
                HOST_SELLERS_PRICE NUMERIC(4,2),
                HOST_SELLERS_QUANTITY NUMERIC(8),
                EVEN_SELLERS_PRICE NUMERIC(4,2),
                EVEN_SELLERS_QUANTITY NUMERIC(8),
                VISITING_SELLERS_PRICE NUMERIC(4,2),
                VISITING_SELLERS_QUANTITY NUMERIC(8),
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);

-- 由 R语言自动生成. 
/*
CREATE TABLE LOT_WEIGHT_RULE (
                ID INT AUTO_INCREMENT NOT NULL,
                ODDS_CORP_NAME VARCHAR(20) NOT NULL,
                MATCH_NAME VARCHAR(20) NOT NULL,
                COUNT INT,
                WIN_COUNT INT,
                EVEN_COUNT INT,
                NEGA_COUNT INT,
                WIN_PROB NUMERIC(4,2) NOT NULL,
                EVEN_PROB NUMERIC(4,2) NOT NULL,
                NEGA_PROB NUMERIC(4,2) NOT NULL,
                RULE_TYPE VARCHAR(2) NOT NULL,
                TIMESTAMP DATETIME NOT NULL,
                PRIMARY KEY (ID)
);
*/

-- 记录博彩公司情况, 后增加EURO_TIME_BEFORE_MATCH, 表示平均的赔率变化时间(非所有);
CREATE TABLE LOT_CORP(
               CORP_NO VARCHAR(10) NOT NULL,
	       CORP_NAME VARCHAR(50) NOT NULL,
	       TIMESTAMP DATETIME NOT NULL,
	       PRIMARY KEY(CORP_NO)
);

-- 记录不同公司对每场比赛的kelly方法预测情况;
CREATE TABLE LOT_KELLY_CORP_RESULT(
               OK_URL_DATE VARCHAR(10) NOT NULL,
               MATCH_NAME VARCHAR(20) NOT NULL,
               ODDS_CORP_NAME VARCHAR(50) NOT NULL,
               COUNT INT NOT NULL,
               WIN_COUNT INT NOT NULL,
               EVEN_COUNT INT NOT NULL,
               NEGA_COUNT INT NOT NULL,
               ALL_SEQ VARCHAR(200) NOT NULL,
               WIN_SEQ VARCHAR(200) NOT NULL,
               EVEN_SEQ VARCHAR(200) NOT NULL,
               NEGA_SEQ VARCHAR(200) NOT NULL,
               WIN_PROB NUMERIC(4,2) NOT NULL,
               EVEN_PROB NUMERIC(4,2) NOT NULL,
               NEGA_PROB NUMERIC(4,2) NOT NULL,
               TIMESTAMP DATETIME NOT NULL
);

-- 记录不同联赛各个赔率区间里kelly方法预测正确的平均数.
CREATE TABLE LOT_KELLY_CORP_COUNT(
               MATCH_NAME VARCHAR(20) NOT NULL,
               BEGIN_HOST_ODDS NUMERIC(5,2),
               END_HOST_ODDS NUMERIC(5,2),
               CORP_COUNT_WIN INT NOT NULL,
               RULE_TYPE VARCHAR(2) NOT NULL,
               TIMESTAMP DATETIME NOT NULL
);

-- 记录定时JOB信息.
CREATE TABLE LOT_JOB(
	       OK_URL_DATE VARCHAR(10) NOT NULL,
               BEGIN_MATCH_SEQ INT NOT NULL,
               END_MATCH_SEQ INT NOT NULL,
	       JOB_TYPE VARCHAR(2) NOT NULL,
	       STATUS VARCHAR(1) NOT NULL,
	       REMARK VARCHAR(50) NOT NULL,
	       BEGIN_TIME DATETIME NOT NULL,
               TIMESTAMP DATETIME NOT NULL
);

-- 记录距离开赛不同时间段(job_type), 满足不同kelly分析方法(rule_type)的博彩公司个数; 
-- 目前在 job 中使用, 记录变化情况
CREATE TABLE LOT_KELLY_MATCH_COUNT(
	       OK_URL_DATE VARCHAR(10) NOT NULL,
               MATCH_SEQ INT NOT NULL,
	       JOB_TYPE VARCHAR(2) NOT NULL,
               RULE_TYPE VARCHAR(2) NOT NULL,
               CORP_COUNT INT NOT NULL,
               TIMESTAMP DATETIME NOT NULL
);

-- 记录常用赛事的积分情况;
CREATE TABLE LOT_LEAGUE_POINTS(
	     LEAGUE_TIME VARCHAR(10) NOT NULL,
             LEAGUE_ID INT NOT NULL,
             LEAGUE_NAME VARCHAR(20) NOT NULL,
             RANK INT NOT NULL,
             TEAM_NAME VARCHAR(20) NOT NULL,	
	     TOTAL_MATCH INT NOT NULL,
	     TOTAL_WIN INT NOT NULL,
	     TOTAL_EVEN INT NOT NULL,
	     TOTAL_NEGA INT NOT NULL,
	     TOTAL_GOALS INT NOT NULL,
	     TOTAL_LOST INT NOT NULL,
	     TOTAL_GOALS_DIFF INT NOT NULL,
	     HOST_MATCH INT NOT NULL,
	     HOST_WIN INT NOT NULL,
	     HOST_EVEN INT NOT NULL,
	     HOST_NEGA INT NOT NULL,
	     HOST_GOALS INT NOT NULL,
	     HOST_LOST INT NOT NULL,
	     VISITING_MATCH INT NOT NULL,
	     VISITING_WIN INT NOT NULL,
	     VISITING_EVEN INT NOT NULL,
	     VISITING_NEGA INT NOT NULL,
	     VISITING_GOALS INT NOT NULL,
	     VISITING_LOST INT NOT NULL,
	     POINTS INT NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
             PRIMARY KEY(LEAGUE_TIME, LEAGUE_ID, RANK)
);

--记录常用赛事的id对应关系
--CREATE TABLE

-- 记录每场比赛的技术统计; 数据以|分隔开主队、客队;
CREATE TABLE LOT_MATCH_STATS(
             OK_MATCH_ID NUMERIC(10) NOT NULL,
	     OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
	     SHOTS_ON_TARGET VARCHAR(10) NOT NULL,
	     SHOTS_OFF_TARGET VARCHAR(10) NOT NULL,
	     FREE_KICK VARCHAR(10) NOT NULL,
	     CORNERS VARCHAR(10) NOT NULL,
	     THROW_INS VARCHAR(10) NOT NULL,       -- 界外球
             GOALKEEPER_DIST VARCHAR(10) NOT NULL, -- 球门球
	     BEAT_OUT_SHOT VARCHAR(10) NOT NULL,   -- 守门员扑球
             OFFSIDE VARCHAR(10) NOT NULL,        -- 越位
             FOUL_COMMITTED VARCHAR(10) NOT NULL, -- 犯规	
	     POSSESSION VARCHAR(20) NOT NULL,     -- 控球率
             TIMESTAMP DATETIME NOT NULL,
             PRIMARY KEY(OK_MATCH_ID)
);

-- 记录比分的赔率.
CREATE TABLE LOT_SCORE_ODDS(
             OK_MATCH_ID NUMERIC(10) NOT NULL,
	     OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
	     WIN_ODDS VARCHAR(200) NOT NULL DEFAULT '|',
	     EVEN_ODDS VARCHAR(200) NOT NULL DEFAULT '|',
	     NEGA_ODDS VARCHAR(200) NOT NULL DEFAULT '|',
	     INTERVAL_TYPE VARCHAR(2) NOT NULL,   -- 按照距离比赛的时间分段.
             TIMESTAMP DATETIME NOT NULL,
             PRIMARY KEY(OK_MATCH_ID, INTERVAL_TYPE)
);

-- 记录配置参数.
CREATE TABLE LOT_CONFIG(
	NAME VARCHAR(50) NOT NULL,
        VALUE VARCHAR(100) NOT NULL,
        TIMESTAMP DATETIME NOT NULL,
        PRIMARY KEY(NAME)
);

-- 记录daily job 中跳过哪些比赛场次; 
CREATE TABLE LOT_MATCH_SKIP(
	     OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY(OK_URL_DATE, MATCH_SEQ)
);

-- 记录欧赔变化情况，与LOT_ODDS_EURO_CHANGE不同的是去掉ID 和 OK_MATCH_ID, 添加 OK_URL_DATE和MATCH_SEQ, 以前的表保持不变.
CREATE TABLE LOT_ODDS_EURO_CHANGE_ALL (
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
             ODDS_CORP_NAME VARCHAR(20) NOT NULL,
             ODDS_SEQ INT NOT NULL,
             ODDS_TIME DATETIME NOT NULL,
             TIME_BEFORE_MATCH VARCHAR(10) NOT NULL,
             HOST_ODDS NUMERIC(5,2) NOT NULL,
             EVEN_ODDS NUMERIC(5,2) NOT NULL,
             VISITING_ODDS NUMERIC(5,2) NOT NULL,
             HOST_PROB NUMERIC(4,2) NOT NULL,
             EVEN_PROB NUMERIC(4,2) NOT NULL,
             VISITING_PROB NUMERIC(4,2) NOT NULL,
             HOST_KELLY NUMERIC(4,2) NOT NULL,
             EVEN_KELLY NUMERIC(4,2) NOT NULL,
             VISITING_KELLY NUMERIC(4,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
             PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, ODDS_CORP_NAME, ODDS_SEQ)
);

-- 按照jobType记录不同时间段的亚盘信息
CREATE TABLE LOT_ODDS_ASIA_TRENDS (
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
             ODDS_CORP_NAME VARCHAR(50) NOT NULL,
	     JOB_TYPE VARCHAR(2) NOT NULL,
             MATCH_NAME VARCHAR(20) NOT NULL,
             INIT_TIME VARCHAR(10) NOT NULL,
             INIT_HANDICAP NUMERIC(4,2) NOT NULL,
             INIT_HOST_ODDS NUMERIC(5,2) NOT NULL,
             INIT_VISITING_ODDS NUMERIC(5,2) NOT NULL,
             HOST_ODDS NUMERIC(5,2) NOT NULL,
             HANDICAP NUMERIC(4,2) NOT NULL,
             VISITING_ODDS NUMERIC(5,2) NOT NULL,
             HOST_KELLY NUMERIC(4,2) NOT NULL,
             VISITING_KELLY NUMERIC(4,2) NOT NULL,
             LOSS_RATIO NUMERIC(4,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, ODDS_CORP_NAME, JOB_TYPE)
);

-- 记录不同jobType下的指数信息，包括凯利方差、凯利离散度、澳客指数等.
CREATE TABLE LOT_INDEX_STATS(
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
	     JOB_TYPE VARCHAR(2) NOT NULL,
             INIT_OKOOO_HOST NUMERIC(5,2) NOT NULL,
             INIT_OKOOO_EVEN NUMERIC(5,2) NOT NULL,
             INIT_OKOOO_VISITING NUMERIC(5,2) NOT NULL,
             OKOOO_HOST NUMERIC(5,2) NOT NULL,
             OKOOO_EVEN NUMERIC(5,2) NOT NULL,
             OKOOO_VISITING NUMERIC(5,2) NOT NULL,
             INIT_STD_DEV_HOST NUMERIC(5,2) NOT NULL,
             INIT_STD_DEV_EVEN NUMERIC(5,2) NOT NULL,
             INIT_STD_DEV_VISITING NUMERIC(5,2) NOT NULL,
             STD_DEV_HOST NUMERIC(5,2) NOT NULL,
             STD_DEV_EVEN NUMERIC(5,2) NOT NULL,
             STD_DEV_VISITING NUMERIC(5,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, JOB_TYPE)
);

-- 记录让球页面信息，即 http://www.okooo.com/soccer/match/764129/hodds/
CREATE TABLE LOT_ODDS_EURO_HANDICAP(
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
	     JOB_TYPE VARCHAR(2) NOT NULL,
             ODDS_CORP_NAME VARCHAR(20) NOT NULL,
             EURO_HANDICAP INT NOT NULL,
	     COMP_HANDICAP INT ,   -- 竞彩的值,可能不存在.
             INIT_HOST_ODDS NUMERIC(5,2) NOT NULL,
             INIT_EVEN_ODDS NUMERIC(5,2) NOT NULL,
             INIT_VISITING_ODDS NUMERIC(5,2) NOT NULL,
             HOST_ODDS NUMERIC(5,2) NOT NULL,
             EVEN_ODDS NUMERIC(5,2) NOT NULL,
             VISITING_ODDS NUMERIC(5,2) NOT NULL,
             HOST_KELLY NUMERIC(4,2) NOT NULL,
             EVEN_KELLY NUMERIC(4,2) NOT NULL,
             VISITING_KELLY NUMERIC(4,2) NOT NULL,
             LOSS_RATIO NUMERIC(4,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, JOB_TYPE, ODDS_CORP_NAME, EURO_HANDICAP)
);

-- 记录将欧赔转换为亚盘的信息;  增加存储欧赔亚盘初始信息,此时JOB_TYPE值为I
CREATE TABLE LOT_EURO_TRANS_ASIA (
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
	     JOB_TYPE VARCHAR(2) NOT NULL,
             ODDS_CORP_NAME VARCHAR(20) NOT NULL,
             HOST_ODDS_EURO NUMERIC(5,2) NOT NULL,
             EVEN_ODDS_EURO NUMERIC(5,2) NOT NULL,
             VISITING_ODDS_EURO NUMERIC(5,2) NOT NULL,
             LOSS_RATIO_EURO NUMERIC(4,2) NOT NULL,
	     HOST_ODDS_ASIA_TRANS NUMERIC(5,2) NOT NULL,
             HANDICAP_ASIA_TRANS NUMERIC(4,2) NOT NULL,
	     VISITING_ODDS_ASIA_TRANS NUMERIC(5,2) NOT NULL,
	     TOTAL_DISCOUNT_TRANS NUMERIC(5,2) NOT NULL,
	     HOST_ODDS_ASIA NUMERIC(5,2) NOT NULL,
             HANDICAP_ASIA NUMERIC(4,2) NOT NULL,
	     VISITING_ODDS_ASIA NUMERIC(5,2) NOT NULL,
	     TOTAL_DISCOUNT NUMERIC(5,2) NOT NULL,
             LOSS_RATIO_ASIA NUMERIC(4,2),
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, JOB_TYPE, ODDS_CORP_NAME)
);

-- 记录欧亚转换关系, 欧亚转换关系中以上盘为主，然后用3.85-上盘水位，得出下盘水位.
CREATE TABLE LOT_EURO_ASIA_REFER(
             ODDS_EURO NUMERIC(5,2) NOT NULL,
             ODDS_ASIA_TOP  NUMERIC(5,2) NOT NULL,
             HANDICAP_ASIA NUMERIC(4,2) NOT NULL,
             ODDS_ASIA_UNDER  NUMERIC(5,2) NOT NULL,
	     TOTAL_DISCOUNT NUMERIC(5,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (ODDS_EURO)
);

-- 记录市场平均的概率, 计算方法为: 某一家的kelly指数/该家的赔率.  分阶段.
CREATE TABLE LOT_PROB_AVG(
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
	     JOB_TYPE VARCHAR(2) NOT NULL,
             HOST_PROB NUMERIC(4,2) NOT NULL,
             EVEN_PROB NUMERIC(4,2) NOT NULL,
             VISITING_PROB NUMERIC(4,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (OK_URL_DATE, MATCH_SEQ, JOB_TYPE)
);

-- 记录分析LOT_ODDS_EURO_CHANGE_DAILY 后的结果.
CREATE TABLE LOT_EURO_CHANGE_DAILY_STATS(
             OK_URL_DATE VARCHAR(10) NOT NULL,
	     STATS_TYPE VARCHAR(5) NOT NULL,  -- 分析类型 H:主胜 HE:主胜平 V:客胜 EV:客胜平
             ODDS_CORP_NAME VARCHAR(20) NOT NULL,
             RANK INT,  -- 排名
	     TOTAL_MATCHES INT, -- 该TYPE下的开盘符合条件的总场数
	     HOST_MATCHES INT,
	     EVEN_MATCHES INT,
	     VISITING_MATCHES INT,
             PROB NUMERIC(4,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
	     PRIMARY KEY (OK_URL_DATE, STATS_TYPE, ODDS_CORP_NAME)
);

-- 记录所有公司的亚盘变化情况。不是所有的变化数据。而是最初、盘口变化时、最新这3种情况.
CREATE TABLE LOT_ODDS_ASIA_CHANGE_DAILY (
             OK_URL_DATE VARCHAR(10) NOT NULL,
             MATCH_SEQ INT NOT NULL,
             ODDS_CORP_NAME VARCHAR(50) NOT NULL,
             ODDS_SEQ INT NOT NULL,
	     JOB_TYPE VARCHAR(2) NOT NULL,
             TIME_BEFORE_MATCH VARCHAR(10) NOT NULL,
             HANDICAP NUMERIC(4,2) NOT NULL,
             HOST_ODDS NUMERIC(5,2) NOT NULL,
             VISITING_ODDS NUMERIC(5,2) NOT NULL,
             TIMESTAMP DATETIME NOT NULL,
             PRIMARY KEY (OK_URL_DATE, MATCH_SEQ,ODDS_CORP_NAME,ODDS_SEQ, JOB_TYPE)
);
-- LOT_ODDS_EURO_CHANGE 增加一列 CHANGE_NUM, 记录某个公司对某场比赛的赔率变化次数.
ALTER TABLE LOT_ODDS_EURO_CHANGE ADD CHANGE_NUM INT DEFAULT 0;
ALTER TABLE LOT_ODDS_ASIA_CHANGE ADD CHANGE_NUM INT DEFAULT 0;
-- LOT_KELLY_CORP_RESULT 增加一列 RULE_TYPE.
ALTER TABLE LOT_KELLY_CORP_RESULT ADD RULE_TYPE VARCHAR(2);
-- LOT_CORP 增加一列 EURO_TIME_BEFORE_MATCH 表示 LOT_ODDS_EURO_CHANGE 中ODDS_SEQ=2时的平均值;
ALTER TABLE LOT_CORP ADD EURO_TIME_BEFORE_MATCH NUMERIC(6, 2);
-- LOT_KELLY_MATCH_COUNT 中增加 PRO_LOSS 盈亏率, 即 预测方法C, 对应的 RULE_TYPE 为 P1.  分别为HOST|EVEN|NEGA|
ALTER TABLE LOT_KELLY_MATCH_COUNT ADD PRO_LOSS VARCHAR(30);
-- LOT_KELLY_MATCH_COUNT 中增加 EXTEND1, EXTEND2
ALTER TABLE LOT_KELLY_MATCH_COUNT ADD EXTEND1 VARCHAR(30);
ALTER TABLE LOT_KELLY_MATCH_COUNT ADD EXTEND2 VARCHAR(30);
-- LOT_MATCH_STATS 中增加进球时间
ALTER TABLE LOT_MATCH_STATS ADD GOAL_TIME VARCHAR(100) DEFAULT '|' NOT NULL;
-- LOT_JOB 中增加一列: TIME_TYPE, 记录A0，A1，A2，A3的时间起止.
ALTER TABLE LOT_JOB ADD TIME_TYPE VARCHAR(50) DEFAULT '|' NOT NULL;
ALTER TABLE LOT_JOB MODIFY TIME_TYPE VARCHAR(100) DEFAULT '|' NOT NULL;
-- LOT_KELLY_MATCH_COUNT 中EXTEND1, EXTEND2长度修改为100.
ALTER TABLE LOT_KELLY_MATCH_COUNT MODIFY EXTEND1 VARCHAR(100);
ALTER TABLE LOT_KELLY_MATCH_COUNT MODIFY EXTEND2 VARCHAR(100);
-- LOT_KELLY_MATCH_COUNT 的RULE_TYPE长度修改为3.
ALTER TABLE LOT_KELLY_MATCH_COUNT MODIFY RULE_TYPE VARCHAR(3);
-- LOT_EURO_TRANS_ASIA 增加 HOST_KELLY, VISITING_KELLY
ALTER TABLE LOT_EURO_TRANS_ASIA ADD HOST_KELLY_ASIA NUMERIC(4,2);
ALTER TABLE LOT_EURO_TRANS_ASIA ADD VISITING_KELLY_ASIA NUMERIC(4,2);
ALTER TABLE LOT_EURO_TRANS_ASIA MODIFY HOST_ODDS_ASIA NUMERIC(5,2); 
ALTER TABLE LOT_EURO_TRANS_ASIA MODIFY HANDICAP_ASIA NUMERIC(4,2); 
ALTER TABLE LOT_EURO_TRANS_ASIA MODIFY VISITING_ODDS_ASIA NUMERIC(5,2); 
ALTER TABLE LOT_EURO_TRANS_ASIA MODIFY TOTAL_DISCOUNT NUMERIC(5,2); 
ALTER TABLE LOT_EURO_TRANS_ASIA ADD HOST_KELLY_EURO NUMERIC(4,2);
ALTER TABLE LOT_EURO_TRANS_ASIA ADD EVEN_KELLY_EURO NUMERIC(4,2);
ALTER TABLE LOT_EURO_TRANS_ASIA ADD VISITING_KELLY_EURO NUMERIC(4,2);
ALTER TABLE LOT_EURO_TRANS_ASIA MODIFY ODDS_CORP_NAME VARCHAR(40) NOT NULL;



CREATE UNIQUE INDEX LOT_MATCH_UNQ_IDX1 ON LOT_MATCH(OK_MATCH_ID);
CREATE INDEX LOT_MATCH_IDX1 ON LOT_MATCH(OK_URL_DATE);
CREATE INDEX LOT_ODDS_EURO_CHANGE_IDX1 ON LOT_ODDS_EURO_CHANGE(ODDS_CORP_NAME);
CREATE INDEX LOT_ODDS_EURO_CHANGE_IDX2 ON LOT_ODDS_EURO_CHANGE(ODDS_SEQ);
CREATE INDEX LOT_ODDS_ASIA_CHANGE_IDX1 ON LOT_ODDS_ASIA_CHANGE(ODDS_CORP_NAME);
CREATE INDEX LOT_ODDS_ASIA_CHANGE_IDX2 ON LOT_ODDS_ASIA_CHANGE(ODDS_SEQ);
CREATE UNIQUE INDEX LOT_KELLY_CORP_RESULT_IDX1 ON LOT_KELLY_CORP_RESULT(OK_URL_DATE, MATCH_NAME, ODDS_CORP_NAME, RULE_TYPE);
CREATE UNIQUE INDEX LOT_JOB_IDX1 ON LOT_JOB(OK_URL_DATE, BEGIN_MATCH_SEQ, END_MATCH_SEQ, JOB_TYPE, STATUS);
CREATE UNIQUE INDEX LOT_KELLY_MATCH_COUNT_IDX1 ON LOT_KELLY_MATCH_COUNT(OK_URL_DATE, MATCH_SEQ, JOB_TYPE, RULE_TYPE);


-- 最好使用上面带索引名称的语句;
--ALTER TABLE LOT_MATCH ADD UNIQUE(OK_MATCH_ID);
--ALTER TABLE LOT_ODDS_EURO ADD UNIQUE(OK_MATCH_ID, ODDS_CORP_NAME);
--ALTER TABLE LOT_ODDS_ASIA ADD UNIQUE(OK_MATCH_ID, ODDS_CORP_NAME);
ALTER TABLE LOT_ODDS_EURO_CHANGE ADD UNIQUE(OK_MATCH_ID, ODDS_CORP_NAME, ODDS_SEQ);
ALTER TABLE LOT_ODDS_ASIA_CHANGE ADD UNIQUE(OK_MATCH_ID, ODDS_CORP_NAME, ODDS_SEQ);

-- 将RULE_TYPE修改为区分大小写，加NOT NULL会报错.
alter table LOT_KELLY_MATCH_COUNT change RULE_TYPE RULE_TYPE VARCHAR(2) binary;
