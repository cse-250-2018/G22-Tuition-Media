package com.example.tuitionmedia;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SignupAsTutorActivity extends AppCompatActivity {

    private Button signUpTutor;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup_as_tutor);

        signUpTutor=(Button)findViewById(R.id.b1);
        signUpTutor.setOnClickListener(new View.OnClickListener(){

            public void onClick(View v)
            {
                Intent intent =new Intent(SignupAsTutorActivity.this,loginActivity.class);
                startActivity(intent);
            }
        }
        );
    }

}