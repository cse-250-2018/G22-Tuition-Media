package com.example.tuitionmedia;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SignupAsStudentActivity extends AppCompatActivity {
//After pressing button there should open a window where it
    private Button signUpStudent;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup_as_student);
        signUpStudent=(Button)findViewById(R.id.button2);
        signUpStudent.setOnClickListener(new View.OnClickListener(){

            public void onClick(View v)
            {
                openLoginActivity();
            }
        }
        );
    }
    public void openLoginActivity(){
        Intent intent =new Intent(this,loginActivity.class);
        startActivity(intent);
    }
}