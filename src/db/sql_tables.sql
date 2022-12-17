-- NOTE:
-- This file has been AUTO GENERATED from database/tables_v1.sql
-- All translation identifers "_tr_" have been removed.
-- This file can be used to manually generate a database.

-- Describe ACCOUNTLIST_V1
CREATE TABLE ACCOUNTLIST_V1(
ACCOUNTID integer primary key
, ACCOUNTNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, ACCOUNTTYPE TEXT NOT NULL /* Checking, Term, Investment, Credit Card */
, ACCOUNTNUM TEXT
, STATUS TEXT NOT NULL /* Open, Closed */
, NOTES TEXT
, HELDAT TEXT
, WEBSITE TEXT
, CONTACTINFO TEXT
, ACCESSINFO TEXT
, INITIALBAL numeric
, INITIALDATE TEXT
, FAVORITEACCT TEXT NOT NULL
, CURRENCYID integer NOT NULL
, STATEMENTLOCKED integer
, STATEMENTDATE TEXT
, MINIMUMBALANCE numeric
, CREDITLIMIT numeric
, INTERESTRATE numeric
, PAYMENTDUEDATE text
, MINIMUMPAYMENT numeric
);
CREATE INDEX IDX_ACCOUNTLIST_ACCOUNTTYPE ON ACCOUNTLIST_V1(ACCOUNTTYPE);

-- Describe ASSETS_V1
CREATE TABLE ASSETS_V1(
ASSETID integer primary key
, STARTDATE TEXT NOT NULL
, ASSETNAME TEXT COLLATE NOCASE NOT NULL
, ASSETSTATUS TEXT /* Open, Closed */
, CURRENCYID integer
, VALUECHANGEMODE TEXT /* Percentage, Linear */
, VALUE numeric
, VALUECHANGE TEXT /* None, Appreciates, Depreciates */
, NOTES TEXT
, VALUECHANGERATE numeric
, ASSETTYPE TEXT /* Property, Automobile, Household Object, Art, Jewellery, Cash, Other */
);
CREATE INDEX IDX_ASSETS_ASSETTYPE ON ASSETS_V1(ASSETTYPE);

-- Describe BILLSDEPOSITS_V1
CREATE TABLE BILLSDEPOSITS_V1(
BDID integer primary key
, ACCOUNTID integer NOT NULL
, TOACCOUNTID integer
, PAYEEID integer NOT NULL
, TRANSCODE TEXT NOT NULL /* Withdrawal, Deposit, Transfer */
, TRANSAMOUNT numeric NOT NULL
, STATUS TEXT /* None, Reconciled, Void, Follow up, Duplicate */
, TRANSACTIONNUMBER TEXT
, NOTES TEXT
, CATEGID integer
, TRANSDATE TEXT
, FOLLOWUPID integer
, TOTRANSAMOUNT numeric
, REPEATS integer
, NEXTOCCURRENCEDATE TEXT
, NUMOCCURRENCES integer
);
CREATE INDEX IDX_BILLSDEPOSITS_ACCOUNT ON BILLSDEPOSITS_V1 (ACCOUNTID, TOACCOUNTID);

-- Describe BUDGETSPLITTRANSACTIONS_V1
CREATE TABLE BUDGETSPLITTRANSACTIONS_V1(
SPLITTRANSID integer primary key
, TRANSID integer NOT NULL
, CATEGID integer
, SPLITTRANSAMOUNT numeric
, NOTES TEXT
);
CREATE INDEX IDX_BUDGETSPLITTRANSACTIONS_TRANSID ON BUDGETSPLITTRANSACTIONS_V1(TRANSID);

-- Describe BUDGETTABLE_V1
CREATE TABLE BUDGETTABLE_V1(
BUDGETENTRYID integer primary key
, BUDGETYEARID integer
, CATEGID integer
, PERIOD TEXT NOT NULL /* None, Weekly, Bi-Weekly, Monthly, Monthly, Bi-Monthly, Quarterly, Half-Yearly, Yearly, Daily*/
, AMOUNT numeric NOT NULL
, NOTES TEXT
, ACTIVE integer
);
CREATE INDEX IDX_BUDGETTABLE_BUDGETYEARID ON BUDGETTABLE_V1(BUDGETYEARID);

