Mi MADAGASZKÁR fővárosa? 
SELECT fovaros, penznem FROM `orszagok` WHERE orszag LIKE 'Madagaszkár';

Melyik ország fővárosa OUAGADOUGOU?  
SELECT orszag FROM `orszagok` WHERE fovaros LIKE 'OUAGADOUGOU';

Melyik ország autójele a TT?
SELECT orszag FROM `orszagok` WHERE autojel LIKE 'TT';

Melyik ország pénzének jele az SGD?
SELECT orszag FROM `orszagok` WHERE penznem LIKE 'SQD';

Melyik ország nemzetközi telefon-hívószáma a 61?
SELECT orszag FROM `orszagok` WHERE telefon LIKE 61;

Mekkora területű Monaco?
SELECT `terulet` FROM `orszagok` WHERE `orszag` LIKE 'Monacó';

Hányan laknak Máltán?  
SELECT `nepesseg` FROM `orszagok` WHERE `orszag` LIKE 'Málta';

Mennyi Japán népsűrűsége? 
SELECT nepesseg*1000/terulet FROM `orszagok` WHERE orszag LIKE 'Japán';

Hány lakosa van a Földnek? 
SELECT SUM(nepesseg*1000) FROM `orszagok`;

Mennyi az országok területe összesen?
SELECT SUM(terulet) FROM `orszagok`;

Mennyi az országok átlagos népessége? 
SELECT AVG(`nepesseg`*1000) FROM `orszagok`;

Mennyi az országok átlagos területe?
SELECT AVG(`terulet`) FROM `orszagok`;

Mennyi a Föld népsűrűsége? 
SELECT SUM(`terulet`) / SUM(`nepesseg`) *1000 FROM `orszagok`;

Hány 1.000.000 km2-nél nagyobb területű ország van? 
SELECT COUNT(terulet) FROM `orszagok` WHERE terulet > 1000000;

Hány 100 km2-nél kisebb területű ország van?
SELECT COUNT(terulet) FROM `orszagok` WHERE terulet < 100;

Hány 20.000 főnél kevesebb lakosú ország van?
SELECT COUNT(orszag) FROM `orszagok` WHERE nepesseg > 20;

Hány országra igaz, hogy területe kisebb 100 km2-nél, vagy pedig a lakossága kevesebb 20.000 főnél?
SELECT COUNT(terulet) FROM `orszagok` WHERE terulet < 100;

Hány ország területe 50.000 és 150.000 km2 közötti? 
SELECT COUNT(terulet) FROM `orszagok` WHERE terulet BETWEEN 50000 AND 150000;

Hány ország lakossága 8 és 12 millió közötti?
SELECT COUNT(nepesseg ) FROM `orszagok` WHERE nepesseg*1000 BETWEEN 8000000 AND 12000000;

Mely fővárosok népesebbek 20 millió főnél?
SELECT fovaros FROM `orszagok` WHERE nepesseg > 20000;

Mely országok népsűrűsége nagyobb 500 fő/km2-nél?
SELECT orszag FROM `orszagok` WHERE (nepesseg*1000/terulet)>500;

Hány ország államformája köztársaság?
SELECT COUNT(orszag) FROM `orszagok` WHERE allamforma='köztársaság';

Mely országok pénzneme a kelet-karib dollár?
SELECT orszag FROM `orszagok` WHERE penznem='kelet-karib dollár';

Hány ország nevében van benne az "ORSZÁG" szó? 
SELECT COUNT(orszag) FROM `orszagok` WHERE orszag LIKE '%ORSZAG%';

Mely országokban korona a hivatalos fizetőeszköz?
SELECT orszag FROM `orszagok` WHERE penznem='korona';

Mennyi Európa területe?
SELECT SUM(terulet) FROM `orszagok` WHERE foldr_hely LIKE '%Európa%';

Mennyi Európa lakossága?
SELECT SUM(nepesseg) FROM `orszagok` WHERE foldr_hely LIKE '%Európa%';

Mennyi Európa népsűrűsége?
SELECT SUM(nepesseg*1000)/SUM(terulet) FROM `orszagok` WHERE foldr_hely LIKE '%Európa%';

Hány ország van Afrikában?
SELECT SUM(orszagok) FROM `orszagok` WHERE foldr_hely LIKE '%Afrika%';

Mennyi Afrika lakossága?
SELECT SUM(nepesseg) FROM `orszagok` WHERE foldr_hely LIKE '%Afrika%';

Mennyi Afrika népsűrűsége?
SELECT SUM(nepesseg*1000)/SUM(terulet) FROM `orszagok` WHERE foldr_hely LIKE '%Afrika%';

Melyek a szigetországok?  
SELECT orszag FROM `orszagok` WHERE foldr_hely LIKE '%szigetország%';

Mely országok államformája hercegség, vagy királyság?
SELECT orszag FROM `orszagok` WHERE allamforma='hercegseg',allamforma='kiralysag';

Hány országnak nincs autójelzése?
SELECT COUNT(autojel) FROM `orszagok` WHERE autojel=null;

Mennyi a váltószáma az aprópénznek azokban az országokban, ahol nem 100?
SELECT valtopenz FROM `orszagok` WHERE valtopenz!=100;

Hány ország területe kisebb Magyarországénál? 
SELECT COUNT(terulet) FROM `orszagok` WHERE terulet<(SELECT terulet FROM `orszagok` WHERE orszag='Magyarország');

