-- Version: 2022.2 2022.2.0.10

library ieee;
use ieee.std_logic_1164.all;
library polarfire;
use polarfire.all;

entity COREFIFO_C0_COREFIFO_C0_0_LSRAM_top is

    port( W_DATA : in    std_logic_vector(13 downto 0);
          R_DATA : out   std_logic_vector(13 downto 0);
          W_ADDR : in    std_logic_vector(15 downto 0);
          R_ADDR : in    std_logic_vector(15 downto 0);
          W_EN   : in    std_logic;
          R_EN   : in    std_logic;
          W_CLK  : in    std_logic;
          R_CLK  : in    std_logic
        );

end COREFIFO_C0_COREFIFO_C0_0_LSRAM_top;

architecture DEF_ARCH of COREFIFO_C0_COREFIFO_C0_0_LSRAM_top is 

  component RAM1K20
    generic (MEMORYFILE:string := ""; RAMINDEX:string := ""; 
        INIT0:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT1:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT2:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT3:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT4:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT5:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT6:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT7:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT8:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT9:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT10:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT11:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT12:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT13:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT14:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT15:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT16:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT17:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT18:std_logic_vector(1023 downto 0) := (others => 'X'); 
        INIT19:std_logic_vector(1023 downto 0) := (others => 'X')
        );

    port( A_DOUT        : out   std_logic_vector(19 downto 0);
          B_DOUT        : out   std_logic_vector(19 downto 0);
          DB_DETECT     : out   std_logic;
          SB_CORRECT    : out   std_logic;
          ACCESS_BUSY   : out   std_logic;
          A_ADDR        : in    std_logic_vector(13 downto 0) := (others => 'U');
          A_BLK_EN      : in    std_logic_vector(2 downto 0) := (others => 'U');
          A_CLK         : in    std_logic := 'U';
          A_DIN         : in    std_logic_vector(19 downto 0) := (others => 'U');
          A_REN         : in    std_logic := 'U';
          A_WEN         : in    std_logic_vector(1 downto 0) := (others => 'U');
          A_DOUT_EN     : in    std_logic := 'U';
          A_DOUT_ARST_N : in    std_logic := 'U';
          A_DOUT_SRST_N : in    std_logic := 'U';
          B_ADDR        : in    std_logic_vector(13 downto 0) := (others => 'U');
          B_BLK_EN      : in    std_logic_vector(2 downto 0) := (others => 'U');
          B_CLK         : in    std_logic := 'U';
          B_DIN         : in    std_logic_vector(19 downto 0) := (others => 'U');
          B_REN         : in    std_logic := 'U';
          B_WEN         : in    std_logic_vector(1 downto 0) := (others => 'U');
          B_DOUT_EN     : in    std_logic := 'U';
          B_DOUT_ARST_N : in    std_logic := 'U';
          B_DOUT_SRST_N : in    std_logic := 'U';
          ECC_EN        : in    std_logic := 'U';
          BUSY_FB       : in    std_logic := 'U';
          A_WIDTH       : in    std_logic_vector(2 downto 0) := (others => 'U');
          A_WMODE       : in    std_logic_vector(1 downto 0) := (others => 'U');
          A_BYPASS      : in    std_logic := 'U';
          B_WIDTH       : in    std_logic_vector(2 downto 0) := (others => 'U');
          B_WMODE       : in    std_logic_vector(1 downto 0) := (others => 'U');
          B_BYPASS      : in    std_logic := 'U';
          ECC_BYPASS    : in    std_logic := 'U'
        );
  end component;

  component INV
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
  end component;

    signal \R_DATA_TEMPR0[0]\, \R_DATA_TEMPR1[0]\, 
        \R_DATA_TEMPR2[0]\, \R_DATA_TEMPR0[1]\, 
        \R_DATA_TEMPR1[1]\, \R_DATA_TEMPR2[1]\, 
        \R_DATA_TEMPR0[2]\, \R_DATA_TEMPR1[2]\, 
        \R_DATA_TEMPR2[2]\, \R_DATA_TEMPR0[3]\, 
        \R_DATA_TEMPR1[3]\, \R_DATA_TEMPR2[3]\, 
        \R_DATA_TEMPR0[4]\, \R_DATA_TEMPR1[4]\, 
        \R_DATA_TEMPR2[4]\, \R_DATA_TEMPR0[5]\, 
        \R_DATA_TEMPR1[5]\, \R_DATA_TEMPR2[5]\, 
        \R_DATA_TEMPR0[6]\, \R_DATA_TEMPR1[6]\, 
        \R_DATA_TEMPR2[6]\, \R_DATA_TEMPR0[7]\, 
        \R_DATA_TEMPR1[7]\, \R_DATA_TEMPR2[7]\, 
        \R_DATA_TEMPR0[8]\, \R_DATA_TEMPR1[8]\, 
        \R_DATA_TEMPR2[8]\, \R_DATA_TEMPR0[9]\, 
        \R_DATA_TEMPR1[9]\, \R_DATA_TEMPR2[9]\, 
        \R_DATA_TEMPR0[10]\, \R_DATA_TEMPR1[10]\, 
        \R_DATA_TEMPR2[10]\, \R_DATA_TEMPR0[11]\, 
        \R_DATA_TEMPR1[11]\, \R_DATA_TEMPR2[11]\, 
        \R_DATA_TEMPR0[12]\, \R_DATA_TEMPR1[12]\, 
        \R_DATA_TEMPR2[12]\, \R_DATA_TEMPR0[13]\, 
        \R_DATA_TEMPR1[13]\, \R_DATA_TEMPR2[13]\, \BLKX0[0]\, 
        \BLKY0[0]\, \BLKX1[0]\, \BLKY1[0]\, \ACCESS_BUSY[0][0]\, 
        \ACCESS_BUSY[0][1]\, \ACCESS_BUSY[0][2]\, 
        \ACCESS_BUSY[0][3]\, \ACCESS_BUSY[0][4]\, 
        \ACCESS_BUSY[0][5]\, \ACCESS_BUSY[0][6]\, 
        \ACCESS_BUSY[0][7]\, \ACCESS_BUSY[0][8]\, 
        \ACCESS_BUSY[0][9]\, \ACCESS_BUSY[0][10]\, 
        \ACCESS_BUSY[0][11]\, \ACCESS_BUSY[0][12]\, 
        \ACCESS_BUSY[0][13]\, \ACCESS_BUSY[1][0]\, 
        \ACCESS_BUSY[1][1]\, \ACCESS_BUSY[1][2]\, 
        \ACCESS_BUSY[1][3]\, \ACCESS_BUSY[1][4]\, 
        \ACCESS_BUSY[1][5]\, \ACCESS_BUSY[1][6]\, 
        \ACCESS_BUSY[1][7]\, \ACCESS_BUSY[1][8]\, 
        \ACCESS_BUSY[1][9]\, \ACCESS_BUSY[1][10]\, 
        \ACCESS_BUSY[1][11]\, \ACCESS_BUSY[1][12]\, 
        \ACCESS_BUSY[1][13]\, \ACCESS_BUSY[2][0]\, 
        \ACCESS_BUSY[2][1]\, \ACCESS_BUSY[2][2]\, 
        \ACCESS_BUSY[2][3]\, \ACCESS_BUSY[2][4]\, 
        \ACCESS_BUSY[2][5]\, \ACCESS_BUSY[2][6]\, 
        \ACCESS_BUSY[2][7]\, \ACCESS_BUSY[2][8]\, 
        \ACCESS_BUSY[2][9]\, \ACCESS_BUSY[2][10]\, 
        \ACCESS_BUSY[2][11]\, \ACCESS_BUSY[2][12]\, 
        \ACCESS_BUSY[2][13]\, \VCC\, \GND\, ADLIB_VCC
         : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;
    signal nc1395, nc1168, nc783, nc488, nc74, nc1615, nc54, 
        nc302, nc406, nc1104, nc1418, nc1624, nc1514, nc312, 
        nc416, nc1478, nc1574, nc461, nc860, nc1350, nc599, nc309, 
        nc1583, nc1316, nc863, nc1425, nc1376, nc1307, nc1421, 
        nc753, nc458, nc1339, nc845, nc32, nc1195, nc1088, nc745, 
        nc402, nc978, nc319, nc907, nc228, nc325, nc1567, nc934, 
        nc8, nc1101, nc148, nc327, nc1610, nc1228, nc1061, nc346, 
        nc412, nc917, nc98, nc771, nc867, nc60, nc737, nc196, 
        nc224, nc649, nc29, nc898, nc601, nc993, nc1549, nc677, 
        nc769, nc102, nc120, nc61, nc1082, nc611, nc525, nc1084, 
        nc1006, nc95, nc1188, nc328, nc273, nc946, nc374, nc580, 
        nc112, nc1398, nc792, nc921, nc866, nc1634, nc1226, nc10, 
        nc42, nc341, nc602, nc79, nc231, nc135, nc59, nc1435, 
        nc920, nc869, nc1311, nc1556, nc1371, nc1431, nc1249, 
        nc11, nc734, nc444, nc330, nc550, nc612, nc562, nc1587, 
        nc427, nc1410, nc1364, nc1300, nc1470, nc1238, nc1542, 
        nc579, nc1548, nc1081, nc895, nc1355, nc588, nc795, nc86, 
        nc1193, nc604, nc460, nc1112, nc1172, nc198, nc1510, 
        nc322, nc426, nc1449, nc1570, nc1392, nc1069, nc441, 
        nc840, nc280, nc1093, nc396, nc103, nc1124, nc614, nc843, 
        nc1015, nc1075, nc1290, nc1146, nc586, nc329, nc1541, 
        nc1462, nc699, nc558, nc113, nc1155, nc176, nc33, nc1327, 
        nc27, nc878, nc973, nc238, nc335, nc1291, nc1236, nc383, 
        nc485, nc1446, nc422, nc927, nc250, nc683, nc1121, nc1010, 
        nc337, nc1149, nc1070, nc703, nc408, nc847, nc567, nc996, 
        nc1515, nc1295, nc1575, nc556, nc772, nc234, nc1197, 
        nc713, nc418, nc749, nc884, nc391, nc62, nc1190, nc353, 
        nc455, nc621, nc1468, nc788, nc1564, nc1384, nc130, nc653, 
        nc77, nc57, nc1506, nc535, nc1366, nc760, nc122, nc494, 
        nc583, nc846, nc338, nc1242, nc1358, nc1026, nc931, 
        nc1609, nc1089, nc854, nc1134, nc1097, nc849, nc90, nc169, 
        nc1343, nc43, nc758, nc1305, nc12, nc930, nc875, nc766, 
        nc775, nc622, nc542, nc1482, nc1293, nc685, nc553, nc1337, 
        nc491, nc91, nc890, nc178, nc893, nc1497, nc581, nc376, 
        nc437, nc1131, nc1444, nc84, nc1297, nc440, nc1320, nc500, 
        nc679, nc1153, nc1105, nc1443, nc1294, nc655, nc624, 
        nc332, nc436, nc1352, nc1053, nc510, nc184, nc897, nc551, 
        nc1488, nc1584, nc483, nc1250, nc688, nc1519, nc123, 
        nc1579, nc976, nc1361, nc1386, nc339, nc799, nc1036, 
        nc584, nc964, nc286, nc1251, nc371, nc432, nc287, nc937, 
        nc547, nc1460, nc154, nc508, nc896, nc453, nc686, nc658, 
        nc474, nc767, nc723, nc428, nc1255, nc1308, nc1162, nc554, 
        nc200, nc1157, nc256, nc518, nc1560, nc899, nc3, nc1219, 
        nc680, nc489, nc63, nc1279, nc1150, nc631, nc257, nc740, 
        nc1593, nc1065, nc1330, nc506, nc210, nc592, nc1349, 
        nc132, nc656, nc1526, nc1512, nc1098, nc1518, nc471, 
        nc1572, nc870, nc303, nc405, nc1578, nc516, nc873, nc149, 
        nc603, nc1057, nc650, nc89, nc459, nc490, nc261, nc1629, 
        nc165, nc1603, nc746, nc1419, nc1060, nc313, nc415, 
        nc1479, nc13, nc881, nc92, nc1103, nc764, nc613, nc360, 
        nc1381, nc632, nc1565, nc1325, nc1253, nc804, nc285, 
        nc1116, nc1302, nc1176, nc1003, nc708, nc1511, nc1457, 
        nc1571, nc877, nc1200, nc1480, nc1092, nc814, nc1257, 
        nc1094, nc503, nc1416, nc4, nc1476, nc1198, nc718, nc851, 
        nc779, nc1119, nc1254, nc1179, nc520, nc1182, nc1616, 
        nc1201, nc255, nc1125, nc513, nc634, nc597, nc1580, nc282, 
        nc1445, nc1441, nc1085, nc876, nc133, nc605, nc1205, 
        nc944, nc1536, nc36, nc1107, nc365, nc268, nc982, nc501, 
        nc1597, nc1100, nc879, nc1248, nc790, nc615, nc367, 
        nc1212, nc1601, nc1272, nc252, nc1091, nc747, nc1080, 
        nc882, nc572, nc511, nc1335, nc528, nc733, nc438, nc1313, 
        nc264, nc1585, nc1373, nc199, nc104, nc1328, nc1007, 
        nc952, nc796, nc160, nc220, nc403, nc87, nc608, nc470, 
        nc565, nc1553, nc114, nc1569, nc368, nc852, nc504, nc1203, 
        nc206, nc1414, nc526, nc413, nc1474, nc1058, nc618, 
        nc1246, nc961, nc1135, nc1407, nc985, nc207, nc241, nc145, 
        nc514, nc323, nc425, nc1413, nc216, nc46, nc1473, nc6, 
        nc1207, nc989, nc606, nc960, nc623, nc744, nc340, nc217, 
        nc181, nc93, nc1623, nc187, nc1204, nc1123, nc616, nc600, 
        nc409, nc289, nc577, nc467, nc955, nc824, nc1269, nc1322, 
        nc1394, nc1023, nc728, nc1052, nc994, nc610, nc419, 
        nc1054, nc959, nc1220, nc1158, nc151, nc523, nc1, nc157, 
        nc362, nc466, nc1562, nc1568, nc530, nc1338, nc1144, 
        nc1099, nc770, nc259, nc1221, nc797, nc801, nc34, nc1469, 
        nc369, nc1347, nc345, nc248, nc1589, nc205, nc1492, nc988, 
        nc625, nc179, nc1225, nc811, nc1319, nc1166, nc347, 
        nc1557, nc1379, nc1141, nc462, nc1608, nc1127, nc967, 
        nc776, nc1561, nc215, nc521, nc1503, nc1120, nc1051, 
        nc781, nc244, nc1633, nc1621, nc1466, nc1008, nc538, 
        nc1133, nc291, nc195, nc1169, nc958, nc66, nc140, nc687, 
        nc202, nc1332, nc661, nc545, nc794, nc390, nc1289, nc1033, 
        nc230, nc1498, nc124, nc1594, nc1027, nc348, nc162, nc423, 
        nc751, nc1230, nc628, nc1396, nc1046, nc212, nc283, nc941, 
        nc384, nc902, nc536, nc524, nc1223, nc226, nc1582, nc44, 
        nc1602, nc1588, nc657, nc1231, nc940, nc333, nc435, 
        nc1427, nc1002, nc227, nc1262, nc912, nc802, nc1614, 
        nc1004, nc974, nc16, nc633, nc1607, nc1108, nc1489, nc662, 
        nc1227, nc626, nc1415, nc253, nc1475, nc354, nc1235, 
        nc1411, nc1363, nc812, nc447, nc1471, nc1224, nc1186, 
        nc1137, nc834, nc620, nc429, nc1354, nc1340, nc1130, 
        nc777, nc589, nc39, nc1581, nc738, nc395, nc298, nc1631, 
        nc1218, nc1278, nc342, nc446, nc1486, nc397, nc533, 
        nc1464, nc905, nc9, nc1507, nc664, nc1189, nc1059, nc909, 
        nc1463, nc1037, nc1001, nc349, nc294, nc915, nc559, nc163, 
        nc101, nc107, nc1391, nc821, nc1452, nc919, nc186, nc190, 
        nc28, nc888, nc271, nc442, nc1233, nc983, nc175, nc209, 
        nc947, nc635, nc595, nc225, nc111, nc117, nc398, nc1437, 
        nc774, nc370, nc1216, nc531, nc1490, nc1628, nc1276, 
        nc1282, nc991, nc219, nc1237, nc1523, nc763, nc468, nc49, 
        nc64, nc782, nc156, nc1192, nc641, nc25, nc1383, nc990, 
        nc858, nc1234, nc1028, nc953, nc1590, nc142, nc1458, nc78, 
        nc1554, nc58, nc222, nc134, nc1095, nc1546, nc433, nc1356, 
        nc908, nc638, nc497, nc1484, nc752, nc534, nc236, nc1369, 
        nc922, nc1304, nc918, nc14, nc701, nc37, nc1622, nc237, 
        nc1483, nc642, nc1114, nc885, nc375, nc75, nc278, nc392, 
        nc496, nc1090, nc55, nc1345, nc1174, nc96, nc785, nc1022, 
        nc822, nc1024, nc636, nc711, nc377, nc1627, nc1595, 
        nc1128, nc188, nc607, nc1009, nc386, nc1317, nc399, 
        nc1377, nc630, nc439, nc1638, nc274, nc617, nc203, nc1111, 
        nc304, nc1533, nc855, nc1171, nc689, nc1402, nc492, nc755, 
        nc997, nc644, nc1145, nc170, nc560, nc1038, nc158, nc213, 
        nc575, nc314, nc925, nc356, nc378, nc1527, nc143, nc971, 
        nc986, nc929, nc69, nc1021, nc1351, nc1605, nc691, nc659, 
        nc831, nc121, nc47, nc1465, nc127, nc1461, nc970, nc381, 
        nc235, nc1016, nc192, nc509, nc1076, nc1389, nc229, 
        nc1408, nc1632, nc1504, nc1450, nc743, nc448, nc484, 
        nc1306, nc1032, nc1034, nc956, nc1268, nc519, nc568, 
        nc477, nc1637, nc1138, nc1348, nc1152, nc19, nc1550, 
        nc351, nc260, nc692, nc1600, nc232, nc372, nc476, nc1055, 
        nc106, nc454, nc1599, nc20, nc808, nc566, nc1310, nc903, 
        nc481, nc1370, nc880, nc928, nc883, nc116, nc363, nc465, 
        nc1537, nc932, nc379, nc21, nc818, nc913, nc94, nc663, 
        nc1266, nc1324, nc1050, nc694, nc1031, nc721, nc1143, 
        nc702, nc472, nc832, nc977, nc1555, nc451, nc1485, nc850, 
        nc1342, nc193, nc1481, nc1043, nc864, nc853, nc887, nc627, 
        nc70, nc712, nc50, nc1299, nc1029, nc768, nc1240, nc1301, 
        nc67, nc540, nc789, nc563, nc71, nc1288, nc671, nc223, 
        nc51, nc324, nc1422, nc1592, nc1598, nc1241, nc172, nc935, 
        nc793, nc498, nc1400, nc857, nc805, nc705, nc886, nc1164, 
        nc939, nc1499, nc1245, nc108, nc1102, nc815, nc759, nc665, 
        nc131, nc1147, nc306, nc137, nc715, nc1516, nc889, nc1625, 
        nc1500, nc17, nc1576, nc1196, nc1140, nc1367, nc672, 
        nc118, nc561, nc239, nc1591, nc1334, nc1005, nc529, nc609, 
        nc582, nc548, nc316, nc1619, nc1428, nc1286, nc1524, 
        nc856, nc1161, nc1496, nc1326, nc240, nc1315, nc1199, 
        nc619, nc1375, nc859, nc99, nc1047, nc88, nc480, nc1039, 
        nc164, nc906, nc1000, nc463, nc546, nc674, nc668, nc552, 
        nc1620, nc1559, nc1243, nc1505, nc301, nc1432, nc916, 
        nc564, nc126, nc266, nc343, nc445, nc22, nc938, nc828, 
        nc923, nc173, nc1447, nc643, nc1066, nc1115, nc267, nc85, 
        nc1175, nc404, nc450, nc311, nc1292, nc1247, nc590, nc731, 
        nc666, nc1184, nc1244, nc844, nc414, nc1635, nc1393, 
        nc722, nc587, nc748, nc660, nc469, nc773, nc637, nc478, 
        nc1259, nc1387, nc1438, nc72, nc1534, nc52, nc543, nc401, 
        nc800, nc1181, nc1336, nc233, nc1360, nc803, nc1321, 
        nc334, nc1494, nc1552, nc1558, nc780, nc557, nc411, nc810, 
        nc598, nc1318, nc1378, nc1493, nc813, nc1420, nc825, 
        nc1630, nc1459, nc645, nc861, nc725, nc290, nc189, nc265, 
        nc128, nc807, nc541, nc1156, nc1122, nc786, nc97, nc750, 
        nc326, nc1086, nc596, nc1551, nc1520, nc1543, nc539, 
        nc817, nc709, nc1509, nc1025, nc393, nc495, nc1456, nc629, 
        nc1048, nc1613, nc693, nc159, nc1159, nc144, nc719, 
        nc1113, nc1173, nc756, nc443, nc806, nc648, nc262, nc1312, 
        nc570, nc1372, nc1013, nc1073, nc926, nc894, nc544, 
        nc1020, nc246, nc1331, nc816, nc809, nc1210, nc798, 
        nc1380, nc1270, nc136, nc23, nc1525, nc962, nc838, nc247, 
        nc1566, nc933, nc321, nc1399, nc1209, nc593, nc502, 
        nc1042, nc984, nc819, nc646, nc1252, nc1044, nc1211, 
        nc1430, nc1271, nc1148, nc862, nc424, nc512, nc1502, 
        nc1508, nc640, nc449, nc1353, nc80, nc732, nc1132, nc400, 
        nc1365, nc1215, nc1275, nc787, nc1530, nc578, nc1117, 
        nc695, nc1177, nc954, nc1409, nc73, nc81, nc1110, nc53, 
        nc410, nc1170, nc1035, nc270, nc591, nc1611, nc421, 
        nc1454, nc820, nc1547, nc1106, nc965, nc823, nc1501, 
        nc576, nc1165, nc757, nc1041, nc1453, nc969, nc841, 
        nc1017, nc1406, nc1030, nc835, nc1077, nc245, nc161, 
        nc373, nc475, nc735, nc167, nc281, nc194, nc507, nc185, 
        nc1495, nc1109, nc673, nc1535, nc493, nc138, nc1606, 
        nc1491, nc698, nc269, nc1586, nc1213, nc784, nc380, 
        nc1273, nc336, nc827, nc517, nc594, nc296, nc1417, nc1477, 
        nc874, nc1298, nc639, nc729, nc297, nc1529, nc1217, nc778, 
        nc700, nc251, nc1277, nc155, nc242, nc1385, nc696, nc1214, 
        nc754, nc573, nc350, nc1202, nc1368, nc1274, nc710, nc826, 
        nc109, nc936, nc690, nc499, nc942, nc1303, nc968, nc706, 
        nc829, nc1359, nc119, nc331, nc1344, nc38, nc842, nc385, 
        nc288, nc1185, nc675, nc1229, nc1296, nc761, nc716, nc522, 
        nc434, nc387, nc571, nc1404, nc1049, nc667, nc1522, 
        nc1528, nc1163, nc891, nc2, nc82, nc1403, nc284, nc420, 
        nc35, nc295, nc355, nc258, nc1362, nc1618, nc1063, nc1442, 
        nc263, nc180, nc364, nc1539, nc1429, nc1513, nc357, nc174, 
        nc945, nc1573, nc585, nc1260, nc431, nc830, nc473, nc678, 
        nc388, nc904, nc833, nc1018, nc949, nc1126, nc1078, nc981, 
        nc254, nc1388, nc574, nc1521, nc141, nc276, nc1261, nc147, 
        nc1194, nc914, nc48, nc7, nc5, nc150, nc277, nc292, 
        nc1455, nc1426, nc980, nc249, nc707, nc555, nc1451, nc527, 
        nc1129, nc676, nc1265, nc358, nc1448, nc1397, nc1544, 
        nc1626, nc837, nc569, nc1239, nc1167, nc951, nc1612, 
        nc1346, nc717, nc992, nc487, nc1160, nc1191, nc1258, 
        nc670, nc479, nc1012, nc45, nc1072, nc1014, nc739, nc1074, 
        nc1617, nc1118, nc950, nc1309, nc1532, nc1178, nc1538, 
        nc892, nc720, nc1183, nc382, nc486, nc1382, nc1222, nc836, 
        nc201, nc948, nc105, nc1067, nc1439, nc1083, nc457, nc166, 
        nc26, nc868, nc129, nc963, nc704, nc300, nc1280, nc389, 
        nc1323, nc839, nc211, nc1136, nc115, nc1096, nc871, nc726, 
        nc1263, nc741, nc1531, nc1517, nc1577, nc1256, nc275, 
        nc352, nc456, nc714, nc310, nc482, nc1467, nc532, nc1281, 
        nc995, nc987, nc1011, nc1436, nc1071, nc762, nc647, 
        nc1267, nc999, nc1424, nc1139, nc359, nc1636, nc191, 
        nc1285, nc83, nc197, nc1264, nc430, nc76, nc56, nc1604, 
        nc243, nc68, nc1187, nc344, nc1423, nc1341, nc681, nc452, 
        nc299, nc1180, nc957, nc1405, nc1390, nc272, nc1401, 
        nc182, nc30, nc305, nc208, nc1440, nc924, nc865, nc1232, 
        nc307, nc31, nc1208, nc1154, nc972, nc765, nc65, nc315, 
        nc218, nc1087, nc651, nc1142, nc168, nc18, nc1540, nc1333, 
        nc317, nc682, nc549, nc366, nc152, nc204, nc872, nc537, 
        nc1357, nc727, nc1283, nc1045, nc998, nc100, nc1314, 
        nc669, nc214, nc1487, nc1151, nc1374, nc505, nc1563, 
        nc308, nc1434, nc1287, nc791, nc15, nc110, nc901, nc730, 
        nc652, nc515, nc1068, nc1329, nc1206, nc1040, nc684, 
        nc1284, nc318, nc1433, nc1019, nc966, nc40, nc1079, nc146, 
        nc975, nc697, nc24, nc848, nc943, nc911, nc900, nc1545, 
        nc221, nc125, nc183, nc139, nc979, nc361, nc41, nc1596, 
        nc1412, nc1472, nc1056, nc293, nc910, nc736, nc724, nc171, 
        nc320, nc394, nc177, nc407, nc654, nc464, nc742, nc279, 
        nc1062, nc1064, nc417, nc153 : std_logic;

