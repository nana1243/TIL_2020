## INTRO

### 1. Def

>구글에서 만든 스마트폰용 운영체제이다(os이다)

### 2. 특징

- JVM 대신에 ART라는 런타임이 탑재되어있는데 안드로이드 **런타임**을대신 쓴다

### 3. configurations항목



- Avdmanager : 가상의 핸드폰을 제공해주는역할

#### 4. 파일구조

![1_구조](https://user-images.githubusercontent.com/52269210/73337859-9f2a8100-42b8-11ea-94c0-b5988cb2a73a.JPG)

- manifests: 환경설정 (app에 대한 기본 설정)

- java

  > MainAcitivity: servlet과 유사한 구조 - 코드의관리

- xml 파일 

  :화면담당

- 전체적 플로우

  ![2_프로젝트시행할시에나오는](https://user-images.githubusercontent.com/52269210/73337860-9f2a8100-42b8-11ea-8092-9146b398674c.JPG)

화면을 선택하면 mainactivity가 실행이되고 -> 그이후에 oncreate함수가 실행이되고 -> activity_main이 실행되라는 명령을 받는다





5. 기본적인 자바소스코드에 대한 설명

   ```java
   public class MainActivity extends AppCompatActivity {
       TextView tv;
       EditText Int1;
       EditText Int2;
   
   
       @Override
       protected void onCreate(Bundle savedInstanceState) {
           super.onCreate(savedInstanceState);
           setContentView(R.layout.activity_main);
   
           // 화면에서 만든 view에서 해당되는 id를 쓰겠다! 
           tv =findViewById(R.id.textView);
           Int1= findViewById(R.id.editText1);
           Int2=findViewById(R.id.editText2);
   
       }
   
       public void mclick(View v){
           int i1=Integer.parseInt(Int1.getText().toString());
           int i2=Integer.parseInt(Int2.getText().toString());
           int result=i1+i2;
           tv.setText(result + "");
           tv.setTextColor(Color.RED);
   
       }
       public  void exitclick(View v){
           tv.setText("one more time~");
           Int1.setText("");
           Int2.setText("");
   
       }
   
   }
   
   ```

   

| 자바코드                        | 설명                                                         |
| ------------------------------- | ------------------------------------------------------------ |
| findViewById(R.id.textView)     | 해당되는 ID값을 쓰겠다                                       |
| 변수.setText("one more time~"); | "해당되는 값"을 화면에 뿌리겠다                              |
| Toast                           | 화면에 잠깐 보였다가 없어지는 메세지를<br />간단하게 보여주고 싶을 때 사용하는 경우 |
| Onclick 속성                    | 버튼을 누를때 어떠한 메소드를 사용하겠다                     |
| R.layout.acitivity_main         | 화면에 보여줄 대상이 되는 xml 의 위치를 지정한다             |
| setContentView()                | 화면에 무엇을 보여줄지 결정하는 메소드이다                   |

