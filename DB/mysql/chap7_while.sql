/* while ,iterate, leave */

-- while을 활용한 1부터 100까지의 합 --


drop procedure if exists whileProc;
delimiter $$
create procedure whileProc()
Begin

declare i int;
declare hap int; -- 더한값을 누적할 변수 
set i =1;
set hap=0;

while i<=100 do
set hap=hap+i;
set i= i+ 1 ;

end while;
select hap;

end $$
delimiter ;
call whileProc();


-- 1부터 10까지의 곱을 계산해보자 --

drop procedure if exists whileproc1;
delimiter $$ 
create procedure whileproc1()

begin
declare i int;
declare gop int;

set i=1;
set gop=1;

while i<=10 do
  set gop=gop *i;
  set i=i+1;
end while;
select gop as 곱;

end $$
delimiter $$
call whileproc1();




