package com.example.tuitionmedia;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class loginActivity extends AppCompatActivity {

    private TextView textView1,textView2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        textView1 =(TextView)findViewById(R.id.signupasstudent);
        textView2=(TextView)findViewById(R.id.signupastutor);
        textView1.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(loginActivity.this,SignupAsStudentActivity.class);
                startActivity(intent);

            }
        });
        textView2.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(loginActivity.this,SignupAsTutorActivity.class);
                startActivity(intent);
            }
        });
    }
}