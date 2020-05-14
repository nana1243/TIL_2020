drop procedure if exists ifpro3;

delimiter $$
create procedure ifproc3()
begin

declare point int;
declare credit char(1);
set point =77;


if point >=90 then
   set credit ="A";
elseif point >=80 then
   set credit ="B" ;
elseif point >=70 then
   set credit ="C";
elseif point >=60 then
   set credit ="D";
ELSE 
    SET CREDIT="F";
END IF;
SELECT CONCAT("취득점수 ==>",point) , concat("학점 ===>",credit) ;
 
end $$
delimiter ;
call ifproc3()    


drop procedure if exists ifpro3;

delimiter $$
create procedure ifproc3()
begin

declare point int;
declare credit char(1);
set point =77;


when point >=90 then
   set credit ="A";
when point >=80 then
   set credit ="B" ;
when point >=70
   set credit ="C";
when point >=60 then
   set credit ="D";
else 
    SET CREDIT="F";
END IF;
SELECT CONCAT("취득점수 ==>",point) , concat("학점 ===>",credit) ;
 
end $$
delimiter ;
call ifproc3() ;
    
   
use sqldb;   
select * from buytbl;

select userID, price*amount as "총구매액" from buytbl
group by userid order by price*amount desc;


-- 조인 쓸 것 --
select b.userID, u.name, price*amount as "합",

case
when ( price*amount >=800) then "최우수 고객"
when ( price*amount >= 200) then "우수고객"
when ( price*amount >=50) then "일반고객"
else "고객"

end as "고객등급"
 
 from buytbl b
inner join usertbl  u
 on b.userID= u.userID
group by b.userid, u.name order by price*amount desc;



