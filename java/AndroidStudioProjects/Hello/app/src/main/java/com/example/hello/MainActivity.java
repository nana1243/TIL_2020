package com.example.hello;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }



    public void onButtonClick(View view){

        Toast.makeText(this,"click하면나타나지롱!", Toast.LENGTH_LONG).show();
    }

    public void onButtonClickNaver(View view){
        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://naver.com"));
        startActivity(myIntent);
    }

    public void onButtonClickTel(View view){
        Intent myIntent = new Intent(Intent.ACTION_VIEW,Uri.parse("tel:01029051070"));
        startActivity(myIntent);
    }
}