-- Describe BUDGETYEAR_V1
CREATE TABLE BUDGETYEAR_V1(
BUDGETYEARID integer primary key
, BUDGETYEARNAME TEXT NOT NULL UNIQUE
);
CREATE INDEX IDX_BUDGETYEAR_BUDGETYEARNAME ON BUDGETYEAR_V1(BUDGETYEARNAME);

-- Describe CATEGORY_V1
CREATE TABLE CATEGORY_V1
( CATEGID INTEGER PRIMARY KEY,
  CATEGNAME TEXT NOT NULL COLLATE NOCASE,
  ACTIVE INTEGER,
  PARENTID INTEGER,
  UNIQUE(CATEGNAME, PARENTID)
);
CREATE INDEX IDX_CATEGORY_CATEGNAME ON CATEGORY_V1(CATEGNAME);
CREATE INDEX IDX_CATEGORY_CATEGNAME_PARENTID ON CATEGORY_V1(CATEGNAME, PARENTID);

-- Note: All strings requiring translation are prefix by: ''
-- The  prefix is removed when generating .h files by sqlite2cpp.py
-- strings containing unicode should not be translated.
INSERT INTO CATEGORY_V1 VALUES(1,'Bills',1,-1);
INSERT INTO CATEGORY_V1 VALUES(2,'Telephone',1,1);
INSERT INTO CATEGORY_V1 VALUES(3,'Electricity',1,1);
INSERT INTO CATEGORY_V1 VALUES(4,'Gas',1,1);
INSERT INTO CATEGORY_V1 VALUES(5,'Internet',1,1);
INSERT INTO CATEGORY_V1 VALUES(6,'Rent',1,1);
INSERT INTO CATEGORY_V1 VALUES(7,'Cable TV',1,1);
INSERT INTO CATEGORY_V1 VALUES(8,'Water',1,1);
INSERT INTO CATEGORY_V1 VALUES(9,'Food',1,-1);
INSERT INTO CATEGORY_V1 VALUES(10,'Groceries',1,9);
INSERT INTO CATEGORY_V1 VALUES(11,'Dining out',1,9);
INSERT INTO CATEGORY_V1 VALUES(12,'Leisure',1,-1);
INSERT INTO CATEGORY_V1 VALUES(13,'Movies',1,12);
INSERT INTO CATEGORY_V1 VALUES(14,'Video Rental',1,12);
INSERT INTO CATEGORY_V1 VALUES(15,'Magazines',1,12);
INSERT INTO CATEGORY_V1 VALUES(16,'Automobile',1,-1);
INSERT INTO CATEGORY_V1 VALUES(17,'Maintenance',1,16);
INSERT INTO CATEGORY_V1 VALUES(18,'Gas',1,16);
INSERT INTO CATEGORY_V1 VALUES(19,'Parking',1,16);
INSERT INTO CATEGORY_V1 VALUES(20,'Registration',1,16);
INSERT INTO CATEGORY_V1 VALUES(21,'Education',1,-1);
INSERT INTO CATEGORY_V1 VALUES(22,'Books',1,21);
INSERT INTO CATEGORY_V1 VALUES(23,'Tuition',1,21);
INSERT INTO CATEGORY_V1 VALUES(24,'Others',1,21);
INSERT INTO CATEGORY_V1 VALUES(25,'Homeneeds',1,-1);
INSERT INTO CATEGORY_V1 VALUES(26,'Clothing',1,25);
INSERT INTO CATEGORY_V1 VALUES(27,'Furnishing',1,25);
INSERT INTO CATEGORY_V1 VALUES(28,'Others',1,25);
INSERT INTO CATEGORY_V1 VALUES(29,'Healthcare',1,-1);
INSERT INTO CATEGORY_V1 VALUES(30,'Health',1,29);
INSERT INTO CATEGORY_V1 VALUES(31,'Dental',1,29);
INSERT INTO CATEGORY_V1 VALUES(32,'Eyecare',1,29);
INSERT INTO CATEGORY_V1 VALUES(33,'Physician',1,29);
INSERT INTO CATEGORY_V1 VALUES(34,'Prescriptions',1,29);
INSERT INTO CATEGORY_V1 VALUES(35,'Insurance',1,-1);
INSERT INTO CATEGORY_V1 VALUES(36,'Auto',1,35);
INSERT INTO CATEGORY_V1 VALUES(37,'Life',1,35);
INSERT INTO CATEGORY_V1 VALUES(38,'Home',1,35);
INSERT INTO CATEGORY_V1 VALUES(39,'Health',1,35);
INSERT INTO CATEGORY_V1 VALUES(40,'Vacation',1,-1);
INSERT INTO CATEGORY_V1 VALUES(41,'Travel',1,40);
INSERT INTO CATEGORY_V1 VALUES(42,'Lodging',1,40);
INSERT INTO CATEGORY_V1 VALUES(43,'Sightseeing',1,40);
INSERT INTO CATEGORY_V1 VALUES(44,'Taxes',1,-1);
INSERT INTO CATEGORY_V1 VALUES(45,'Income Tax',1,44);
INSERT INTO CATEGORY_V1 VALUES(46,'House Tax',1,44);
INSERT INTO CATEGORY_V1 VALUES(47,'Water Tax',1,44);
INSERT INTO CATEGORY_V1 VALUES(48,'Others',1,44);
INSERT INTO CATEGORY_V1 VALUES(49,'Miscellaneous',1,-1);
INSERT INTO CATEGORY_V1 VALUES(50,'Gifts',1,-1);
INSERT INTO CATEGORY_V1 VALUES(51,'Income',1,-1);
INSERT INTO CATEGORY_V1 VALUES(52,'Salary',1,51);
INSERT INTO CATEGORY_V1 VALUES(53,'Reimbursement/Refunds',1,51);
INSERT INTO CATEGORY_V1 VALUES(54,'Investment Income',1,51);
INSERT INTO CATEGORY_V1 VALUES(55,'Other Income',1,-1);
INSERT INTO CATEGORY_V1 VALUES(56,'Other Expenses',1,-1);
INSERT INTO CATEGORY_V1 VALUES(57,'Transfer',1,-1);

