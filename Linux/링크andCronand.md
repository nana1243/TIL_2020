





#### 링크



>- 파일의 링크는 2가지 종류 ( hard -link, soft-link)
>- ![file-link](https://user-images.githubusercontent.com/52269210/71509635-5d7c7400-28cf-11ea-8094-986d3eeb763c.PNG)
>
>```bash
>// 하드링크를 생성 : ln
>ln basefile hardlink
>// 소프트링크 생성
>ln -s basefile softlink
>// inode번호 출력
>ls -il
>// 하드링크의 내용확인
>cat hardlink
>// 소프트링크의 내용확인
>cat softlink
>
>```
>
>
>
>cf> 파랑색으로 뜨는 파일은 심볼링링크(소프트링크)
>
>



### 4.4 리눅스 관리자를 위한 명령어

>#### 4.4.1 프로그램 설치를 위한 RPM
>
>: 프로그램 설치를 위한 방법은 2가지(RPM, YUM) 이다
>
>

###        RPM

> - RPM으로 설치 파일의 확장명을  *.rpm 이며, 이를 패키지라고 부른다
> -  packagesname - version - release number . Centosvers.architecture.rpm
>
> 
>
> ####  4.4.2자주사용하는 RPM 명령어 옵션
>
> 1. 설치 , 삭제
>
>    ```bash
>    // 설치
>    rpm -Uvh 패키지파일이름.rpm
>    // 삭제
>    rpm -e 패키지이름
>    
>    // 압축풀기
>    tar xvf jdk-8u221-linux-x64.tar.gz
>    ```
>
>    
>
> 





### YUM

>#### 4.4.2 yum 에서의 설치와 삭제
>
>yum의 장점은 ?
>
>RPM명령어의 패키지의존성 문제를 완전하게 해결해준다
>
>(=RPM과 달리 설치에 필요한 패키지들 까지도 설치해준다 )
>
>

```bash
// 설치
yum localinstall mysql-connector-odbc-5.2.5-6.el7.x86_64.rpm 
// information
yum info mysql-connector-odbc.x86_64 
// 삭제
yum remove mysql-connector-odbc.x86_64
// update 가능한 목록 보기
yum check-update

```



>#### 4.4.3 파일 압축과 묶기
>
>#### 파일 압축
>
>- xz
>
>  ```bash
>  // xz 파일이름
>  xz vitest.tar
>  // xz -d 파일이름.xz(decompress)
>  xz -d vitest.xz
>  // xz로 압축된 파일의 list
>  
>  ```



>#### 4.4.4 파일 위치 검색
>
>- 가장 많이 사용되는 명령어 'find'이다
>-  find + 경로 + action
>
>```bash
>// etc 라는 폴더아래 확장명이 ".conf"인 파일 검색
>find /etc -name "*.conf"
>
>// home 디렉토리 하위 폴더에 centos인 파일 검색
>find /home -user centos
>
>// 현재 사용자의 홈디렉토리 하위에 허가권이 644인 파일을 검색
>find ~ -perm 644
>
>// /user/bin 디렉토리 하위에 파일 크기가 10kb-100kb인 파일 검색
>find /user/bin -size +10k -size 100k
>
>// find + 경로 + search_action + -exec + action+{ }여기다 담는다 +\; 
>find /home -name "*.swp" -exec ls -l { }\;
>
>
>```
>
>
>
>- which + 실행파일이름
>
>- whereis + 실행파일이름
>
>- locate +파일이름
>
>  ```bash
>  # which gzip
>  
>  # whereis gzip
>  
>  # locate 파일이름
>  ```
>
>  

>#### 4.4.5 시스템 설정
>
>시스템 설정 명령어를 사용하면 여러가지 시스템 설정에서 좀더 편리하게 쓸 수 있따
>
>1. 날짜 설정
>   - system-config-date
>
>2. 네트워크 설정
>   - nmtui 
>3. 방화벽 설정
>   - firewall-config



>#### 4.4.6 CRON 과 AT
>
>#### CRON
>
>- 주기적으로 반복할 일이 존재한다면 시스템 작업에 예약을 해놓는 것이 CRON이다
>
>  ##### crontab에서의 작성
>
>```bash
>// run-parts 뒤에 나오는 명령어를 실행한다는 의미임
>42 4 26 * * root(username) run-parts /etc/cron.monthly
>
>
>```
>
>#### At
>
>- CRON과 달리 일회성명령을 예약하는 것이다
>
>```bash
>#at 15:00pm tomorrow
> + ctrl+D
>
>//확인
># at -l
>//artm 작업번호
># atrm 1
>
>```





### 실습

// 매일 15일 새벽 3시 1분에 '/home' 디렉토리와 그 하위 디렉토리 '/backup' 백업하자

```bash

//step1 : cron 실행하는지 확인한다

# systemctl status crond

//step2 : crontab 파일에서 주기를 고려하여 설정해준다

# gedit /etc/crontab
42 4 26 * * root(username) run-parts /etc/cron.monthly

// step3 : /etc/cron.monthly/ 디렉토리에 메세지를 출력하는 스크립트 파일을 만들고 , 속성을 이해할 수 있게

# touch mybackup.sh
# chmod 755 mybackup.sh
# ls -l

// step4: mybackup파일안에 


```

