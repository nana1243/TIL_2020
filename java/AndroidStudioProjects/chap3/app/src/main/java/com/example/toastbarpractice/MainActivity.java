package com.example.toastbarpractice;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText x;
    EditText y;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        x = findViewById(R.id.x);
        y = findViewById(R.id.y);


    }

    public void onbuutonClick(View view){

        try{
            Toast toastView = Toast.makeText(this,"위치가 바뀐 토스트 입니다",Toast.LENGTH_LONG);

            int xOffset=  Integer.parseInt(x.getText().toString());
            int yOffset=  Integer.parseInt(y.getText().toString());
            toastView.setGravity(Gravity.TOP ,xOffset,yOffset);
            toastView.show();

        }catch (NumberFormatException e){
            e.printStackTrace();

        }

    }

    public void onbuttonClick2(View view){
        LayoutInflater inflater = getLayoutInflater(); // 레이아웃 인플레이터 객체 참조


    }



}