-- Describe CHECKINGACCOUNT_V1
CREATE TABLE CHECKINGACCOUNT_V1(
TRANSID integer primary key
, ACCOUNTID integer NOT NULL
, TOACCOUNTID integer
, PAYEEID integer NOT NULL
, TRANSCODE TEXT NOT NULL /* Withdrawal, Deposit, Transfer */
, TRANSAMOUNT numeric NOT NULL
, STATUS TEXT /* None, Reconciled, Void, Follow up, Duplicate */
, TRANSACTIONNUMBER TEXT
, NOTES TEXT
, CATEGID integer
, TRANSDATE TEXT
, LASTUPDATEDTIME TEXT
, DELETEDTIME TEXT
, FOLLOWUPID integer
, TOTRANSAMOUNT numeric
);
CREATE INDEX IDX_CHECKINGACCOUNT_ACCOUNT ON CHECKINGACCOUNT_V1 (ACCOUNTID, TOACCOUNTID);
CREATE INDEX IDX_CHECKINGACCOUNT_TRANSDATE ON CHECKINGACCOUNT_V1 (TRANSDATE);

-- Describe CURRENCYHISTORY_V1
CREATE TABLE CURRENCYHISTORY_V1(
CURRHISTID INTEGER PRIMARY KEY
, CURRENCYID INTEGER NOT NULL
, CURRDATE TEXT NOT NULL
, CURRVALUE NUMERIC NOT NULL
, CURRUPDTYPE INTEGER
, UNIQUE(CURRENCYID, CURRDATE)
);
CREATE INDEX IDX_CURRENCYHISTORY_CURRENCYID_CURRDATE ON CURRENCYHISTORY_V1(CURRENCYID, CURRDATE);

