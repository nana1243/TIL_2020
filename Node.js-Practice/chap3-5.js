// filenmae
// 파일이 어디서 실행되고 있는지 알 수 있다
// 싱글 스레드이지만 그 단점을 극복하고자 멀티 프로세스를 쓴다 
// 그때의 파일 경로를 확인할수 있는 역할을 한다

console.log(__filename); // 현재파일 경로
console.log(__dirname); // 현재 파일이 들어있는 dir경로


