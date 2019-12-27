MariaDB 서버 및 클라이언트 다운로드와 설치

#### IN LINUX

>##### Step 2. 다운로드한 파일을 설치하자
>
>```bash
>cd 다운로드/
>#yum -y localinstall Maria*
>
>// 서비스 가동을 해보자
>
>#systemctl restart mysql
>#systemctl status mysql
>#chkconfig mysql on // 서비스 상시 가동
>
>```
>
>###### Step3 방화벽설정.
>
>firewall-config명렁어를 입력하여 방화벽 설정을 해준다
>
>설정에서 서비스영역에서 mysql을 체크하며 영구적인 것도 위와 같이 똑같이 설정해준다
>
>```bash
># firewall-config
>// mysql 접속
># mysql
>// 비번설정
># mysqladmin -u root -p '111111'
>// 접속
># mysql -u root -p
>enter password: 111111
>
>```
>
>
>
>###### Step4.사용자 권한을 설정해주자 BY MARIADB 구문
>
>SQL : GRANT 사용자권한 ON 데이터베이스이름.테이블명 TO 사용자 이름@'호스트이름' IDENTIFIED BY '비밀번호';
>
>```mariadb
>/*모든 권한을 주겠다는 의미 : ALL PRIVILEGES*/
>GRANT ALL PRIVILEGES ON *.* TO muser@'server2' IDENTIFIED BY '111111'
>GRANT ALL PRIVILEGES ON *.* TO muser@'localhost' IDENTIFIED BY '111111'
>GRANT ALL PRIVILEGES ON *.* TO muser@'192.168.111.%' IDENTIFIED BY '111111'
>GRANT ALL PRIVILEGES ON *.* TO muser@'70.12.113.%' IDENTIFIED BY '111111';
>```
>
>



#### IN ECLIPSE

>###### STEP1 . JAVA_WEBPROJECT를 형성한다
>
>##### STEP2. TEST CLASS를 형성하고 연결하기 위한 코드를 작성한다
>
>```java
>package mariadb;
>
>import java.sql.Connection;
>import java.sql.DriverManager;
>import java.sql.PreparedStatement;
>import java.sql.ResultSet;
>
>public class test {
>
>	public static void main(String[] args) throws Exception {
>        
>        
>		String url="jdbc:mysql://192.168.111.102/shop";
>		String id="muser";
>		String pwd="111111";
>		String sql="SELECT * FROM USERS";		
>		Class.forName("org.mariadb.jdbc.Driver");
>		
>        
>		Connection con=DriverManager.getConnection(url,id,pwd);
>		// sql문
>        PreparedStatement pstnt=con.prepareStatement(sql);
>		// sql을 시행하고 난 뒤에 결과로 나타난 set들
>        ResultSet rset=pstnt.executeQuery();
>		
>		// resultset을 print하기 위한 작업
>		while (rset.next()) {
>			String idd=rset.getString("id");
>			String pwdd=rset.getString("pwd");
>			String name=rset.getString("name");
>			int age=rset.getInt("age");
>			System.out.println(idd+" "+ pwdd+" "+name +" "+ age );
>			
>		}
>        // 마지막 끝내기 위한 작업
>		rset.close();
>		pstnt.close();
>		con.close();
>
>	}
>	
>	
>
>}
>
>```
>
>
>
>

#### ORACLE 을 실행해보자!

>##### STEP 2. ORACLE 11g을 설치하기 위해 준비 과정(SWAP메모리 활성화)
>
>- oracle 11g을 설치하기위해서는 약 2G 필요하며, 가상메모리가 현재 우리는 (2048MB)로 설정하였기 때문에 
>
>  여분의 메모리 공간이 더 필요하다
>
>  아래는 이를 위해 가상의 메모리를 추가하는 과정을 한다
>
>```bash
>// 가상 메모리용 파일 생성(4GB)
># dd if=/dev/zero of=/swapfile bs=1024 count=4194304
>// 파일을 가상 메모리로 포멧
># mkswap /swapfile
>//가상 메모리 활성화
># swapon /swapfile
>//가상메모리 용량 확인
># swapon -s
>
>// 생성한 가상 메모리 파일을 재부팅을 한 후에도 사용하려면 권한설정을 바꿔준 후 vi를 통해 ----
>
># cd /etc/rc.d
>
>// 
># vi rc.local 
>// 여기서 swapon /swafile을 적는다 
>
>// 내용 확인(체크하기) 아래 그림과 같아야 한다
># cat rc.local
>
>```
>
>![swapon-s](https://user-images.githubusercontent.com/52269210/71509254-15a91d00-28ce-11ea-8390-3325a4f338ba.PNG)
>
>cf> 가상 메모리가 필요가 없다면 , swapoff /swapfile 이라는 명령어를 치면 된다



>##### STEP3  ORACLE을 진짜 설치하자
>
>```bash
>// 파일이 위치한 디렉토리로 이동하자
>
>cd /root/다운로드/Disk1
>ls -l
>
>// 설치하자!
># yum -y localinstall oracle*
>
>```

>#### STEP4. 환경설정
>
>````bash
>// 환경설정을 시작하자
># /etc/init.d/oracle-xe configure
>
>````
>
>- SQLPLUS  접속 포트 확인 -> enter
>
>- 암호 입력 후 -> ENTER
>
>  등 일련의 과정을 거친 후 설치가 완료된다
>
>  



>#### STEP5. 서비스를 시작하자
>
>```bash
>// 시작하자
>#  /etc/init.d/oracle-xe  start
>
>// 오라클 환경설정을 리부팅시에도 계속시 활성화 시키는 작업
>
>// 스크립트를 실행하자
># .u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
>
>// bashrc의 역할 :
># vi /etc/bashrc
>
>#
>
> systemctl restart network
>
>```
>
>![vi etc bashrc](https://user-images.githubusercontent.com/52269210/71509294-2eb1ce00-28ce-11ea-9709-88218f67b755.PNG)
>
>

> #### step6. chrome창에서 확인
>
> http://192.168.111.102:8080/apex/
>
> 여기에 들어가서 확인!

#### ECLIPSE와의 연동

>
>
>



#### [실습] 내가 한 프로젝트를 LINUX에서 실행해보자

>STEP1. sp365.war 파일을 다운로드에서 복사를 해놓는다
>
>STEP2. 그 파일을 톰캣이 실행할 수 있는 경로로 복사를 해둔다
>
>```bash
># cd 다운로드
>#  cp sp365.war /etc/apache-tomcat-9.0.22/webapps/
>// softlink로 tomcatstart를 만들어 논 상태
># tomcatstart 
>
>// cf > tomcat을 tomcatstart라는 softlink를 형성하기 위한 
>ln -s /etc/apache-tomcat-9.0.22/bin/startup.sh starttomcat
>```
>
>
>
>- 만약 성공한다면, apache-tomcat에서 ls 로 확인한 결과 다음과 같이 나온다
>
>  ![실행이된다면_프로젝트](https://user-images.githubusercontent.com/52269210/71509318-3cffea00-28ce-11ea-8d6f-389eae35d6e9.PNG)
>
>
>
>성공 후 모습(리눅스로 연결 성공!)
>
>![sp365연결후](https://user-images.githubusercontent.com/52269210/71509211-f14d4080-28cd-11ea-9bcf-8438f89b11f6.PNG)