-- Describe CURRENCYFORMATS_V1
CREATE TABLE CURRENCYFORMATS_V1(
CURRENCYID integer primary key
, CURRENCYNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, PFX_SYMBOL TEXT
, SFX_SYMBOL TEXT
, DECIMAL_POINT TEXT
, GROUP_SEPARATOR TEXT
, UNIT_NAME TEXT COLLATE NOCASE
, CENT_NAME TEXT COLLATE NOCASE
, SCALE integer
, BASECONVRATE numeric
, CURRENCY_SYMBOL TEXT COLLATE NOCASE NOT NULL UNIQUE
, CURRENCY_TYPE TEXT NOT NULL /* Fiat, Crypto */
);
CREATE INDEX IDX_CURRENCYFORMATS_SYMBOL ON CURRENCYFORMATS_V1(CURRENCY_SYMBOL);

-- Note: All strings requiring translation are prefix by: ''
-- The  prefix is removed when generating .h files by sqlite2cpp.py
-- strings containing unicode should not be translated.
INSERT INTO CURRENCYFORMATS_V1 VALUES(1,'United States dollar','$','','.',' ','','',100,1,'USD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(2,'European euro','€','','.',' ','','',100,1,'EUR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(3,'UK Pound','£','','.',' ','Pound','Pence',100,1,'GBP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(4,'Russian Ruble','','р',',',' ','руб.','коп.',100,1,'RUB','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(5,'Ukrainian hryvnia','₴','',',',' ','','',100,1,'UAH','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(6,'Afghan afghani','؋','','.',' ','','pul',100,1,'AFN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(7,'Albanian lek','','L','.',' ','','',1,1,'ALL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(8,'Algerian dinar','دج','','.',' ','','',100,1,'DZD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(9,'Angolan kwanza','','Kz','.',' ','','Céntimo',100,1,'AOA','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(10,'East Caribbean dollar','EC$','','.',' ','','',100,1,'XCD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(11,'Argentine peso','AR$','',',','.','','centavo',100,1,'ARS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(12,'Armenian dram','','','.',' ','','',1,1,'AMD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(13,'Aruban florin','ƒ','','.',' ','','',100,1,'AWG','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(14,'Australian dollar','$','','.',',','','',100,1,'AUD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(15,'Azerbaijani manat','','','.',' ','','',100,1,'AZN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(16,'Bahamian dollar','B$','','.',' ','','',100,1,'BSD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(17,'Bahraini dinar','','','.',' ','','',100,1,'BHD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(18,'Bangladeshi taka','','','.',' ','','',100,1,'BDT','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(19,'Barbadian dollar','Bds$','','.',' ','','',100,1,'BBD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(20,'Belarusian ruble','Br','',',',' ','','',1,1,'BYR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(21,'Belize dollar','BZ$','','.',' ','','',100,1,'BZD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(22,'West African CFA franc','CFA','','.',' ','','',100,1,'XOF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(23,'Bermudian dollar','BD$','','.',' ','','',100,1,'BMD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(24,'Bhutanese ngultrum','Nu.','','.',' ','','',100,1,'BTN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(25,'Bolivian boliviano','Bs.','','.',' ','','',100,1,'BOB','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(26,'Bosnia and Herzegovina konvertibilna marka','KM','',',','.','','',100,1,'BAM','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(27,'Botswana pula','P','','.',' ','','',100,1,'BWP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(28,'Brazilian real','R$','','.',' ','','',100,1,'BRL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(29,'Brunei dollar','B$','','.',' ','','',100,1,'BND','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(30,'Bulgarian lev','','','.',' ','','',100,1,'BGN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(31,'Burundi franc','FBu','','.',' ','','',1,1,'BIF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(32,'Cambodian riel','','','.',' ','','',100,1,'KHR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(33,'Central African CFA franc','CFA','','.',' ','','',1,1,'XAF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(34,'Canadian dollar','$','','.',' ','','',100,1,'CAD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(35,'Cape Verdean escudo','Esc','','.',' ','','',100,1,'CVE','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(36,'Cayman Islands dollar','KY$','','.',' ','','',100,1,'KYD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(37,'Chilean peso','$','','.',' ','','',1,1,'CLP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(38,'Chinese renminbi','¥','','.',' ','','',100,1,'CNY','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(39,'Colombian peso','Col$','','.',' ','','',100,1,'COP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(40,'Comorian franc','','','.',' ','','',1,1,'KMF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(41,'Congolese franc','F','','.',' ','','',100,1,'CDF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(42,'Costa Rican colon','₡','','.',' ','','',1,1,'CRC','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(43,'Croatian kuna','kn','','.',' ','','',100,1,'HRK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(44,'Czech koruna','Kč','','.',' ','','',100,1,'CZK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(45,'Danish krone','Kr','','.',' ','','',100,1,'DKK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(46,'Djiboutian franc','Fdj','','.',' ','','',1,1,'DJF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(47,'Dominican peso','RD$','','.',' ','','',100,1,'DOP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(48,'Egyptian pound','£','','.',' ','','',100,1,'EGP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(49,'Eritrean nakfa','Nfa','','.',' ','','',100,1,'ERN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(50,'Ethiopian birr','Br','','.',' ','','',100,1,'ETB','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(51,'Falkland Islands pound','£','','.',' ','','',100,1,'FKP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(52,'Fijian dollar','FJ$','','.',' ','','',100,1,'FJD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(53,'CFP franc','F','','.',' ','','',100,1,'XPF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(54,'Gambian dalasi','D','','.',' ','','',100,1,'GMD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(55,'Georgian lari','','','.',' ','','',100,1,'GEL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(56,'Ghanaian cedi','','','.',' ','','',100,1,'GHS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(57,'Gibraltar pound','£','','.',' ','','',100,1,'GIP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(58,'Guatemalan quetzal','Q','','.',' ','','',100,1,'GTQ','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(59,'Guinean franc','FG','','.',' ','','',1,1,'GNF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(60,'Guyanese dollar','GY$','','.',' ','','',100,1,'GYD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(61,'Haitian gourde','G','','.',' ','','',100,1,'HTG','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(62,'Honduran lempira','L','','.',' ','','',100,1,'HNL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(63,'Hong Kong dollar','HK$','','.',' ','','',100,1,'HKD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(64,'Hungarian forint','Ft','','.',' ','','',1,1,'HUF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(65,'Icelandic króna','kr','','.',' ','','',1,1,'ISK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(66,'Indian rupee','₹','','.',' ','','',100,1,'INR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(67,'Indonesian rupiah','Rp','','.',' ','','',1,1,'IDR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(68,'Special Drawing Rights','SDR','','.',' ','','',100,1,'XDR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(69,'Iranian rial','','','.',' ','','',1,1,'IRR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(70,'Iraqi dinar','','','.',' ','','',1,1,'IQD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(71,'Israeli new shekel','₪','','.',' ','','',100,1,'ILS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(72,'Jamaican dollar','J$','','.',' ','','',100,1,'JMD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(73,'Japanese yen','¥','','.',' ','','',1,1,'JPY','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(74,'Jordanian dinar','','','.',' ','','',100,1,'JOD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(75,'Kazakhstani tenge','T','','.',' ','','',100,1,'KZT','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(76,'Kenyan shilling','KSh','','.',' ','','',100,1,'KES','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(77,'North Korean won','W','','.',' ','','',100,1,'KPW','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(78,'South Korean won','W','','.',' ','','',1,1,'KRW','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(79,'Kuwaiti dinar','','','.',' ','','',100,1,'KWD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(80,'Kyrgyzstani som','','','.',' ','','',100,1,'KGS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(81,'Lao kip','KN','','.',' ','','',100,1,'LAK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(82,'Latvian lats','Ls','','.',' ','','',100,1,'LVL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(83,'Lebanese lira','','','.',' ','','',1,1,'LBP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(84,'Lesotho loti','M','','.',' ','','',100,1,'LSL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(85,'Liberian dollar','L$','','.',' ','','',100,1,'LRD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(86,'Libyan dinar','LD','','.',' ','','',100,1,'LYD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(87,'Lithuanian litas','Lt','','.',' ','','',100,1,'LTL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(88,'Macanese pataca','P','','.',' ','','',100,1,'MOP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(89,'Macedonian denar','','','.',' ','','',100,1,'MKD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(90,'Malagasy ariary','FMG','','.',' ','','',100,1,'MGA','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(91,'Malawian kwacha','MK','','.',' ','','',1,1,'MWK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(92,'Malaysian ringgit','RM','','.',' ','','',100,1,'MYR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(93,'Maldivian rufiyaa','Rf','','.',' ','','',100,1,'MVR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(94,'Mauritanian ouguiya','UM','','.',' ','','',100,1,'MRO','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(95,'Mauritian rupee','Rs','','.',' ','','',1,1,'MUR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(96,'Mexican peso','$','','.',' ','','',100,1,'MXN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(97,'Moldovan leu','','','.',' ','','',100,1,'MDL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(98,'Mongolian tugrik','₮','','.',' ','','',100,1,'MNT','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(99,'Moroccan dirham','','','.',' ','','',100,1,'MAD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(100,'Myanma kyat','K','','.',' ','','',1,1,'MMK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(101,'Namibian dollar','N$','','.',' ','','',100,1,'NAD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(102,'Nepalese rupee','NRs','','.',' ','','',100,1,'NPR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(103,'Netherlands Antillean gulden','NAƒ','','.',' ','','',100,1,'ANG','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(104,'New Zealand dollar','NZ$','','.',' ','','',100,1,'NZD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(105,'Nicaraguan córdoba','C$','','.',' ','','',100,1,'NIO','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(106,'Nigerian naira','₦','','.',' ','','',100,1,'NGN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(107,'Norwegian krone','kr','','.',' ','','',100,1,'NOK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(108,'Omani rial','','','.',' ','','',100,1,'OMR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(109,'Pakistani rupee','Rs.','','.',' ','','',1,1,'PKR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(110,'Panamanian balboa','B./','','.',' ','','',100,1,'PAB','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(111,'Papua New Guinean kina','K','','.',' ','','',100,1,'PGK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(112,'Paraguayan guarani','','','.',' ','','',1,1,'PYG','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(113,'Peruvian nuevo sol','S/.','','.',' ','','',100,1,'PEN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(114,'Philippine peso','₱','','.',' ','','',100,1,'PHP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(115,'Polish zloty','','zł',',','.','złoty','grosz',100,1,'PLN','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(116,'Qatari riyal','QR','','.',' ','','',100,1,'QAR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(117,'Romanian leu','L','','.',' ','','',100,1,'RON','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(118,'Rwandan franc','RF','','.',' ','','',1,1,'RWF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(119,'São Tomé and Príncipe dobra','Db','','.',' ','','',100,1,'STD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(120,'Saudi riyal','SR','','.',' ','','',100,1,'SAR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(121,'Serbian dinar','din.','','.',' ','','',1,1,'RSD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(122,'Seychellois rupee','SR','','.',' ','','',100,1,'SCR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(123,'Sierra Leonean leone','Le','','.',' ','','',100,1,'SLL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(124,'Singapore dollar','S$','','.',' ','','',100,1,'SGD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(125,'Solomon Islands dollar','SI$','','.',' ','','',100,1,'SBD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(126,'Somali shilling','Sh.','','.',' ','','',1,1,'SOS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(127,'South African rand','R','','.',' ','','',100,1,'ZAR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(128,'Sri Lankan rupee','Rs','','.',' ','','',100,1,'LKR','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(129,'Saint Helena pound','£','','.',' ','','',100,1,'SHP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(130,'Sudanese pound','','','.',' ','','',100,1,'SDG','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(131,'Surinamese dollar','$','','.',' ','','',100,1,'SRD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(132,'Swazi lilangeni','E','','.',' ','','',100,1,'SZL','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(133,'Swedish krona','kr','','.',' ','','',100,1,'SEK','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(134,'Swiss franc','Fr.','','.',' ','','',100,1,'CHF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(135,'Syrian pound','','','.',' ','','',1,1,'SYP','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(136,'New Taiwan dollar','NT$','','.',' ','','',100,1,'TWD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(137,'Tajikistani somoni','','','.',' ','','',100,1,'TJS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(138,'Tanzanian shilling','','','.',' ','','',1,1,'TZS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(139,'Thai baht','฿','','.',' ','','',100,1,'THB','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(140,'Trinidad and Tobago dollar','TT$','','.',' ','','',100,1,'TTD','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(141,'Tunisian dinar','DT','','.',' ','','',100,1,'TND','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(142,'Turkish lira','₺','','.',' ','','',100,1,'TRY','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(143,'Turkmen manat','m','','.',' ','','',100,1,'TMT','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(144,'Ugandan shilling','USh','','.',' ','','',1,1,'UGX','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(145,'UAE dirham','','','.',' ','','',100,1,'AED','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(146,'Uruguayan peso','$U','','.',' ','','',100,1,'UYU','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(147,'Uzbekistani som','','','.',' ','','',1,1,'UZS','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(148,'Vanuatu vatu','VT','','.',' ','','',100,1,'VUV','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(149,'Vietnamese dong','₫','','.',' ','','',1,1,'VND','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(150,'Samoan tala','WS$','','.',' ','','',100,1,'WST','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(151,'Yemeni rial','','','.',' ','','',1,1,'YER','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(152,'Venezuelan Bolívar','Bs.','','.',',','bolívar','céntimos',100,1,'VEF','Fiat');
INSERT INTO CURRENCYFORMATS_V1 VALUES(153,'Bitcoin','Ƀ','','.',',','','',100000000,1,'BTC','Crypto');

-- Describe INFOTABLE_V1
CREATE TABLE INFOTABLE_V1(
INFOID integer not null primary key
, INFONAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, INFOVALUE TEXT NOT NULL
);
CREATE INDEX IDX_INFOTABLE_INFONAME ON INFOTABLE_V1(INFONAME);

INSERT INTO INFOTABLE_V1 VALUES(1, 'DATAVERSION', '3');

-- Describe PAYEE_V1
CREATE TABLE PAYEE_V1(
PAYEEID integer primary key
, PAYEENAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, CATEGID integer
, NUMBER TEXT
, WEBSITE TEXT
, NOTES TEXT
, ACTIVE integer
);
CREATE INDEX IDX_PAYEE_INFONAME ON PAYEE_V1(PAYEENAME);

-- Describe SPLITTRANSACTIONS_V1
CREATE TABLE SPLITTRANSACTIONS_V1(
SPLITTRANSID integer primary key
, TRANSID integer NOT NULL
, CATEGID integer
, SPLITTRANSAMOUNT numeric
, NOTES TEXT
);
CREATE INDEX IDX_SPLITTRANSACTIONS_TRANSID ON SPLITTRANSACTIONS_V1(TRANSID);

-- Describe STOCK_V1
CREATE TABLE STOCK_V1(
STOCKID integer primary key
, HELDAT integer
, PURCHASEDATE TEXT NOT NULL
, STOCKNAME TEXT COLLATE NOCASE NOT NULL
, SYMBOL TEXT
, NUMSHARES numeric
, PURCHASEPRICE numeric NOT NULL
, NOTES TEXT
, CURRENTPRICE numeric NOT NULL
, VALUE numeric
, COMMISSION numeric
);
CREATE INDEX IDX_STOCK_HELDAT ON STOCK_V1(HELDAT);

-- Describe STOCKHISTORY_V1
CREATE TABLE STOCKHISTORY_V1(
HISTID integer primary key
, SYMBOL TEXT NOT NULL
, DATE TEXT NOT NULL
, VALUE numeric NOT NULL
, UPDTYPE integer
, UNIQUE(SYMBOL, DATE)
);
CREATE INDEX IDX_STOCKHISTORY_SYMBOL ON STOCKHISTORY_V1(SYMBOL);

-- Describe SETTING_V1
create table SETTING_V1(
SETTINGID integer not null primary key
, SETTINGNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, SETTINGVALUE TEXT
);
CREATE INDEX IDX_SETTING_SETTINGNAME ON SETTING_V1(SETTINGNAME);

-- Describe REPORT_V1
create table REPORT_V1(
REPORTID integer not null primary key
, REPORTNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, GROUPNAME TEXT COLLATE NOCASE
, ACTIVE integer
, SQLCONTENT TEXT
, LUACONTENT TEXT
, TEMPLATECONTENT TEXT
, DESCRIPTION TEXT
);
CREATE INDEX INDEX_REPORT_NAME ON REPORT_V1(REPORTNAME);

-- Describe ATTACHMENT_V1
CREATE TABLE ATTACHMENT_V1 (
ATTACHMENTID INTEGER NOT NULL PRIMARY KEY
, REFTYPE TEXT NOT NULL /* Transaction, Stock, Asset, Bank Account, Repeating Transaction, Payee */
, REFID INTEGER NOT NULL
, DESCRIPTION TEXT COLLATE NOCASE
, FILENAME TEXT NOT NULL COLLATE NOCASE
);
CREATE INDEX IDX_ATTACHMENT_REF ON ATTACHMENT_V1 (REFTYPE, REFID);

-- Describe USAGE_V1
CREATE TABLE USAGE_V1 (
USAGEID INTEGER NOT NULL PRIMARY KEY
, USAGEDATE TEXT NOT NULL
, JSONCONTENT TEXT NOT NULL
);
CREATE INDEX IDX_USAGE_DATE ON USAGE_V1 (USAGEDATE);

-- Describe CUSTOMFIELD_V1
CREATE TABLE CUSTOMFIELD_V1 (
FIELDID INTEGER NOT NULL PRIMARY KEY
, REFTYPE TEXT NOT NULL /* Transaction, Stock, Asset, Bank Account, Repeating Transaction, Payee */
, DESCRIPTION TEXT COLLATE NOCASE
, TYPE TEXT NOT NULL /* String, Integer, Decimal, Boolean, Date, Time, SingleChoice, MultiChoice */
, PROPERTIES TEXT NOT NULL
);
CREATE INDEX IDX_CUSTOMFIELD_REF ON CUSTOMFIELD_V1 (REFTYPE);

-- Describe CUSTOMFIELDDATA_V1
CREATE TABLE CUSTOMFIELDDATA_V1 (
FIELDATADID INTEGER NOT NULL PRIMARY KEY
, FIELDID INTEGER NOT NULL
, REFID INTEGER NOT NULL
, CONTENT TEXT
, UNIQUE(FIELDID, REFID)
);
CREATE INDEX IDX_CUSTOMFIELDDATA_REF ON CUSTOMFIELDDATA_V1 (FIELDID, REFID);

-- describe TRANSACTIONLINK_V1
CREATE TABLE TRANSLINK_V1 (
TRANSLINKID  integer NOT NULL primary key
, CHECKINGACCOUNTID integer NOT NULL
, LINKTYPE TEXT NOT NULL /* Asset, Stock */
, LINKRECORDID integer NOT NULL
);
CREATE INDEX IDX_LINKRECORD ON TRANSLINK_V1 (LINKTYPE, LINKRECORDID);
CREATE INDEX IDX_CHECKINGACCOUNT ON TRANSLINK_V1 (CHECKINGACCOUNTID);

-- describe SHAREINFO_V1
CREATE TABLE SHAREINFO_V1 (
SHAREINFOID integer NOT NULL primary key
, CHECKINGACCOUNTID integer NOT NULL
, SHARENUMBER numeric
, SHAREPRICE numeric
, SHARECOMMISSION numeric
, SHARELOT TEXT
);
CREATE INDEX IDX_SHAREINFO ON SHAREINFO_V1 (CHECKINGACCOUNTID);