begin 

    \GND\ <= GND_power_net1;
    \VCC\ <= VCC_power_net1;
    ADLIB_VCC <= VCC_power_net1;

    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C3 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%3%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1395, A_DOUT(18) => nc1168, 
        A_DOUT(17) => nc783, A_DOUT(16) => nc488, A_DOUT(15) => 
        nc74, A_DOUT(14) => nc1615, A_DOUT(13) => nc54, 
        A_DOUT(12) => nc302, A_DOUT(11) => nc406, A_DOUT(10) => 
        nc1104, A_DOUT(9) => nc1418, A_DOUT(8) => nc1624, 
        A_DOUT(7) => nc1514, A_DOUT(6) => nc312, A_DOUT(5) => 
        nc416, A_DOUT(4) => nc1478, A_DOUT(3) => nc1574, 
        A_DOUT(2) => nc461, A_DOUT(1) => nc860, A_DOUT(0) => 
        \R_DATA_TEMPR1[3]\, B_DOUT(19) => nc1350, B_DOUT(18) => 
        nc599, B_DOUT(17) => nc309, B_DOUT(16) => nc1583, 
        B_DOUT(15) => nc1316, B_DOUT(14) => nc863, B_DOUT(13) => 
        nc1425, B_DOUT(12) => nc1376, B_DOUT(11) => nc1307, 
        B_DOUT(10) => nc1421, B_DOUT(9) => nc753, B_DOUT(8) => 
        nc458, B_DOUT(7) => nc1339, B_DOUT(6) => nc845, B_DOUT(5)
         => nc32, B_DOUT(4) => nc1195, B_DOUT(3) => nc1088, 
        B_DOUT(2) => nc745, B_DOUT(1) => nc402, B_DOUT(0) => 
        nc978, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[1][3]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(3), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C5 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%5%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc319, A_DOUT(18) => nc907, 
        A_DOUT(17) => nc228, A_DOUT(16) => nc325, A_DOUT(15) => 
        nc1567, A_DOUT(14) => nc934, A_DOUT(13) => nc8, 
        A_DOUT(12) => nc1101, A_DOUT(11) => nc148, A_DOUT(10) => 
        nc327, A_DOUT(9) => nc1610, A_DOUT(8) => nc1228, 
        A_DOUT(7) => nc1061, A_DOUT(6) => nc346, A_DOUT(5) => 
        nc412, A_DOUT(4) => nc917, A_DOUT(3) => nc98, A_DOUT(2)
         => nc771, A_DOUT(1) => nc867, A_DOUT(0) => 
        \R_DATA_TEMPR0[5]\, B_DOUT(19) => nc60, B_DOUT(18) => 
        nc737, B_DOUT(17) => nc196, B_DOUT(16) => nc224, 
        B_DOUT(15) => nc649, B_DOUT(14) => nc29, B_DOUT(13) => 
        nc898, B_DOUT(12) => nc601, B_DOUT(11) => nc993, 
        B_DOUT(10) => nc1549, B_DOUT(9) => nc677, B_DOUT(8) => 
        nc769, B_DOUT(7) => nc102, B_DOUT(6) => nc120, B_DOUT(5)
         => nc61, B_DOUT(4) => nc1082, B_DOUT(3) => nc611, 
        B_DOUT(2) => nc525, B_DOUT(1) => nc1084, B_DOUT(0) => 
        nc1006, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][5]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(5), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \INVBLKX0[0]\ : INV
      port map(A => W_ADDR(14), Y => \BLKX0[0]\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C1 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%1%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc95, A_DOUT(18) => nc1188, 
        A_DOUT(17) => nc328, A_DOUT(16) => nc273, A_DOUT(15) => 
        nc946, A_DOUT(14) => nc374, A_DOUT(13) => nc580, 
        A_DOUT(12) => nc112, A_DOUT(11) => nc1398, A_DOUT(10) => 
        nc792, A_DOUT(9) => nc921, A_DOUT(8) => nc866, A_DOUT(7)
         => nc1634, A_DOUT(6) => nc1226, A_DOUT(5) => nc10, 
        A_DOUT(4) => nc42, A_DOUT(3) => nc341, A_DOUT(2) => nc602, 
        A_DOUT(1) => nc79, A_DOUT(0) => \R_DATA_TEMPR1[1]\, 
        B_DOUT(19) => nc231, B_DOUT(18) => nc135, B_DOUT(17) => 
        nc59, B_DOUT(16) => nc1435, B_DOUT(15) => nc920, 
        B_DOUT(14) => nc869, B_DOUT(13) => nc1311, B_DOUT(12) => 
        nc1556, B_DOUT(11) => nc1371, B_DOUT(10) => nc1431, 
        B_DOUT(9) => nc1249, B_DOUT(8) => nc11, B_DOUT(7) => 
        nc734, B_DOUT(6) => nc444, B_DOUT(5) => nc330, B_DOUT(4)
         => nc550, B_DOUT(3) => nc612, B_DOUT(2) => nc562, 
        B_DOUT(1) => nc1587, B_DOUT(0) => nc427, DB_DETECT => 
        OPEN, SB_CORRECT => OPEN, ACCESS_BUSY => 
        \ACCESS_BUSY[1][1]\, A_ADDR(13) => R_ADDR(13), A_ADDR(12)
         => R_ADDR(12), A_ADDR(11) => R_ADDR(11), A_ADDR(10) => 
        R_ADDR(10), A_ADDR(9) => R_ADDR(9), A_ADDR(8) => 
        R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6) => R_ADDR(6), 
        A_ADDR(5) => R_ADDR(5), A_ADDR(4) => R_ADDR(4), A_ADDR(3)
         => R_ADDR(3), A_ADDR(2) => R_ADDR(2), A_ADDR(1) => 
        R_ADDR(1), A_ADDR(0) => R_ADDR(0), A_BLK_EN(2) => R_EN, 
        A_BLK_EN(1) => \BLKY1[0]\, A_BLK_EN(0) => R_ADDR(14), 
        A_CLK => R_CLK, A_DIN(19) => \GND\, A_DIN(18) => \GND\, 
        A_DIN(17) => \GND\, A_DIN(16) => \GND\, A_DIN(15) => 
        \GND\, A_DIN(14) => \GND\, A_DIN(13) => \GND\, A_DIN(12)
         => \GND\, A_DIN(11) => \GND\, A_DIN(10) => \GND\, 
        A_DIN(9) => \GND\, A_DIN(8) => \GND\, A_DIN(7) => \GND\, 
        A_DIN(6) => \GND\, A_DIN(5) => \GND\, A_DIN(4) => \GND\, 
        A_DIN(3) => \GND\, A_DIN(2) => \GND\, A_DIN(1) => \GND\, 
        A_DIN(0) => \GND\, A_REN => \VCC\, A_WEN(1) => \GND\, 
        A_WEN(0) => \GND\, A_DOUT_EN => \VCC\, A_DOUT_ARST_N => 
        \VCC\, A_DOUT_SRST_N => \VCC\, B_ADDR(13) => W_ADDR(13), 
        B_ADDR(12) => W_ADDR(12), B_ADDR(11) => W_ADDR(11), 
        B_ADDR(10) => W_ADDR(10), B_ADDR(9) => W_ADDR(9), 
        B_ADDR(8) => W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6)
         => W_ADDR(6), B_ADDR(5) => W_ADDR(5), B_ADDR(4) => 
        W_ADDR(4), B_ADDR(3) => W_ADDR(3), B_ADDR(2) => W_ADDR(2), 
        B_ADDR(1) => W_ADDR(1), B_ADDR(0) => W_ADDR(0), 
        B_BLK_EN(2) => W_EN, B_BLK_EN(1) => \BLKX1[0]\, 
        B_BLK_EN(0) => W_ADDR(14), B_CLK => W_CLK, B_DIN(19) => 
        \GND\, B_DIN(18) => \GND\, B_DIN(17) => \GND\, B_DIN(16)
         => \GND\, B_DIN(15) => \GND\, B_DIN(14) => \GND\, 
        B_DIN(13) => \GND\, B_DIN(12) => \GND\, B_DIN(11) => 
        \GND\, B_DIN(10) => \GND\, B_DIN(9) => \GND\, B_DIN(8)
         => \GND\, B_DIN(7) => \GND\, B_DIN(6) => \GND\, B_DIN(5)
         => \GND\, B_DIN(4) => \GND\, B_DIN(3) => \GND\, B_DIN(2)
         => \GND\, B_DIN(1) => \GND\, B_DIN(0) => W_DATA(1), 
        B_REN => \VCC\, B_WEN(1) => \GND\, B_WEN(0) => \VCC\, 
        B_DOUT_EN => \VCC\, B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N
         => \VCC\, ECC_EN => \GND\, BUSY_FB => \GND\, A_WIDTH(2)
         => \GND\, A_WIDTH(1) => \GND\, A_WIDTH(0) => \GND\, 
        A_WMODE(1) => \GND\, A_WMODE(0) => \GND\, A_BYPASS => 
        \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1) => \GND\, 
        B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, B_WMODE(0) => 
        \GND\, B_BYPASS => \VCC\, ECC_BYPASS => \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C0 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%0%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1410, A_DOUT(18) => nc1364, 
        A_DOUT(17) => nc1300, A_DOUT(16) => nc1470, A_DOUT(15)
         => nc1238, A_DOUT(14) => nc1542, A_DOUT(13) => nc579, 
        A_DOUT(12) => nc1548, A_DOUT(11) => nc1081, A_DOUT(10)
         => nc895, A_DOUT(9) => nc1355, A_DOUT(8) => nc588, 
        A_DOUT(7) => nc795, A_DOUT(6) => nc86, A_DOUT(5) => 
        nc1193, A_DOUT(4) => nc604, A_DOUT(3) => nc460, A_DOUT(2)
         => nc1112, A_DOUT(1) => nc1172, A_DOUT(0) => 
        \R_DATA_TEMPR2[0]\, B_DOUT(19) => nc198, B_DOUT(18) => 
        nc1510, B_DOUT(17) => nc322, B_DOUT(16) => nc426, 
        B_DOUT(15) => nc1449, B_DOUT(14) => nc1570, B_DOUT(13)
         => nc1392, B_DOUT(12) => nc1069, B_DOUT(11) => nc441, 
        B_DOUT(10) => nc840, B_DOUT(9) => nc280, B_DOUT(8) => 
        nc1093, B_DOUT(7) => nc396, B_DOUT(6) => nc103, B_DOUT(5)
         => nc1124, B_DOUT(4) => nc614, B_DOUT(3) => nc843, 
        B_DOUT(2) => nc1015, B_DOUT(1) => nc1075, B_DOUT(0) => 
        nc1290, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][0]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(0), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C8 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%8%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1146, A_DOUT(18) => nc586, 
        A_DOUT(17) => nc329, A_DOUT(16) => nc1541, A_DOUT(15) => 
        nc1462, A_DOUT(14) => nc699, A_DOUT(13) => nc558, 
        A_DOUT(12) => nc113, A_DOUT(11) => nc1155, A_DOUT(10) => 
        nc176, A_DOUT(9) => nc33, A_DOUT(8) => nc1327, A_DOUT(7)
         => nc27, A_DOUT(6) => nc878, A_DOUT(5) => nc973, 
        A_DOUT(4) => nc238, A_DOUT(3) => nc335, A_DOUT(2) => 
        nc1291, A_DOUT(1) => nc1236, A_DOUT(0) => 
        \R_DATA_TEMPR0[8]\, B_DOUT(19) => nc383, B_DOUT(18) => 
        nc485, B_DOUT(17) => nc1446, B_DOUT(16) => nc422, 
        B_DOUT(15) => nc927, B_DOUT(14) => nc250, B_DOUT(13) => 
        nc683, B_DOUT(12) => nc1121, B_DOUT(11) => nc1010, 
        B_DOUT(10) => nc337, B_DOUT(9) => nc1149, B_DOUT(8) => 
        nc1070, B_DOUT(7) => nc703, B_DOUT(6) => nc408, B_DOUT(5)
         => nc847, B_DOUT(4) => nc567, B_DOUT(3) => nc996, 
        B_DOUT(2) => nc1515, B_DOUT(1) => nc1295, B_DOUT(0) => 
        nc1575, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][8]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(8), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[5]\ : OR3
      port map(A => \R_DATA_TEMPR0[5]\, B => \R_DATA_TEMPR1[5]\, 
        C => \R_DATA_TEMPR2[5]\, Y => R_DATA(5));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C13 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%13%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc556, A_DOUT(18) => nc772, 
        A_DOUT(17) => nc234, A_DOUT(16) => nc1197, A_DOUT(15) => 
        nc713, A_DOUT(14) => nc418, A_DOUT(13) => nc749, 
        A_DOUT(12) => nc884, A_DOUT(11) => nc391, A_DOUT(10) => 
        nc62, A_DOUT(9) => nc1190, A_DOUT(8) => nc353, A_DOUT(7)
         => nc455, A_DOUT(6) => nc621, A_DOUT(5) => nc1468, 
        A_DOUT(4) => nc788, A_DOUT(3) => nc1564, A_DOUT(2) => 
        nc1384, A_DOUT(1) => nc130, A_DOUT(0) => 
        \R_DATA_TEMPR2[13]\, B_DOUT(19) => nc653, B_DOUT(18) => 
        nc77, B_DOUT(17) => nc57, B_DOUT(16) => nc1506, 
        B_DOUT(15) => nc535, B_DOUT(14) => nc1366, B_DOUT(13) => 
        nc760, B_DOUT(12) => nc122, B_DOUT(11) => nc494, 
        B_DOUT(10) => nc583, B_DOUT(9) => nc846, B_DOUT(8) => 
        nc338, B_DOUT(7) => nc1242, B_DOUT(6) => nc1358, 
        B_DOUT(5) => nc1026, B_DOUT(4) => nc931, B_DOUT(3) => 
        nc1609, B_DOUT(2) => nc1089, B_DOUT(1) => nc854, 
        B_DOUT(0) => nc1134, DB_DETECT => OPEN, SB_CORRECT => 
        OPEN, ACCESS_BUSY => \ACCESS_BUSY[2][13]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(13), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C2 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%2%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1097, A_DOUT(18) => nc849, 
        A_DOUT(17) => nc90, A_DOUT(16) => nc169, A_DOUT(15) => 
        nc1343, A_DOUT(14) => nc43, A_DOUT(13) => nc758, 
        A_DOUT(12) => nc1305, A_DOUT(11) => nc12, A_DOUT(10) => 
        nc930, A_DOUT(9) => nc875, A_DOUT(8) => nc766, A_DOUT(7)
         => nc775, A_DOUT(6) => nc622, A_DOUT(5) => nc542, 
        A_DOUT(4) => nc1482, A_DOUT(3) => nc1293, A_DOUT(2) => 
        nc685, A_DOUT(1) => nc553, A_DOUT(0) => 
        \R_DATA_TEMPR1[2]\, B_DOUT(19) => nc1337, B_DOUT(18) => 
        nc491, B_DOUT(17) => nc91, B_DOUT(16) => nc890, 
        B_DOUT(15) => nc178, B_DOUT(14) => nc893, B_DOUT(13) => 
        nc1497, B_DOUT(12) => nc581, B_DOUT(11) => nc376, 
        B_DOUT(10) => nc437, B_DOUT(9) => nc1131, B_DOUT(8) => 
        nc1444, B_DOUT(7) => nc84, B_DOUT(6) => nc1297, B_DOUT(5)
         => nc440, B_DOUT(4) => nc1320, B_DOUT(3) => nc500, 
        B_DOUT(2) => nc679, B_DOUT(1) => nc1153, B_DOUT(0) => 
        nc1105, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][2]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(2), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \INVBLKX1[0]\ : INV
      port map(A => W_ADDR(15), Y => \BLKX1[0]\);
    
    \OR3_R_DATA[7]\ : OR3
      port map(A => \R_DATA_TEMPR0[7]\, B => \R_DATA_TEMPR1[7]\, 
        C => \R_DATA_TEMPR2[7]\, Y => R_DATA(7));
    
    \OR3_R_DATA[6]\ : OR3
      port map(A => \R_DATA_TEMPR0[6]\, B => \R_DATA_TEMPR1[6]\, 
        C => \R_DATA_TEMPR2[6]\, Y => R_DATA(6));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C12 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%12%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1443, A_DOUT(18) => nc1294, 
        A_DOUT(17) => nc655, A_DOUT(16) => nc624, A_DOUT(15) => 
        nc332, A_DOUT(14) => nc436, A_DOUT(13) => nc1352, 
        A_DOUT(12) => nc1053, A_DOUT(11) => nc510, A_DOUT(10) => 
        nc184, A_DOUT(9) => nc897, A_DOUT(8) => nc551, A_DOUT(7)
         => nc1488, A_DOUT(6) => nc1584, A_DOUT(5) => nc483, 
        A_DOUT(4) => nc1250, A_DOUT(3) => nc688, A_DOUT(2) => 
        nc1519, A_DOUT(1) => nc123, A_DOUT(0) => 
        \R_DATA_TEMPR2[12]\, B_DOUT(19) => nc1579, B_DOUT(18) => 
        nc976, B_DOUT(17) => nc1361, B_DOUT(16) => nc1386, 
        B_DOUT(15) => nc339, B_DOUT(14) => nc799, B_DOUT(13) => 
        nc1036, B_DOUT(12) => nc584, B_DOUT(11) => nc964, 
        B_DOUT(10) => nc286, B_DOUT(9) => nc1251, B_DOUT(8) => 
        nc371, B_DOUT(7) => nc432, B_DOUT(6) => nc287, B_DOUT(5)
         => nc937, B_DOUT(4) => nc547, B_DOUT(3) => nc1460, 
        B_DOUT(2) => nc154, B_DOUT(1) => nc508, B_DOUT(0) => 
        nc896, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[2][12]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(12), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[9]\ : OR3
      port map(A => \R_DATA_TEMPR0[9]\, B => \R_DATA_TEMPR1[9]\, 
        C => \R_DATA_TEMPR2[9]\, Y => R_DATA(9));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C4 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%4%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc453, A_DOUT(18) => nc686, 
        A_DOUT(17) => nc658, A_DOUT(16) => nc474, A_DOUT(15) => 
        nc767, A_DOUT(14) => nc723, A_DOUT(13) => nc428, 
        A_DOUT(12) => nc1255, A_DOUT(11) => nc1308, A_DOUT(10)
         => nc1162, A_DOUT(9) => nc554, A_DOUT(8) => nc200, 
        A_DOUT(7) => nc1157, A_DOUT(6) => nc256, A_DOUT(5) => 
        nc518, A_DOUT(4) => nc1560, A_DOUT(3) => nc899, A_DOUT(2)
         => nc3, A_DOUT(1) => nc1219, A_DOUT(0) => 
        \R_DATA_TEMPR0[4]\, B_DOUT(19) => nc680, B_DOUT(18) => 
        nc489, B_DOUT(17) => nc63, B_DOUT(16) => nc1279, 
        B_DOUT(15) => nc1150, B_DOUT(14) => nc631, B_DOUT(13) => 
        nc257, B_DOUT(12) => nc740, B_DOUT(11) => nc1593, 
        B_DOUT(10) => nc1065, B_DOUT(9) => nc1330, B_DOUT(8) => 
        nc506, B_DOUT(7) => nc210, B_DOUT(6) => nc592, B_DOUT(5)
         => nc1349, B_DOUT(4) => nc132, B_DOUT(3) => nc656, 
        B_DOUT(2) => nc1526, B_DOUT(1) => nc1512, B_DOUT(0) => 
        nc1098, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][4]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(4), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C5 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%5%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1518, A_DOUT(18) => nc471, 
        A_DOUT(17) => nc1572, A_DOUT(16) => nc870, A_DOUT(15) => 
        nc303, A_DOUT(14) => nc405, A_DOUT(13) => nc1578, 
        A_DOUT(12) => nc516, A_DOUT(11) => nc873, A_DOUT(10) => 
        nc149, A_DOUT(9) => nc603, A_DOUT(8) => nc1057, A_DOUT(7)
         => nc650, A_DOUT(6) => nc89, A_DOUT(5) => nc459, 
        A_DOUT(4) => nc490, A_DOUT(3) => nc261, A_DOUT(2) => 
        nc1629, A_DOUT(1) => nc165, A_DOUT(0) => 
        \R_DATA_TEMPR1[5]\, B_DOUT(19) => nc1603, B_DOUT(18) => 
        nc746, B_DOUT(17) => nc1419, B_DOUT(16) => nc1060, 
        B_DOUT(15) => nc313, B_DOUT(14) => nc415, B_DOUT(13) => 
        nc1479, B_DOUT(12) => nc13, B_DOUT(11) => nc881, 
        B_DOUT(10) => nc92, B_DOUT(9) => nc1103, B_DOUT(8) => 
        nc764, B_DOUT(7) => nc613, B_DOUT(6) => nc360, B_DOUT(5)
         => nc1381, B_DOUT(4) => nc632, B_DOUT(3) => nc1565, 
        B_DOUT(2) => nc1325, B_DOUT(1) => nc1253, B_DOUT(0) => 
        nc804, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[1][5]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(5), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C5 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%5%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc285, A_DOUT(18) => nc1116, 
        A_DOUT(17) => nc1302, A_DOUT(16) => nc1176, A_DOUT(15)
         => nc1003, A_DOUT(14) => nc708, A_DOUT(13) => nc1511, 
        A_DOUT(12) => nc1457, A_DOUT(11) => nc1571, A_DOUT(10)
         => nc877, A_DOUT(9) => nc1200, A_DOUT(8) => nc1480, 
        A_DOUT(7) => nc1092, A_DOUT(6) => nc814, A_DOUT(5) => 
        nc1257, A_DOUT(4) => nc1094, A_DOUT(3) => nc503, 
        A_DOUT(2) => nc1416, A_DOUT(1) => nc4, A_DOUT(0) => 
        \R_DATA_TEMPR2[5]\, B_DOUT(19) => nc1476, B_DOUT(18) => 
        nc1198, B_DOUT(17) => nc718, B_DOUT(16) => nc851, 
        B_DOUT(15) => nc779, B_DOUT(14) => nc1119, B_DOUT(13) => 
        nc1254, B_DOUT(12) => nc1179, B_DOUT(11) => nc520, 
        B_DOUT(10) => nc1182, B_DOUT(9) => nc1616, B_DOUT(8) => 
        nc1201, B_DOUT(7) => nc255, B_DOUT(6) => nc1125, 
        B_DOUT(5) => nc513, B_DOUT(4) => nc634, B_DOUT(3) => 
        nc597, B_DOUT(2) => nc1580, B_DOUT(1) => nc282, B_DOUT(0)
         => nc1445, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][5]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(5), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[3]\ : OR3
      port map(A => \R_DATA_TEMPR0[3]\, B => \R_DATA_TEMPR1[3]\, 
        C => \R_DATA_TEMPR2[3]\, Y => R_DATA(3));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C8 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%8%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1441, A_DOUT(18) => nc1085, 
        A_DOUT(17) => nc876, A_DOUT(16) => nc133, A_DOUT(15) => 
        nc605, A_DOUT(14) => nc1205, A_DOUT(13) => nc944, 
        A_DOUT(12) => nc1536, A_DOUT(11) => nc36, A_DOUT(10) => 
        nc1107, A_DOUT(9) => nc365, A_DOUT(8) => nc268, A_DOUT(7)
         => nc982, A_DOUT(6) => nc501, A_DOUT(5) => nc1597, 
        A_DOUT(4) => nc1100, A_DOUT(3) => nc879, A_DOUT(2) => 
        nc1248, A_DOUT(1) => nc790, A_DOUT(0) => 
        \R_DATA_TEMPR1[8]\, B_DOUT(19) => nc615, B_DOUT(18) => 
        nc367, B_DOUT(17) => nc1212, B_DOUT(16) => nc1601, 
        B_DOUT(15) => nc1272, B_DOUT(14) => nc252, B_DOUT(13) => 
        nc1091, B_DOUT(12) => nc747, B_DOUT(11) => nc1080, 
        B_DOUT(10) => nc882, B_DOUT(9) => nc572, B_DOUT(8) => 
        nc511, B_DOUT(7) => nc1335, B_DOUT(6) => nc528, B_DOUT(5)
         => nc733, B_DOUT(4) => nc438, B_DOUT(3) => nc1313, 
        B_DOUT(2) => nc264, B_DOUT(1) => nc1585, B_DOUT(0) => 
        nc1373, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][8]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(8), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C11 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%11%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc199, A_DOUT(18) => nc104, 
        A_DOUT(17) => nc1328, A_DOUT(16) => nc1007, A_DOUT(15)
         => nc952, A_DOUT(14) => nc796, A_DOUT(13) => nc160, 
        A_DOUT(12) => nc220, A_DOUT(11) => nc403, A_DOUT(10) => 
        nc87, A_DOUT(9) => nc608, A_DOUT(8) => nc470, A_DOUT(7)
         => nc565, A_DOUT(6) => nc1553, A_DOUT(5) => nc114, 
        A_DOUT(4) => nc1569, A_DOUT(3) => nc368, A_DOUT(2) => 
        nc852, A_DOUT(1) => nc504, A_DOUT(0) => 
        \R_DATA_TEMPR2[11]\, B_DOUT(19) => nc1203, B_DOUT(18) => 
        nc206, B_DOUT(17) => nc1414, B_DOUT(16) => nc526, 
        B_DOUT(15) => nc413, B_DOUT(14) => nc1474, B_DOUT(13) => 
        nc1058, B_DOUT(12) => nc618, B_DOUT(11) => nc1246, 
        B_DOUT(10) => nc961, B_DOUT(9) => nc1135, B_DOUT(8) => 
        nc1407, B_DOUT(7) => nc985, B_DOUT(6) => nc207, B_DOUT(5)
         => nc241, B_DOUT(4) => nc145, B_DOUT(3) => nc514, 
        B_DOUT(2) => nc323, B_DOUT(1) => nc425, B_DOUT(0) => 
        nc1413, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][11]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(11), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C3 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%3%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc216, A_DOUT(18) => nc46, 
        A_DOUT(17) => nc1473, A_DOUT(16) => nc6, A_DOUT(15) => 
        nc1207, A_DOUT(14) => nc989, A_DOUT(13) => nc606, 
        A_DOUT(12) => nc960, A_DOUT(11) => nc623, A_DOUT(10) => 
        nc744, A_DOUT(9) => nc340, A_DOUT(8) => nc217, A_DOUT(7)
         => nc181, A_DOUT(6) => nc93, A_DOUT(5) => nc1623, 
        A_DOUT(4) => nc187, A_DOUT(3) => nc1204, A_DOUT(2) => 
        nc1123, A_DOUT(1) => nc616, A_DOUT(0) => 
        \R_DATA_TEMPR2[3]\, B_DOUT(19) => nc600, B_DOUT(18) => 
        nc409, B_DOUT(17) => nc289, B_DOUT(16) => nc577, 
        B_DOUT(15) => nc467, B_DOUT(14) => nc955, B_DOUT(13) => 
        nc824, B_DOUT(12) => nc1269, B_DOUT(11) => nc1322, 
        B_DOUT(10) => nc1394, B_DOUT(9) => nc1023, B_DOUT(8) => 
        nc728, B_DOUT(7) => nc1052, B_DOUT(6) => nc994, B_DOUT(5)
         => nc610, B_DOUT(4) => nc419, B_DOUT(3) => nc1054, 
        B_DOUT(2) => nc959, B_DOUT(1) => nc1220, B_DOUT(0) => 
        nc1158, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][3]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(3), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C10 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%10%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc151, A_DOUT(18) => nc523, 
        A_DOUT(17) => nc1, A_DOUT(16) => nc157, A_DOUT(15) => 
        nc362, A_DOUT(14) => nc466, A_DOUT(13) => nc1562, 
        A_DOUT(12) => nc1568, A_DOUT(11) => nc530, A_DOUT(10) => 
        nc1338, A_DOUT(9) => nc1144, A_DOUT(8) => nc1099, 
        A_DOUT(7) => nc770, A_DOUT(6) => nc259, A_DOUT(5) => 
        nc1221, A_DOUT(4) => nc797, A_DOUT(3) => nc801, A_DOUT(2)
         => nc34, A_DOUT(1) => nc1469, A_DOUT(0) => 
        \R_DATA_TEMPR2[10]\, B_DOUT(19) => nc369, B_DOUT(18) => 
        nc1347, B_DOUT(17) => nc345, B_DOUT(16) => nc248, 
        B_DOUT(15) => nc1589, B_DOUT(14) => nc205, B_DOUT(13) => 
        nc1492, B_DOUT(12) => nc988, B_DOUT(11) => nc625, 
        B_DOUT(10) => nc179, B_DOUT(9) => nc1225, B_DOUT(8) => 
        nc811, B_DOUT(7) => nc1319, B_DOUT(6) => nc1166, 
        B_DOUT(5) => nc347, B_DOUT(4) => nc1557, B_DOUT(3) => 
        nc1379, B_DOUT(2) => nc1141, B_DOUT(1) => nc462, 
        B_DOUT(0) => nc1608, DB_DETECT => OPEN, SB_CORRECT => 
        OPEN, ACCESS_BUSY => \ACCESS_BUSY[2][10]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(10), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C0 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%0%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1127, A_DOUT(18) => nc967, 
        A_DOUT(17) => nc776, A_DOUT(16) => nc1561, A_DOUT(15) => 
        nc215, A_DOUT(14) => nc521, A_DOUT(13) => nc1503, 
        A_DOUT(12) => nc1120, A_DOUT(11) => nc1051, A_DOUT(10)
         => nc781, A_DOUT(9) => nc244, A_DOUT(8) => nc1633, 
        A_DOUT(7) => nc1621, A_DOUT(6) => nc1466, A_DOUT(5) => 
        nc1008, A_DOUT(4) => nc538, A_DOUT(3) => nc1133, 
        A_DOUT(2) => nc291, A_DOUT(1) => nc195, A_DOUT(0) => 
        \R_DATA_TEMPR1[0]\, B_DOUT(19) => nc1169, B_DOUT(18) => 
        nc958, B_DOUT(17) => nc66, B_DOUT(16) => nc140, 
        B_DOUT(15) => nc687, B_DOUT(14) => nc202, B_DOUT(13) => 
        nc1332, B_DOUT(12) => nc661, B_DOUT(11) => nc545, 
        B_DOUT(10) => nc794, B_DOUT(9) => nc390, B_DOUT(8) => 
        nc1289, B_DOUT(7) => nc1033, B_DOUT(6) => nc230, 
        B_DOUT(5) => nc1498, B_DOUT(4) => nc124, B_DOUT(3) => 
        nc1594, B_DOUT(2) => nc1027, B_DOUT(1) => nc348, 
        B_DOUT(0) => nc162, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][0]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(0), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[11]\ : OR3
      port map(A => \R_DATA_TEMPR0[11]\, B => \R_DATA_TEMPR1[11]\, 
        C => \R_DATA_TEMPR2[11]\, Y => R_DATA(11));
    
    \OR3_R_DATA[1]\ : OR3
      port map(A => \R_DATA_TEMPR0[1]\, B => \R_DATA_TEMPR1[1]\, 
        C => \R_DATA_TEMPR2[1]\, Y => R_DATA(1));
    
    \OR3_R_DATA[8]\ : OR3
      port map(A => \R_DATA_TEMPR0[8]\, B => \R_DATA_TEMPR1[8]\, 
        C => \R_DATA_TEMPR2[8]\, Y => R_DATA(8));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C1 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%1%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc423, A_DOUT(18) => nc751, 
        A_DOUT(17) => nc1230, A_DOUT(16) => nc628, A_DOUT(15) => 
        nc1396, A_DOUT(14) => nc1046, A_DOUT(13) => nc212, 
        A_DOUT(12) => nc283, A_DOUT(11) => nc941, A_DOUT(10) => 
        nc384, A_DOUT(9) => nc902, A_DOUT(8) => nc536, A_DOUT(7)
         => nc524, A_DOUT(6) => nc1223, A_DOUT(5) => nc226, 
        A_DOUT(4) => nc1582, A_DOUT(3) => nc44, A_DOUT(2) => 
        nc1602, A_DOUT(1) => nc1588, A_DOUT(0) => 
        \R_DATA_TEMPR2[1]\, B_DOUT(19) => nc657, B_DOUT(18) => 
        nc1231, B_DOUT(17) => nc940, B_DOUT(16) => nc333, 
        B_DOUT(15) => nc435, B_DOUT(14) => nc1427, B_DOUT(13) => 
        nc1002, B_DOUT(12) => nc227, B_DOUT(11) => nc1262, 
        B_DOUT(10) => nc912, B_DOUT(9) => nc802, B_DOUT(8) => 
        nc1614, B_DOUT(7) => nc1004, B_DOUT(6) => nc974, 
        B_DOUT(5) => nc16, B_DOUT(4) => nc633, B_DOUT(3) => 
        nc1607, B_DOUT(2) => nc1108, B_DOUT(1) => nc1489, 
        B_DOUT(0) => nc662, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][1]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(1), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C4 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%4%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1227, A_DOUT(18) => nc626, 
        A_DOUT(17) => nc1415, A_DOUT(16) => nc253, A_DOUT(15) => 
        nc1475, A_DOUT(14) => nc354, A_DOUT(13) => nc1235, 
        A_DOUT(12) => nc1411, A_DOUT(11) => nc1363, A_DOUT(10)
         => nc812, A_DOUT(9) => nc447, A_DOUT(8) => nc1471, 
        A_DOUT(7) => nc1224, A_DOUT(6) => nc1186, A_DOUT(5) => 
        nc1137, A_DOUT(4) => nc834, A_DOUT(3) => nc620, A_DOUT(2)
         => nc429, A_DOUT(1) => nc1354, A_DOUT(0) => 
        \R_DATA_TEMPR1[4]\, B_DOUT(19) => nc1340, B_DOUT(18) => 
        nc1130, B_DOUT(17) => nc777, B_DOUT(16) => nc589, 
        B_DOUT(15) => nc39, B_DOUT(14) => nc1581, B_DOUT(13) => 
        nc738, B_DOUT(12) => nc395, B_DOUT(11) => nc298, 
        B_DOUT(10) => nc1631, B_DOUT(9) => nc1218, B_DOUT(8) => 
        nc1278, B_DOUT(7) => nc342, B_DOUT(6) => nc446, B_DOUT(5)
         => nc1486, B_DOUT(4) => nc397, B_DOUT(3) => nc533, 
        B_DOUT(2) => nc1464, B_DOUT(1) => nc905, B_DOUT(0) => nc9, 
        DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY => 
        \ACCESS_BUSY[1][4]\, A_ADDR(13) => R_ADDR(13), A_ADDR(12)
         => R_ADDR(12), A_ADDR(11) => R_ADDR(11), A_ADDR(10) => 
        R_ADDR(10), A_ADDR(9) => R_ADDR(9), A_ADDR(8) => 
        R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6) => R_ADDR(6), 
        A_ADDR(5) => R_ADDR(5), A_ADDR(4) => R_ADDR(4), A_ADDR(3)
         => R_ADDR(3), A_ADDR(2) => R_ADDR(2), A_ADDR(1) => 
        R_ADDR(1), A_ADDR(0) => R_ADDR(0), A_BLK_EN(2) => R_EN, 
        A_BLK_EN(1) => \BLKY1[0]\, A_BLK_EN(0) => R_ADDR(14), 
        A_CLK => R_CLK, A_DIN(19) => \GND\, A_DIN(18) => \GND\, 
        A_DIN(17) => \GND\, A_DIN(16) => \GND\, A_DIN(15) => 
        \GND\, A_DIN(14) => \GND\, A_DIN(13) => \GND\, A_DIN(12)
         => \GND\, A_DIN(11) => \GND\, A_DIN(10) => \GND\, 
        A_DIN(9) => \GND\, A_DIN(8) => \GND\, A_DIN(7) => \GND\, 
        A_DIN(6) => \GND\, A_DIN(5) => \GND\, A_DIN(4) => \GND\, 
        A_DIN(3) => \GND\, A_DIN(2) => \GND\, A_DIN(1) => \GND\, 
        A_DIN(0) => \GND\, A_REN => \VCC\, A_WEN(1) => \GND\, 
        A_WEN(0) => \GND\, A_DOUT_EN => \VCC\, A_DOUT_ARST_N => 
        \VCC\, A_DOUT_SRST_N => \VCC\, B_ADDR(13) => W_ADDR(13), 
        B_ADDR(12) => W_ADDR(12), B_ADDR(11) => W_ADDR(11), 
        B_ADDR(10) => W_ADDR(10), B_ADDR(9) => W_ADDR(9), 
        B_ADDR(8) => W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6)
         => W_ADDR(6), B_ADDR(5) => W_ADDR(5), B_ADDR(4) => 
        W_ADDR(4), B_ADDR(3) => W_ADDR(3), B_ADDR(2) => W_ADDR(2), 
        B_ADDR(1) => W_ADDR(1), B_ADDR(0) => W_ADDR(0), 
        B_BLK_EN(2) => W_EN, B_BLK_EN(1) => \BLKX1[0]\, 
        B_BLK_EN(0) => W_ADDR(14), B_CLK => W_CLK, B_DIN(19) => 
        \GND\, B_DIN(18) => \GND\, B_DIN(17) => \GND\, B_DIN(16)
         => \GND\, B_DIN(15) => \GND\, B_DIN(14) => \GND\, 
        B_DIN(13) => \GND\, B_DIN(12) => \GND\, B_DIN(11) => 
        \GND\, B_DIN(10) => \GND\, B_DIN(9) => \GND\, B_DIN(8)
         => \GND\, B_DIN(7) => \GND\, B_DIN(6) => \GND\, B_DIN(5)
         => \GND\, B_DIN(4) => \GND\, B_DIN(3) => \GND\, B_DIN(2)
         => \GND\, B_DIN(1) => \GND\, B_DIN(0) => W_DATA(4), 
        B_REN => \VCC\, B_WEN(1) => \GND\, B_WEN(0) => \VCC\, 
        B_DOUT_EN => \VCC\, B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N
         => \VCC\, ECC_EN => \GND\, BUSY_FB => \GND\, A_WIDTH(2)
         => \GND\, A_WIDTH(1) => \GND\, A_WIDTH(0) => \GND\, 
        A_WMODE(1) => \GND\, A_WMODE(0) => \GND\, A_BYPASS => 
        \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1) => \GND\, 
        B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, B_WMODE(0) => 
        \GND\, B_BYPASS => \VCC\, ECC_BYPASS => \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C7 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%7%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1507, A_DOUT(18) => nc664, 
        A_DOUT(17) => nc1189, A_DOUT(16) => nc1059, A_DOUT(15)
         => nc909, A_DOUT(14) => nc1463, A_DOUT(13) => nc1037, 
        A_DOUT(12) => nc1001, A_DOUT(11) => nc349, A_DOUT(10) => 
        nc294, A_DOUT(9) => nc915, A_DOUT(8) => nc559, A_DOUT(7)
         => nc163, A_DOUT(6) => nc101, A_DOUT(5) => nc107, 
        A_DOUT(4) => nc1391, A_DOUT(3) => nc821, A_DOUT(2) => 
        nc1452, A_DOUT(1) => nc919, A_DOUT(0) => 
        \R_DATA_TEMPR2[7]\, B_DOUT(19) => nc186, B_DOUT(18) => 
        nc190, B_DOUT(17) => nc28, B_DOUT(16) => nc888, 
        B_DOUT(15) => nc271, B_DOUT(14) => nc442, B_DOUT(13) => 
        nc1233, B_DOUT(12) => nc983, B_DOUT(11) => nc175, 
        B_DOUT(10) => nc209, B_DOUT(9) => nc947, B_DOUT(8) => 
        nc635, B_DOUT(7) => nc595, B_DOUT(6) => nc225, B_DOUT(5)
         => nc111, B_DOUT(4) => nc117, B_DOUT(3) => nc398, 
        B_DOUT(2) => nc1437, B_DOUT(1) => nc774, B_DOUT(0) => 
        nc370, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[2][7]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(7), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[0]\ : OR3
      port map(A => \R_DATA_TEMPR0[0]\, B => \R_DATA_TEMPR1[0]\, 
        C => \R_DATA_TEMPR2[0]\, Y => R_DATA(0));
    
    \OR3_R_DATA[2]\ : OR3
      port map(A => \R_DATA_TEMPR0[2]\, B => \R_DATA_TEMPR1[2]\, 
        C => \R_DATA_TEMPR2[2]\, Y => R_DATA(2));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C0 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%0%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1216, A_DOUT(18) => nc531, 
        A_DOUT(17) => nc1490, A_DOUT(16) => nc1628, A_DOUT(15)
         => nc1276, A_DOUT(14) => nc1282, A_DOUT(13) => nc991, 
        A_DOUT(12) => nc219, A_DOUT(11) => nc1237, A_DOUT(10) => 
        nc1523, A_DOUT(9) => nc763, A_DOUT(8) => nc468, A_DOUT(7)
         => nc49, A_DOUT(6) => nc64, A_DOUT(5) => nc782, 
        A_DOUT(4) => nc156, A_DOUT(3) => nc1192, A_DOUT(2) => 
        nc641, A_DOUT(1) => nc25, A_DOUT(0) => \R_DATA_TEMPR0[0]\, 
        B_DOUT(19) => nc1383, B_DOUT(18) => nc990, B_DOUT(17) => 
        nc858, B_DOUT(16) => nc1234, B_DOUT(15) => nc1028, 
        B_DOUT(14) => nc953, B_DOUT(13) => nc1590, B_DOUT(12) => 
        nc142, B_DOUT(11) => nc1458, B_DOUT(10) => nc78, 
        B_DOUT(9) => nc1554, B_DOUT(8) => nc58, B_DOUT(7) => 
        nc222, B_DOUT(6) => nc134, B_DOUT(5) => nc1095, B_DOUT(4)
         => nc1546, B_DOUT(3) => nc433, B_DOUT(2) => nc1356, 
        B_DOUT(1) => nc908, B_DOUT(0) => nc638, DB_DETECT => OPEN, 
        SB_CORRECT => OPEN, ACCESS_BUSY => \ACCESS_BUSY[0][0]\, 
        A_ADDR(13) => R_ADDR(13), A_ADDR(12) => R_ADDR(12), 
        A_ADDR(11) => R_ADDR(11), A_ADDR(10) => R_ADDR(10), 
        A_ADDR(9) => R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7)
         => R_ADDR(7), A_ADDR(6) => R_ADDR(6), A_ADDR(5) => 
        R_ADDR(5), A_ADDR(4) => R_ADDR(4), A_ADDR(3) => R_ADDR(3), 
        A_ADDR(2) => R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0)
         => R_ADDR(0), A_BLK_EN(2) => R_EN, A_BLK_EN(1) => 
        \BLKY1[0]\, A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, 
        A_DIN(19) => \GND\, A_DIN(18) => \GND\, A_DIN(17) => 
        \GND\, A_DIN(16) => \GND\, A_DIN(15) => \GND\, A_DIN(14)
         => \GND\, A_DIN(13) => \GND\, A_DIN(12) => \GND\, 
        A_DIN(11) => \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, 
        A_DIN(8) => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, 
        A_DIN(5) => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, 
        A_DIN(2) => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, 
        A_REN => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(0), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[12]\ : OR3
      port map(A => \R_DATA_TEMPR0[12]\, B => \R_DATA_TEMPR1[12]\, 
        C => \R_DATA_TEMPR2[12]\, Y => R_DATA(12));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C13 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%13%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc497, A_DOUT(18) => nc1484, 
        A_DOUT(17) => nc752, A_DOUT(16) => nc534, A_DOUT(15) => 
        nc236, A_DOUT(14) => nc1369, A_DOUT(13) => nc922, 
        A_DOUT(12) => nc1304, A_DOUT(11) => nc918, A_DOUT(10) => 
        nc14, A_DOUT(9) => nc701, A_DOUT(8) => nc37, A_DOUT(7)
         => nc1622, A_DOUT(6) => nc237, A_DOUT(5) => nc1483, 
        A_DOUT(4) => nc642, A_DOUT(3) => nc1114, A_DOUT(2) => 
        nc885, A_DOUT(1) => nc375, A_DOUT(0) => 
        \R_DATA_TEMPR0[13]\, B_DOUT(19) => nc75, B_DOUT(18) => 
        nc278, B_DOUT(17) => nc392, B_DOUT(16) => nc496, 
        B_DOUT(15) => nc1090, B_DOUT(14) => nc55, B_DOUT(13) => 
        nc1345, B_DOUT(12) => nc1174, B_DOUT(11) => nc96, 
        B_DOUT(10) => nc785, B_DOUT(9) => nc1022, B_DOUT(8) => 
        nc822, B_DOUT(7) => nc1024, B_DOUT(6) => nc636, B_DOUT(5)
         => nc711, B_DOUT(4) => nc377, B_DOUT(3) => nc1627, 
        B_DOUT(2) => nc1595, B_DOUT(1) => nc1128, B_DOUT(0) => 
        nc188, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[0][13]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(13), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[13]\ : OR3
      port map(A => \R_DATA_TEMPR0[13]\, B => \R_DATA_TEMPR1[13]\, 
        C => \R_DATA_TEMPR2[13]\, Y => R_DATA(13));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C8 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%8%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc607, A_DOUT(18) => nc1009, 
        A_DOUT(17) => nc386, A_DOUT(16) => nc1317, A_DOUT(15) => 
        nc399, A_DOUT(14) => nc1377, A_DOUT(13) => nc630, 
        A_DOUT(12) => nc439, A_DOUT(11) => nc1638, A_DOUT(10) => 
        nc274, A_DOUT(9) => nc617, A_DOUT(8) => nc203, A_DOUT(7)
         => nc1111, A_DOUT(6) => nc304, A_DOUT(5) => nc1533, 
        A_DOUT(4) => nc855, A_DOUT(3) => nc1171, A_DOUT(2) => 
        nc689, A_DOUT(1) => nc1402, A_DOUT(0) => 
        \R_DATA_TEMPR2[8]\, B_DOUT(19) => nc492, B_DOUT(18) => 
        nc755, B_DOUT(17) => nc997, B_DOUT(16) => nc644, 
        B_DOUT(15) => nc1145, B_DOUT(14) => nc170, B_DOUT(13) => 
        nc560, B_DOUT(12) => nc1038, B_DOUT(11) => nc158, 
        B_DOUT(10) => nc213, B_DOUT(9) => nc575, B_DOUT(8) => 
        nc314, B_DOUT(7) => nc925, B_DOUT(6) => nc356, B_DOUT(5)
         => nc378, B_DOUT(4) => nc1527, B_DOUT(3) => nc143, 
        B_DOUT(2) => nc971, B_DOUT(1) => nc986, B_DOUT(0) => 
        nc929, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[2][8]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(8), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C7 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%7%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc69, A_DOUT(18) => nc1021, 
        A_DOUT(17) => nc1351, A_DOUT(16) => nc1605, A_DOUT(15)
         => nc691, A_DOUT(14) => nc659, A_DOUT(13) => nc831, 
        A_DOUT(12) => nc121, A_DOUT(11) => nc47, A_DOUT(10) => 
        nc1465, A_DOUT(9) => nc127, A_DOUT(8) => nc1461, 
        A_DOUT(7) => nc970, A_DOUT(6) => nc381, A_DOUT(5) => 
        nc235, A_DOUT(4) => nc1016, A_DOUT(3) => nc192, A_DOUT(2)
         => nc509, A_DOUT(1) => nc1076, A_DOUT(0) => 
        \R_DATA_TEMPR0[7]\, B_DOUT(19) => nc1389, B_DOUT(18) => 
        nc229, B_DOUT(17) => nc1408, B_DOUT(16) => nc1632, 
        B_DOUT(15) => nc1504, B_DOUT(14) => nc1450, B_DOUT(13)
         => nc743, B_DOUT(12) => nc448, B_DOUT(11) => nc484, 
        B_DOUT(10) => nc1306, B_DOUT(9) => nc1032, B_DOUT(8) => 
        nc1034, B_DOUT(7) => nc956, B_DOUT(6) => nc1268, 
        B_DOUT(5) => nc519, B_DOUT(4) => nc568, B_DOUT(3) => 
        nc477, B_DOUT(2) => nc1637, B_DOUT(1) => nc1138, 
        B_DOUT(0) => nc1348, DB_DETECT => OPEN, SB_CORRECT => 
        OPEN, ACCESS_BUSY => \ACCESS_BUSY[0][7]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(7), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C12 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%12%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1152, A_DOUT(18) => nc19, 
        A_DOUT(17) => nc1550, A_DOUT(16) => nc351, A_DOUT(15) => 
        nc260, A_DOUT(14) => nc692, A_DOUT(13) => nc1600, 
        A_DOUT(12) => nc232, A_DOUT(11) => nc372, A_DOUT(10) => 
        nc476, A_DOUT(9) => nc1055, A_DOUT(8) => nc106, A_DOUT(7)
         => nc454, A_DOUT(6) => nc1599, A_DOUT(5) => nc20, 
        A_DOUT(4) => nc808, A_DOUT(3) => nc566, A_DOUT(2) => 
        nc1310, A_DOUT(1) => nc903, A_DOUT(0) => 
        \R_DATA_TEMPR0[12]\, B_DOUT(19) => nc481, B_DOUT(18) => 
        nc1370, B_DOUT(17) => nc880, B_DOUT(16) => nc928, 
        B_DOUT(15) => nc883, B_DOUT(14) => nc116, B_DOUT(13) => 
        nc363, B_DOUT(12) => nc465, B_DOUT(11) => nc1537, 
        B_DOUT(10) => nc932, B_DOUT(9) => nc379, B_DOUT(8) => 
        nc21, B_DOUT(7) => nc818, B_DOUT(6) => nc913, B_DOUT(5)
         => nc94, B_DOUT(4) => nc663, B_DOUT(3) => nc1266, 
        B_DOUT(2) => nc1324, B_DOUT(1) => nc1050, B_DOUT(0) => 
        nc694, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[0][12]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(12), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C9 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%9%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1031, A_DOUT(18) => nc721, 
        A_DOUT(17) => nc1143, A_DOUT(16) => nc702, A_DOUT(15) => 
        nc472, A_DOUT(14) => nc832, A_DOUT(13) => nc977, 
        A_DOUT(12) => nc1555, A_DOUT(11) => nc451, A_DOUT(10) => 
        nc1485, A_DOUT(9) => nc850, A_DOUT(8) => nc1342, 
        A_DOUT(7) => nc193, A_DOUT(6) => nc1481, A_DOUT(5) => 
        nc1043, A_DOUT(4) => nc864, A_DOUT(3) => nc853, A_DOUT(2)
         => nc887, A_DOUT(1) => nc627, A_DOUT(0) => 
        \R_DATA_TEMPR0[9]\, B_DOUT(19) => nc70, B_DOUT(18) => 
        nc712, B_DOUT(17) => nc50, B_DOUT(16) => nc1299, 
        B_DOUT(15) => nc1029, B_DOUT(14) => nc768, B_DOUT(13) => 
        nc1240, B_DOUT(12) => nc1301, B_DOUT(11) => nc67, 
        B_DOUT(10) => nc540, B_DOUT(9) => nc789, B_DOUT(8) => 
        nc563, B_DOUT(7) => nc71, B_DOUT(6) => nc1288, B_DOUT(5)
         => nc671, B_DOUT(4) => nc223, B_DOUT(3) => nc51, 
        B_DOUT(2) => nc324, B_DOUT(1) => nc1422, B_DOUT(0) => 
        nc1592, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][9]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(9), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C9 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%9%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1598, A_DOUT(18) => nc1241, 
        A_DOUT(17) => nc172, A_DOUT(16) => nc935, A_DOUT(15) => 
        nc793, A_DOUT(14) => nc498, A_DOUT(13) => nc1400, 
        A_DOUT(12) => nc857, A_DOUT(11) => nc805, A_DOUT(10) => 
        nc705, A_DOUT(9) => nc886, A_DOUT(8) => nc1164, A_DOUT(7)
         => nc939, A_DOUT(6) => nc1499, A_DOUT(5) => nc1245, 
        A_DOUT(4) => nc108, A_DOUT(3) => nc1102, A_DOUT(2) => 
        nc815, A_DOUT(1) => nc759, A_DOUT(0) => 
        \R_DATA_TEMPR2[9]\, B_DOUT(19) => nc665, B_DOUT(18) => 
        nc131, B_DOUT(17) => nc1147, B_DOUT(16) => nc306, 
        B_DOUT(15) => nc137, B_DOUT(14) => nc715, B_DOUT(13) => 
        nc1516, B_DOUT(12) => nc889, B_DOUT(11) => nc1625, 
        B_DOUT(10) => nc1500, B_DOUT(9) => nc17, B_DOUT(8) => 
        nc1576, B_DOUT(7) => nc1196, B_DOUT(6) => nc1140, 
        B_DOUT(5) => nc1367, B_DOUT(4) => nc672, B_DOUT(3) => 
        nc118, B_DOUT(2) => nc561, B_DOUT(1) => nc239, B_DOUT(0)
         => nc1591, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][9]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(9), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C13 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%13%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1334, A_DOUT(18) => nc1005, 
        A_DOUT(17) => nc529, A_DOUT(16) => nc609, A_DOUT(15) => 
        nc582, A_DOUT(14) => nc548, A_DOUT(13) => nc316, 
        A_DOUT(12) => nc1619, A_DOUT(11) => nc1428, A_DOUT(10)
         => nc1286, A_DOUT(9) => nc1524, A_DOUT(8) => nc856, 
        A_DOUT(7) => nc1161, A_DOUT(6) => nc1496, A_DOUT(5) => 
        nc1326, A_DOUT(4) => nc240, A_DOUT(3) => nc1315, 
        A_DOUT(2) => nc1199, A_DOUT(1) => nc619, A_DOUT(0) => 
        \R_DATA_TEMPR1[13]\, B_DOUT(19) => nc1375, B_DOUT(18) => 
        nc859, B_DOUT(17) => nc99, B_DOUT(16) => nc1047, 
        B_DOUT(15) => nc88, B_DOUT(14) => nc480, B_DOUT(13) => 
        nc1039, B_DOUT(12) => nc164, B_DOUT(11) => nc906, 
        B_DOUT(10) => nc1000, B_DOUT(9) => nc463, B_DOUT(8) => 
        nc546, B_DOUT(7) => nc674, B_DOUT(6) => nc668, B_DOUT(5)
         => nc552, B_DOUT(4) => nc1620, B_DOUT(3) => nc1559, 
        B_DOUT(2) => nc1243, B_DOUT(1) => nc1505, B_DOUT(0) => 
        nc301, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[1][13]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(13), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C9 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%9%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1432, A_DOUT(18) => nc916, 
        A_DOUT(17) => nc564, A_DOUT(16) => nc126, A_DOUT(15) => 
        nc266, A_DOUT(14) => nc343, A_DOUT(13) => nc445, 
        A_DOUT(12) => nc22, A_DOUT(11) => nc938, A_DOUT(10) => 
        nc828, A_DOUT(9) => nc923, A_DOUT(8) => nc173, A_DOUT(7)
         => nc1447, A_DOUT(6) => nc643, A_DOUT(5) => nc1066, 
        A_DOUT(4) => nc1115, A_DOUT(3) => nc267, A_DOUT(2) => 
        nc85, A_DOUT(1) => nc1175, A_DOUT(0) => 
        \R_DATA_TEMPR1[9]\, B_DOUT(19) => nc404, B_DOUT(18) => 
        nc450, B_DOUT(17) => nc311, B_DOUT(16) => nc1292, 
        B_DOUT(15) => nc1247, B_DOUT(14) => nc590, B_DOUT(13) => 
        nc731, B_DOUT(12) => nc666, B_DOUT(11) => nc1184, 
        B_DOUT(10) => nc1244, B_DOUT(9) => nc844, B_DOUT(8) => 
        nc414, B_DOUT(7) => nc1635, B_DOUT(6) => nc1393, 
        B_DOUT(5) => nc722, B_DOUT(4) => nc587, B_DOUT(3) => 
        nc748, B_DOUT(2) => nc660, B_DOUT(1) => nc469, B_DOUT(0)
         => nc773, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][9]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(9), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C11 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%11%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc637, A_DOUT(18) => nc478, 
        A_DOUT(17) => nc1259, A_DOUT(16) => nc1387, A_DOUT(15)
         => nc1438, A_DOUT(14) => nc72, A_DOUT(13) => nc1534, 
        A_DOUT(12) => nc52, A_DOUT(11) => nc543, A_DOUT(10) => 
        nc401, A_DOUT(9) => nc800, A_DOUT(8) => nc1181, A_DOUT(7)
         => nc1336, A_DOUT(6) => nc233, A_DOUT(5) => nc1360, 
        A_DOUT(4) => nc803, A_DOUT(3) => nc1321, A_DOUT(2) => 
        nc334, A_DOUT(1) => nc1494, A_DOUT(0) => 
        \R_DATA_TEMPR0[11]\, B_DOUT(19) => nc1552, B_DOUT(18) => 
        nc1558, B_DOUT(17) => nc780, B_DOUT(16) => nc557, 
        B_DOUT(15) => nc411, B_DOUT(14) => nc810, B_DOUT(13) => 
        nc598, B_DOUT(12) => nc1318, B_DOUT(11) => nc1378, 
        B_DOUT(10) => nc1493, B_DOUT(9) => nc813, B_DOUT(8) => 
        nc1420, B_DOUT(7) => nc825, B_DOUT(6) => nc1630, 
        B_DOUT(5) => nc1459, B_DOUT(4) => nc645, B_DOUT(3) => 
        nc861, B_DOUT(2) => nc725, B_DOUT(1) => nc290, B_DOUT(0)
         => nc189, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][11]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(11), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C12 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%12%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc265, A_DOUT(18) => nc128, 
        A_DOUT(17) => nc807, A_DOUT(16) => nc541, A_DOUT(15) => 
        nc1156, A_DOUT(14) => nc1122, A_DOUT(13) => nc786, 
        A_DOUT(12) => nc97, A_DOUT(11) => nc750, A_DOUT(10) => 
        nc326, A_DOUT(9) => nc1086, A_DOUT(8) => nc596, A_DOUT(7)
         => nc1551, A_DOUT(6) => nc1520, A_DOUT(5) => nc1543, 
        A_DOUT(4) => nc539, A_DOUT(3) => nc817, A_DOUT(2) => 
        nc709, A_DOUT(1) => nc1509, A_DOUT(0) => 
        \R_DATA_TEMPR1[12]\, B_DOUT(19) => nc1025, B_DOUT(18) => 
        nc393, B_DOUT(17) => nc495, B_DOUT(16) => nc1456, 
        B_DOUT(15) => nc629, B_DOUT(14) => nc1048, B_DOUT(13) => 
        nc1613, B_DOUT(12) => nc693, B_DOUT(11) => nc159, 
        B_DOUT(10) => nc1159, B_DOUT(9) => nc144, B_DOUT(8) => 
        nc719, B_DOUT(7) => nc1113, B_DOUT(6) => nc1173, 
        B_DOUT(5) => nc756, B_DOUT(4) => nc443, B_DOUT(3) => 
        nc806, B_DOUT(2) => nc648, B_DOUT(1) => nc262, B_DOUT(0)
         => nc1312, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][12]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(12), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C3 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%3%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc570, A_DOUT(18) => nc1372, 
        A_DOUT(17) => nc1013, A_DOUT(16) => nc1073, A_DOUT(15)
         => nc926, A_DOUT(14) => nc894, A_DOUT(13) => nc544, 
        A_DOUT(12) => nc1020, A_DOUT(11) => nc246, A_DOUT(10) => 
        nc1331, A_DOUT(9) => nc816, A_DOUT(8) => nc809, A_DOUT(7)
         => nc1210, A_DOUT(6) => nc798, A_DOUT(5) => nc1380, 
        A_DOUT(4) => nc1270, A_DOUT(3) => nc136, A_DOUT(2) => 
        nc23, A_DOUT(1) => nc1525, A_DOUT(0) => 
        \R_DATA_TEMPR0[3]\, B_DOUT(19) => nc962, B_DOUT(18) => 
        nc838, B_DOUT(17) => nc247, B_DOUT(16) => nc1566, 
        B_DOUT(15) => nc933, B_DOUT(14) => nc321, B_DOUT(13) => 
        nc1399, B_DOUT(12) => nc1209, B_DOUT(11) => nc593, 
        B_DOUT(10) => nc502, B_DOUT(9) => nc1042, B_DOUT(8) => 
        nc984, B_DOUT(7) => nc819, B_DOUT(6) => nc646, B_DOUT(5)
         => nc1252, B_DOUT(4) => nc1044, B_DOUT(3) => nc1211, 
        B_DOUT(2) => nc1430, B_DOUT(1) => nc1271, B_DOUT(0) => 
        nc1148, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][3]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(3), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C10 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%10%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc862, A_DOUT(18) => nc424, 
        A_DOUT(17) => nc512, A_DOUT(16) => nc1502, A_DOUT(15) => 
        nc1508, A_DOUT(14) => nc640, A_DOUT(13) => nc449, 
        A_DOUT(12) => nc1353, A_DOUT(11) => nc80, A_DOUT(10) => 
        nc732, A_DOUT(9) => nc1132, A_DOUT(8) => nc400, A_DOUT(7)
         => nc1365, A_DOUT(6) => nc1215, A_DOUT(5) => nc1275, 
        A_DOUT(4) => nc787, A_DOUT(3) => nc1530, A_DOUT(2) => 
        nc578, A_DOUT(1) => nc1117, A_DOUT(0) => 
        \R_DATA_TEMPR0[10]\, B_DOUT(19) => nc695, B_DOUT(18) => 
        nc1177, B_DOUT(17) => nc954, B_DOUT(16) => nc1409, 
        B_DOUT(15) => nc73, B_DOUT(14) => nc81, B_DOUT(13) => 
        nc1110, B_DOUT(12) => nc53, B_DOUT(11) => nc410, 
        B_DOUT(10) => nc1170, B_DOUT(9) => nc1035, B_DOUT(8) => 
        nc270, B_DOUT(7) => nc591, B_DOUT(6) => nc1611, B_DOUT(5)
         => nc421, B_DOUT(4) => nc1454, B_DOUT(3) => nc820, 
        B_DOUT(2) => nc1547, B_DOUT(1) => nc1106, B_DOUT(0) => 
        nc965, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[0][10]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(10), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C6 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%6%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc823, A_DOUT(18) => nc1501, 
        A_DOUT(17) => nc576, A_DOUT(16) => nc1165, A_DOUT(15) => 
        nc757, A_DOUT(14) => nc1041, A_DOUT(13) => nc1453, 
        A_DOUT(12) => nc969, A_DOUT(11) => nc841, A_DOUT(10) => 
        nc1017, A_DOUT(9) => nc1406, A_DOUT(8) => nc1030, 
        A_DOUT(7) => nc835, A_DOUT(6) => nc1077, A_DOUT(5) => 
        nc245, A_DOUT(4) => nc161, A_DOUT(3) => nc373, A_DOUT(2)
         => nc475, A_DOUT(1) => nc735, A_DOUT(0) => 
        \R_DATA_TEMPR2[6]\, B_DOUT(19) => nc167, B_DOUT(18) => 
        nc281, B_DOUT(17) => nc194, B_DOUT(16) => nc507, 
        B_DOUT(15) => nc185, B_DOUT(14) => nc1495, B_DOUT(13) => 
        nc1109, B_DOUT(12) => nc673, B_DOUT(11) => nc1535, 
        B_DOUT(10) => nc493, B_DOUT(9) => nc138, B_DOUT(8) => 
        nc1606, B_DOUT(7) => nc1491, B_DOUT(6) => nc698, 
        B_DOUT(5) => nc269, B_DOUT(4) => nc1586, B_DOUT(3) => 
        nc1213, B_DOUT(2) => nc784, B_DOUT(1) => nc380, B_DOUT(0)
         => nc1273, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[2][6]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(6), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \OR3_R_DATA[10]\ : OR3
      port map(A => \R_DATA_TEMPR0[10]\, B => \R_DATA_TEMPR1[10]\, 
        C => \R_DATA_TEMPR2[10]\, Y => R_DATA(10));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C2 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%2%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc336, A_DOUT(18) => nc827, 
        A_DOUT(17) => nc517, A_DOUT(16) => nc594, A_DOUT(15) => 
        nc296, A_DOUT(14) => nc1417, A_DOUT(13) => nc1477, 
        A_DOUT(12) => nc874, A_DOUT(11) => nc1298, A_DOUT(10) => 
        nc639, A_DOUT(9) => nc729, A_DOUT(8) => nc297, A_DOUT(7)
         => nc1529, A_DOUT(6) => nc1217, A_DOUT(5) => nc778, 
        A_DOUT(4) => nc700, A_DOUT(3) => nc251, A_DOUT(2) => 
        nc1277, A_DOUT(1) => nc155, A_DOUT(0) => 
        \R_DATA_TEMPR0[2]\, B_DOUT(19) => nc242, B_DOUT(18) => 
        nc1385, B_DOUT(17) => nc696, B_DOUT(16) => nc1214, 
        B_DOUT(15) => nc754, B_DOUT(14) => nc573, B_DOUT(13) => 
        nc350, B_DOUT(12) => nc1202, B_DOUT(11) => nc1368, 
        B_DOUT(10) => nc1274, B_DOUT(9) => nc710, B_DOUT(8) => 
        nc826, B_DOUT(7) => nc109, B_DOUT(6) => nc936, B_DOUT(5)
         => nc690, B_DOUT(4) => nc499, B_DOUT(3) => nc942, 
        B_DOUT(2) => nc1303, B_DOUT(1) => nc968, B_DOUT(0) => 
        nc706, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[0][2]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(2), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C1 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%1%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc829, A_DOUT(18) => nc1359, 
        A_DOUT(17) => nc119, A_DOUT(16) => nc331, A_DOUT(15) => 
        nc1344, A_DOUT(14) => nc38, A_DOUT(13) => nc842, 
        A_DOUT(12) => nc385, A_DOUT(11) => nc288, A_DOUT(10) => 
        nc1185, A_DOUT(9) => nc675, A_DOUT(8) => nc1229, 
        A_DOUT(7) => nc1296, A_DOUT(6) => nc761, A_DOUT(5) => 
        nc716, A_DOUT(4) => nc522, A_DOUT(3) => nc434, A_DOUT(2)
         => nc387, A_DOUT(1) => nc571, A_DOUT(0) => 
        \R_DATA_TEMPR0[1]\, B_DOUT(19) => nc1404, B_DOUT(18) => 
        nc1049, B_DOUT(17) => nc667, B_DOUT(16) => nc1522, 
        B_DOUT(15) => nc1528, B_DOUT(14) => nc1163, B_DOUT(13)
         => nc891, B_DOUT(12) => nc2, B_DOUT(11) => nc82, 
        B_DOUT(10) => nc1403, B_DOUT(9) => nc284, B_DOUT(8) => 
        nc420, B_DOUT(7) => nc35, B_DOUT(6) => nc295, B_DOUT(5)
         => nc355, B_DOUT(4) => nc258, B_DOUT(3) => nc1362, 
        B_DOUT(2) => nc1618, B_DOUT(1) => nc1063, B_DOUT(0) => 
        nc1442, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][1]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(1), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \INVBLKY0[0]\ : INV
      port map(A => R_ADDR(14), Y => \BLKY0[0]\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C4 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%4%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc263, A_DOUT(18) => nc180, 
        A_DOUT(17) => nc364, A_DOUT(16) => nc1539, A_DOUT(15) => 
        nc1429, A_DOUT(14) => nc1513, A_DOUT(13) => nc357, 
        A_DOUT(12) => nc174, A_DOUT(11) => nc945, A_DOUT(10) => 
        nc1573, A_DOUT(9) => nc585, A_DOUT(8) => nc1260, 
        A_DOUT(7) => nc431, A_DOUT(6) => nc830, A_DOUT(5) => 
        nc473, A_DOUT(4) => nc678, A_DOUT(3) => nc388, A_DOUT(2)
         => nc904, A_DOUT(1) => nc833, A_DOUT(0) => 
        \R_DATA_TEMPR2[4]\, B_DOUT(19) => nc1018, B_DOUT(18) => 
        nc949, B_DOUT(17) => nc1126, B_DOUT(16) => nc1078, 
        B_DOUT(15) => nc981, B_DOUT(14) => nc254, B_DOUT(13) => 
        nc1388, B_DOUT(12) => nc574, B_DOUT(11) => nc1521, 
        B_DOUT(10) => nc141, B_DOUT(9) => nc276, B_DOUT(8) => 
        nc1261, B_DOUT(7) => nc147, B_DOUT(6) => nc1194, 
        B_DOUT(5) => nc914, B_DOUT(4) => nc48, B_DOUT(3) => nc7, 
        B_DOUT(2) => nc5, B_DOUT(1) => nc150, B_DOUT(0) => nc277, 
        DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY => 
        \ACCESS_BUSY[2][4]\, A_ADDR(13) => R_ADDR(13), A_ADDR(12)
         => R_ADDR(12), A_ADDR(11) => R_ADDR(11), A_ADDR(10) => 
        R_ADDR(10), A_ADDR(9) => R_ADDR(9), A_ADDR(8) => 
        R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6) => R_ADDR(6), 
        A_ADDR(5) => R_ADDR(5), A_ADDR(4) => R_ADDR(4), A_ADDR(3)
         => R_ADDR(3), A_ADDR(2) => R_ADDR(2), A_ADDR(1) => 
        R_ADDR(1), A_ADDR(0) => R_ADDR(0), A_BLK_EN(2) => R_EN, 
        A_BLK_EN(1) => R_ADDR(15), A_BLK_EN(0) => \BLKY0[0]\, 
        A_CLK => R_CLK, A_DIN(19) => \GND\, A_DIN(18) => \GND\, 
        A_DIN(17) => \GND\, A_DIN(16) => \GND\, A_DIN(15) => 
        \GND\, A_DIN(14) => \GND\, A_DIN(13) => \GND\, A_DIN(12)
         => \GND\, A_DIN(11) => \GND\, A_DIN(10) => \GND\, 
        A_DIN(9) => \GND\, A_DIN(8) => \GND\, A_DIN(7) => \GND\, 
        A_DIN(6) => \GND\, A_DIN(5) => \GND\, A_DIN(4) => \GND\, 
        A_DIN(3) => \GND\, A_DIN(2) => \GND\, A_DIN(1) => \GND\, 
        A_DIN(0) => \GND\, A_REN => \VCC\, A_WEN(1) => \GND\, 
        A_WEN(0) => \GND\, A_DOUT_EN => \VCC\, A_DOUT_ARST_N => 
        \VCC\, A_DOUT_SRST_N => \VCC\, B_ADDR(13) => W_ADDR(13), 
        B_ADDR(12) => W_ADDR(12), B_ADDR(11) => W_ADDR(11), 
        B_ADDR(10) => W_ADDR(10), B_ADDR(9) => W_ADDR(9), 
        B_ADDR(8) => W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6)
         => W_ADDR(6), B_ADDR(5) => W_ADDR(5), B_ADDR(4) => 
        W_ADDR(4), B_ADDR(3) => W_ADDR(3), B_ADDR(2) => W_ADDR(2), 
        B_ADDR(1) => W_ADDR(1), B_ADDR(0) => W_ADDR(0), 
        B_BLK_EN(2) => W_EN, B_BLK_EN(1) => W_ADDR(15), 
        B_BLK_EN(0) => \BLKX0[0]\, B_CLK => W_CLK, B_DIN(19) => 
        \GND\, B_DIN(18) => \GND\, B_DIN(17) => \GND\, B_DIN(16)
         => \GND\, B_DIN(15) => \GND\, B_DIN(14) => \GND\, 
        B_DIN(13) => \GND\, B_DIN(12) => \GND\, B_DIN(11) => 
        \GND\, B_DIN(10) => \GND\, B_DIN(9) => \GND\, B_DIN(8)
         => \GND\, B_DIN(7) => \GND\, B_DIN(6) => \GND\, B_DIN(5)
         => \GND\, B_DIN(4) => \GND\, B_DIN(3) => \GND\, B_DIN(2)
         => \GND\, B_DIN(1) => \GND\, B_DIN(0) => W_DATA(4), 
        B_REN => \VCC\, B_WEN(1) => \GND\, B_WEN(0) => \VCC\, 
        B_DOUT_EN => \VCC\, B_DOUT_ARST_N => \GND\, B_DOUT_SRST_N
         => \VCC\, ECC_EN => \GND\, BUSY_FB => \GND\, A_WIDTH(2)
         => \GND\, A_WIDTH(1) => \GND\, A_WIDTH(0) => \GND\, 
        A_WMODE(1) => \GND\, A_WMODE(0) => \GND\, A_BYPASS => 
        \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1) => \GND\, 
        B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, B_WMODE(0) => 
        \GND\, B_BYPASS => \VCC\, ECC_BYPASS => \GND\);
    
    \OR3_R_DATA[4]\ : OR3
      port map(A => \R_DATA_TEMPR0[4]\, B => \R_DATA_TEMPR1[4]\, 
        C => \R_DATA_TEMPR2[4]\, Y => R_DATA(4));
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C11 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%11%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc292, A_DOUT(18) => nc1455, 
        A_DOUT(17) => nc1426, A_DOUT(16) => nc980, A_DOUT(15) => 
        nc249, A_DOUT(14) => nc707, A_DOUT(13) => nc555, 
        A_DOUT(12) => nc1451, A_DOUT(11) => nc527, A_DOUT(10) => 
        nc1129, A_DOUT(9) => nc676, A_DOUT(8) => nc1265, 
        A_DOUT(7) => nc358, A_DOUT(6) => nc1448, A_DOUT(5) => 
        nc1397, A_DOUT(4) => nc1544, A_DOUT(3) => nc1626, 
        A_DOUT(2) => nc837, A_DOUT(1) => nc569, A_DOUT(0) => 
        \R_DATA_TEMPR1[11]\, B_DOUT(19) => nc1239, B_DOUT(18) => 
        nc1167, B_DOUT(17) => nc951, B_DOUT(16) => nc1612, 
        B_DOUT(15) => nc1346, B_DOUT(14) => nc717, B_DOUT(13) => 
        nc992, B_DOUT(12) => nc487, B_DOUT(11) => nc1160, 
        B_DOUT(10) => nc1191, B_DOUT(9) => nc1258, B_DOUT(8) => 
        nc670, B_DOUT(7) => nc479, B_DOUT(6) => nc1012, B_DOUT(5)
         => nc45, B_DOUT(4) => nc1072, B_DOUT(3) => nc1014, 
        B_DOUT(2) => nc739, B_DOUT(1) => nc1074, B_DOUT(0) => 
        nc1617, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][11]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(11), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R0C6 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%0%6%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc1118, A_DOUT(18) => nc950, 
        A_DOUT(17) => nc1309, A_DOUT(16) => nc1532, A_DOUT(15)
         => nc1178, A_DOUT(14) => nc1538, A_DOUT(13) => nc892, 
        A_DOUT(12) => nc720, A_DOUT(11) => nc1183, A_DOUT(10) => 
        nc382, A_DOUT(9) => nc486, A_DOUT(8) => nc1382, A_DOUT(7)
         => nc1222, A_DOUT(6) => nc836, A_DOUT(5) => nc201, 
        A_DOUT(4) => nc948, A_DOUT(3) => nc105, A_DOUT(2) => 
        nc1067, A_DOUT(1) => nc1439, A_DOUT(0) => 
        \R_DATA_TEMPR0[6]\, B_DOUT(19) => nc1083, B_DOUT(18) => 
        nc457, B_DOUT(17) => nc166, B_DOUT(16) => nc26, 
        B_DOUT(15) => nc868, B_DOUT(14) => nc129, B_DOUT(13) => 
        nc963, B_DOUT(12) => nc704, B_DOUT(11) => nc300, 
        B_DOUT(10) => nc1280, B_DOUT(9) => nc389, B_DOUT(8) => 
        nc1323, B_DOUT(7) => nc839, B_DOUT(6) => nc211, B_DOUT(5)
         => nc1136, B_DOUT(4) => nc115, B_DOUT(3) => nc1096, 
        B_DOUT(2) => nc871, B_DOUT(1) => nc726, B_DOUT(0) => 
        nc1263, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[0][6]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(6), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C7 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%7%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc741, A_DOUT(18) => nc1531, 
        A_DOUT(17) => nc1517, A_DOUT(16) => nc1577, A_DOUT(15)
         => nc1256, A_DOUT(14) => nc275, A_DOUT(13) => nc352, 
        A_DOUT(12) => nc456, A_DOUT(11) => nc714, A_DOUT(10) => 
        nc310, A_DOUT(9) => nc482, A_DOUT(8) => nc1467, A_DOUT(7)
         => nc532, A_DOUT(6) => nc1281, A_DOUT(5) => nc995, 
        A_DOUT(4) => nc987, A_DOUT(3) => nc1011, A_DOUT(2) => 
        nc1436, A_DOUT(1) => nc1071, A_DOUT(0) => 
        \R_DATA_TEMPR1[7]\, B_DOUT(19) => nc762, B_DOUT(18) => 
        nc647, B_DOUT(17) => nc1267, B_DOUT(16) => nc999, 
        B_DOUT(15) => nc1424, B_DOUT(14) => nc1139, B_DOUT(13)
         => nc359, B_DOUT(12) => nc1636, B_DOUT(11) => nc191, 
        B_DOUT(10) => nc1285, B_DOUT(9) => nc83, B_DOUT(8) => 
        nc197, B_DOUT(7) => nc1264, B_DOUT(6) => nc430, B_DOUT(5)
         => nc76, B_DOUT(4) => nc56, B_DOUT(3) => nc1604, 
        B_DOUT(2) => nc243, B_DOUT(1) => nc68, B_DOUT(0) => 
        nc1187, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][7]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(7), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    \INVBLKY1[0]\ : INV
      port map(A => R_ADDR(15), Y => \BLKY1[0]\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R2C2 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%2%2%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc344, A_DOUT(18) => nc1423, 
        A_DOUT(17) => nc1341, A_DOUT(16) => nc681, A_DOUT(15) => 
        nc452, A_DOUT(14) => nc299, A_DOUT(13) => nc1180, 
        A_DOUT(12) => nc957, A_DOUT(11) => nc1405, A_DOUT(10) => 
        nc1390, A_DOUT(9) => nc272, A_DOUT(8) => nc1401, 
        A_DOUT(7) => nc182, A_DOUT(6) => nc30, A_DOUT(5) => nc305, 
        A_DOUT(4) => nc208, A_DOUT(3) => nc1440, A_DOUT(2) => 
        nc924, A_DOUT(1) => nc865, A_DOUT(0) => 
        \R_DATA_TEMPR2[2]\, B_DOUT(19) => nc1232, B_DOUT(18) => 
        nc307, B_DOUT(17) => nc31, B_DOUT(16) => nc1208, 
        B_DOUT(15) => nc1154, B_DOUT(14) => nc972, B_DOUT(13) => 
        nc765, B_DOUT(12) => nc65, B_DOUT(11) => nc315, 
        B_DOUT(10) => nc218, B_DOUT(9) => nc1087, B_DOUT(8) => 
        nc651, B_DOUT(7) => nc1142, B_DOUT(6) => nc168, B_DOUT(5)
         => nc18, B_DOUT(4) => nc1540, B_DOUT(3) => nc1333, 
        B_DOUT(2) => nc317, B_DOUT(1) => nc682, B_DOUT(0) => 
        nc549, DB_DETECT => OPEN, SB_CORRECT => OPEN, ACCESS_BUSY
         => \ACCESS_BUSY[2][2]\, A_ADDR(13) => R_ADDR(13), 
        A_ADDR(12) => R_ADDR(12), A_ADDR(11) => R_ADDR(11), 
        A_ADDR(10) => R_ADDR(10), A_ADDR(9) => R_ADDR(9), 
        A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), A_ADDR(6)
         => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4) => 
        R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => R_ADDR(2), 
        A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => R_ADDR(15), 
        A_BLK_EN(0) => \BLKY0[0]\, A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => W_ADDR(15), B_BLK_EN(0) => \BLKX0[0]\, 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(2), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C10 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%10%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc366, A_DOUT(18) => nc152, 
        A_DOUT(17) => nc204, A_DOUT(16) => nc872, A_DOUT(15) => 
        nc537, A_DOUT(14) => nc1357, A_DOUT(13) => nc727, 
        A_DOUT(12) => nc1283, A_DOUT(11) => nc1045, A_DOUT(10)
         => nc998, A_DOUT(9) => nc100, A_DOUT(8) => nc1314, 
        A_DOUT(7) => nc669, A_DOUT(6) => nc214, A_DOUT(5) => 
        nc1487, A_DOUT(4) => nc1151, A_DOUT(3) => nc1374, 
        A_DOUT(2) => nc505, A_DOUT(1) => nc1563, A_DOUT(0) => 
        \R_DATA_TEMPR1[10]\, B_DOUT(19) => nc308, B_DOUT(18) => 
        nc1434, B_DOUT(17) => nc1287, B_DOUT(16) => nc791, 
        B_DOUT(15) => nc15, B_DOUT(14) => nc110, B_DOUT(13) => 
        nc901, B_DOUT(12) => nc730, B_DOUT(11) => nc652, 
        B_DOUT(10) => nc515, B_DOUT(9) => nc1068, B_DOUT(8) => 
        nc1329, B_DOUT(7) => nc1206, B_DOUT(6) => nc1040, 
        B_DOUT(5) => nc684, B_DOUT(4) => nc1284, B_DOUT(3) => 
        nc318, B_DOUT(2) => nc1433, B_DOUT(1) => nc1019, 
        B_DOUT(0) => nc966, DB_DETECT => OPEN, SB_CORRECT => OPEN, 
        ACCESS_BUSY => \ACCESS_BUSY[1][10]\, A_ADDR(13) => 
        R_ADDR(13), A_ADDR(12) => R_ADDR(12), A_ADDR(11) => 
        R_ADDR(11), A_ADDR(10) => R_ADDR(10), A_ADDR(9) => 
        R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7) => R_ADDR(7), 
        A_ADDR(6) => R_ADDR(6), A_ADDR(5) => R_ADDR(5), A_ADDR(4)
         => R_ADDR(4), A_ADDR(3) => R_ADDR(3), A_ADDR(2) => 
        R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0) => R_ADDR(0), 
        A_BLK_EN(2) => R_EN, A_BLK_EN(1) => \BLKY1[0]\, 
        A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, A_DIN(19) => 
        \GND\, A_DIN(18) => \GND\, A_DIN(17) => \GND\, A_DIN(16)
         => \GND\, A_DIN(15) => \GND\, A_DIN(14) => \GND\, 
        A_DIN(13) => \GND\, A_DIN(12) => \GND\, A_DIN(11) => 
        \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, A_DIN(8)
         => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, A_DIN(5)
         => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, A_DIN(2)
         => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, A_REN
         => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(10), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    COREFIFO_C0_COREFIFO_C0_0_LSRAM_top_R1C6 : RAM1K20

              generic map(RAMINDEX => "core%40960-40960%14-14%SPEED%1%6%TWO-PORT%ECC_EN-0"
        )

      port map(A_DOUT(19) => nc40, A_DOUT(18) => nc1079, 
        A_DOUT(17) => nc146, A_DOUT(16) => nc975, A_DOUT(15) => 
        nc697, A_DOUT(14) => nc24, A_DOUT(13) => nc848, 
        A_DOUT(12) => nc943, A_DOUT(11) => nc911, A_DOUT(10) => 
        nc900, A_DOUT(9) => nc1545, A_DOUT(8) => nc221, A_DOUT(7)
         => nc125, A_DOUT(6) => nc183, A_DOUT(5) => nc139, 
        A_DOUT(4) => nc979, A_DOUT(3) => nc361, A_DOUT(2) => nc41, 
        A_DOUT(1) => nc1596, A_DOUT(0) => \R_DATA_TEMPR1[6]\, 
        B_DOUT(19) => nc1412, B_DOUT(18) => nc1472, B_DOUT(17)
         => nc1056, B_DOUT(16) => nc293, B_DOUT(15) => nc910, 
        B_DOUT(14) => nc736, B_DOUT(13) => nc724, B_DOUT(12) => 
        nc171, B_DOUT(11) => nc320, B_DOUT(10) => nc394, 
        B_DOUT(9) => nc177, B_DOUT(8) => nc407, B_DOUT(7) => 
        nc654, B_DOUT(6) => nc464, B_DOUT(5) => nc742, B_DOUT(4)
         => nc279, B_DOUT(3) => nc1062, B_DOUT(2) => nc1064, 
        B_DOUT(1) => nc417, B_DOUT(0) => nc153, DB_DETECT => OPEN, 
        SB_CORRECT => OPEN, ACCESS_BUSY => \ACCESS_BUSY[1][6]\, 
        A_ADDR(13) => R_ADDR(13), A_ADDR(12) => R_ADDR(12), 
        A_ADDR(11) => R_ADDR(11), A_ADDR(10) => R_ADDR(10), 
        A_ADDR(9) => R_ADDR(9), A_ADDR(8) => R_ADDR(8), A_ADDR(7)
         => R_ADDR(7), A_ADDR(6) => R_ADDR(6), A_ADDR(5) => 
        R_ADDR(5), A_ADDR(4) => R_ADDR(4), A_ADDR(3) => R_ADDR(3), 
        A_ADDR(2) => R_ADDR(2), A_ADDR(1) => R_ADDR(1), A_ADDR(0)
         => R_ADDR(0), A_BLK_EN(2) => R_EN, A_BLK_EN(1) => 
        \BLKY1[0]\, A_BLK_EN(0) => R_ADDR(14), A_CLK => R_CLK, 
        A_DIN(19) => \GND\, A_DIN(18) => \GND\, A_DIN(17) => 
        \GND\, A_DIN(16) => \GND\, A_DIN(15) => \GND\, A_DIN(14)
         => \GND\, A_DIN(13) => \GND\, A_DIN(12) => \GND\, 
        A_DIN(11) => \GND\, A_DIN(10) => \GND\, A_DIN(9) => \GND\, 
        A_DIN(8) => \GND\, A_DIN(7) => \GND\, A_DIN(6) => \GND\, 
        A_DIN(5) => \GND\, A_DIN(4) => \GND\, A_DIN(3) => \GND\, 
        A_DIN(2) => \GND\, A_DIN(1) => \GND\, A_DIN(0) => \GND\, 
        A_REN => \VCC\, A_WEN(1) => \GND\, A_WEN(0) => \GND\, 
        A_DOUT_EN => \VCC\, A_DOUT_ARST_N => \VCC\, A_DOUT_SRST_N
         => \VCC\, B_ADDR(13) => W_ADDR(13), B_ADDR(12) => 
        W_ADDR(12), B_ADDR(11) => W_ADDR(11), B_ADDR(10) => 
        W_ADDR(10), B_ADDR(9) => W_ADDR(9), B_ADDR(8) => 
        W_ADDR(8), B_ADDR(7) => W_ADDR(7), B_ADDR(6) => W_ADDR(6), 
        B_ADDR(5) => W_ADDR(5), B_ADDR(4) => W_ADDR(4), B_ADDR(3)
         => W_ADDR(3), B_ADDR(2) => W_ADDR(2), B_ADDR(1) => 
        W_ADDR(1), B_ADDR(0) => W_ADDR(0), B_BLK_EN(2) => W_EN, 
        B_BLK_EN(1) => \BLKX1[0]\, B_BLK_EN(0) => W_ADDR(14), 
        B_CLK => W_CLK, B_DIN(19) => \GND\, B_DIN(18) => \GND\, 
        B_DIN(17) => \GND\, B_DIN(16) => \GND\, B_DIN(15) => 
        \GND\, B_DIN(14) => \GND\, B_DIN(13) => \GND\, B_DIN(12)
         => \GND\, B_DIN(11) => \GND\, B_DIN(10) => \GND\, 
        B_DIN(9) => \GND\, B_DIN(8) => \GND\, B_DIN(7) => \GND\, 
        B_DIN(6) => \GND\, B_DIN(5) => \GND\, B_DIN(4) => \GND\, 
        B_DIN(3) => \GND\, B_DIN(2) => \GND\, B_DIN(1) => \GND\, 
        B_DIN(0) => W_DATA(6), B_REN => \VCC\, B_WEN(1) => \GND\, 
        B_WEN(0) => \VCC\, B_DOUT_EN => \VCC\, B_DOUT_ARST_N => 
        \GND\, B_DOUT_SRST_N => \VCC\, ECC_EN => \GND\, BUSY_FB
         => \GND\, A_WIDTH(2) => \GND\, A_WIDTH(1) => \GND\, 
        A_WIDTH(0) => \GND\, A_WMODE(1) => \GND\, A_WMODE(0) => 
        \GND\, A_BYPASS => \VCC\, B_WIDTH(2) => \GND\, B_WIDTH(1)
         => \GND\, B_WIDTH(0) => \GND\, B_WMODE(1) => \GND\, 
        B_WMODE(0) => \GND\, B_BYPASS => \VCC\, ECC_BYPASS => 
        \GND\);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 
