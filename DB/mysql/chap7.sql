USE conv_db;
select * from df_cu_oneplusone;

-- 날짜와 시간 데이터 형식 --
select cast('2018-10-28 11:23:29' as date) as date;
select cast('2018-10-28 11:23:29' as time) as time;
select cast('2018-10-28 11:23:29' as datetime) as datetime;

/*
-- 변수의 사용 --
set @변수이름 =변수의 값 ; -- 변수의 선언 및 값 대입
select 변수이름 ; -- 변수의 값 출력 

*/
use shop_db;
select * from 고객방문기록;
set @myVar1=5;
set @myVar2=4;
set @myVar3= '가수이름 ===>';
set @myVar4=2;
set @myVar5=1;
select @myVar1;


select concat(@myVar1,'+',@myVar2);

select @myVar3, Name From 고객방문기록 ;
prepare myQuery from 'select Name, birthYear from 고객방문기록 order by birthYear';
execute myQuery  USING @myVar3;


-- 데이터 형식 변환 ---
/*
형식 :
cast (expression as 데이터 형식 ())

*/


-- mysql의 내장함수 --

/*
-- 제어 흐름 함수 if , ifnull, nullif,case~when~else~end --
if(수식, 참, 거짓) 
ifnull(수식1, 수식2) : 수식1이 null이아니면 수식1이 출력, 수식1이 null이면 2가 출력
nullif(수식1, 수식2): 수식1과 수식2가 같으면 null이 반환, 다르면 수식1이 반환
case

*/

select if (100>200, '참이다', '거짓이다') ;
select  if (100<200, '참이다', '거짓이다');
select ifnull(null,'널이군요'), ifnull(100, '널이군요');
select nullif(100,100), ifnull(200,100);

select case 10
        when 1 then "일"
        when 5 then "오"
        when 10 then "십"
        else '모름'
	end;
    
    
 /* 
 -- 문자열 함수 --
 
 concat(문자열1, 문자열 2)
 concat_ws(문자열1, 문자열2)

 elt(2, '하나','둘','셋') => 둘 # 첫번째에 입력된 수의 위치의 문자열을 출력
 field('둘', '하나','셋','둘') =>3 # 매치되는 문자열의 위치를 출력
 find_in_set('둘','하나','둘','셋')
 instr("하나둘셋","둘")=> 3 : 기준문자열에서 부분문자열을 찾아 그 시작위치를 반환
 locate("둘","하나둘셋") =>3 : instr과 파라미터의 순서가 반대로 되어있다
 */
 
-- format, bin(2진수),hex(16진수),oct(8진수), --
-- insert(기준문자열, 위치, 길이, 삽입할 문자열)
--  left(문자열,길이)right(문자열,길이),ucase,lcase,upper,lower --
-- ltrim(left의 공백 제거), rtrim(right의 공백제거), trim(모든 공백제거)
-- repeat(문자열, 횟수)
-- replce(문자열, 원래문자열, 바꿀문자열)
-- reverse(문자열)
-- space(10) : 10만큼의 길이의 공백을 반환함

select format(1234.4284242342,2);
select bin(31);
select insert('abcdefghijk',3,4,'xyzw'), insert("djfsfjsdlkf",1,3,"@@@");
 
select ucase("abcd");
select lcase("avDJFJEHKW");
select repeat("재밋어용",3);
select replace("이것이 mysql이다","이것이","저것이");