Melyik a legnagyobb területű ország, és mennyi a területe? 
SELECT orszag, terulet FROM `orszagok` ORDER BY terulet DESC LIMIT 1;

Melyik a legkisebb területű ország, és mennyi a területe?
SELECT orszag, terulet FROM `orszagok` ORDER BY terulet ASC LIMIT 1;

Melyik a legnépesebb ország, és hány lakosa van?
SELECT orszag, nepesseg*1000 FROM `orszagok` ORDER BY nepesseg DESC LIMIT 1;

Melyik a legkisebb népességű ország, és hány lakosa van?
SELECT orszag, nepesseg*1000 FROM `orszagok` ORDER BY nepesseg ASC LIMIT 1;

Melyik a legsűrűbben lakott ország, és mennyi a népsűrűsége?
SELECT orszag, (nepesseg*1000)/terulet FROM `orszagok` ORDER BY (nepesseg*1000)/terulet DESC LIMIT 1;

Melyik a legritkábban lakott ország, és mennyi a népsűrűsége?
SELECT orszag, (nepesseg*1000)/terulet FROM `orszagok` ORDER BY (nepesseg*1000)/terulet ASC LIMIT 1;

Melyik a legnagyobb afrikai ország és mekkora?
SELECT orszag, terulet FROM `orszagok` WHERE foldr_hely LIKE '%Afrika%' ORDER BY terulet DESC LIMIT 1;

Melyik a legkisebb amerikai ország és hányan lakják?
SELECT orszag, terulet FROM `orszagok` WHERE foldr_hely LIKE '%Afrika%' ORDER BY terulet ASC LIMIT 1;

Melyik az első három legsűrűbben lakott "országméretű" ország (tehát nem város- vagy törpeállam)? 
SELECT (nepesseg*1000/terulet), orszag, foldr_hely FROM `orszagok` WHERE foldr_hely NOT LIKE '%törpeállam%' AND foldr_hely NOT LIKE '%városállam%' ORDER BY (nepesseg*1000)/terulet DESC LIMIT 3;

Melyik a világ hat legnépesebb fővárosa?
SELECT terulet, orszag FROM `orszagok`  ORDER BY terulet DESC LIMIT 6;

Melyik tíz ország egy főre jutó GDP-je a legnagyobb?  
SELECT orszag, gdp/(nepesseg*1000) FROM `orszagok` ORDER BY gdp/(nepesseg*1000) DESC LIMIT 10;

Melyik tíz ország össz-GDP-je a legnagyobb?
SELECT orszag FROM `orszagok` ORDER BY gdp DESC LIMIT 10;
  
Melyik országban a legszegényebbek az emberek?
SELECT orszag, gdp/(nepesseg*1000) FROM `orszagok` ORDER BY gdp/(nepesseg*1000) ASC LIMIT 10;

Melyik a 40. legkisebb területű ország? 
SELECT terulet, orszag FROM `orszagok` ORDER BY terulet LIMIT 40;

Melyik a 15. legkisebb népsűrűségű ország?
SELECT (nepesseg*1000/terulet), orszag FROM `orszagok` ORDER BY (nepesseg*1000)/terulet LIMIT 15;

Melyik a 61. legnagyobb népsűrűségű ország?
SELECT (nepesseg*1000/terulet), orszag FROM `orszagok` ORDER BY (nepesseg*1000)/terulet DESC LIMIT 61;

Melyik három ország területe hasonlít leginkább Magyaroszág méretéhez?  
SELECT orszag FROM `orszagok` WHERE terulet<(SELECT terulet FROM `orszagok` WHERE orszag='Magyarország') ORDER BY orszag DESC LIMIT 3;

Az emberek hányadrésze él Ázsiában? 
SELECT((SELECT SUM(nepesseg*1000)FROM `orszagok`WHERE foldr_hely LIKE '%Azsia%')/(SELECT SUM(nepesseg*1000) FROM `orszagok`)*100);

A szárazföldek mekkora hányadát foglalja el Oroszország?
SELECT((SELECT SUM(terulet)FROM `orszagok` WHERE orszag LIKE 'Oroszország')/(SELECT SUM(terulet) FROM `orszagok`)*100)'Százalék';

Az emberek hány százaléka fizet euroval?
SELECT((SELECT SUM(penznem)FROM `orszagok` WHERE penznem LIKE 'euró')/(SELECT SUM(penznem) FROM `orszagok`)*100)'Százalék';

Hányszorosa a leggazdagabb ország egy főre jutó GDP-je a legszegényebb ország egy főre jutó GDP-jének?  
A világ össz-GDP-jének hány százalékát adja az USA?
A világ össz-GDP-jének hány százalékát adja az euroövezet?
Melyek azok az átlagnál gazdagabb országok, amelyek nem az európai vagy az amerikai kontinensen találhatóak?

Milyen államformák léteznek Európában? 
SELECT `allamforma` FROM `orszagok` WHERE foldr_hely LIKE '%Európa%' GROUP by allamforma;

Hányféle államforma létezik a világon? 
SELECT COUNT(`allamforma`) FROM `orszagok`;

Hányféle fizetőeszközt használnak Európában az eurón kívül?
SELECT COUNT(`penznem`) FROM `orszagok` WHERE foldr_hely LIKE '%Európa%' and `penznem` NOT LIKE 'euró';

Mely pénznemeket használják több országban is?
Mely országok államformája egyedi?  