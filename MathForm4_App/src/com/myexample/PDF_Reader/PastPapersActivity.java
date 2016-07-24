package com.myexample.PDF_Reader;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

/**
 * Created by RedSin on 3/14/14.
 */
public class PastPapersActivity extends Activity
{
    Intent toListView;

    Button btn_back;
    Button btn_questions;
    Button btn_solutions;

    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.past_papers_view);
        ActionBar actionBar = getActionBar();
        actionBar.hide();

        toListView = new Intent(this, ListActivity.class);

        btn_back = (Button)findViewById(R.id.btn_back);
        btn_back.setOnClickListener(btn_navigate_OnClickListener);
        btn_questions = (Button)findViewById(R.id.btn_questions);
        btn_questions.setOnClickListener(btn_navigate_OnClickListener);
        btn_solutions = (Button)findViewById(R.id.btn_solutions);
        btn_solutions.setOnClickListener(btn_navigate_OnClickListener);
    }



    Button.OnClickListener btn_navigate_OnClickListener = new Button.OnClickListener()
    {
        @Override
        public void onClick(View view)
        {
            try
            {
                // save which button is clicked to let next activity know
                switch (view.getId())
                {
                    case R.id.btn_back:
                        finish();
                        break;

                    case R.id.btn_questions:
                        toListView.putExtra(MainActivity.BUTTON_ID, R.id.btn_questions);
                        startActivity(toListView);
                        break;

                    case R.id.btn_solutions:
                        toListView.putExtra(MainActivity.BUTTON_ID, R.id.btn_solutions);
                        startActivity(toListView);
                        break;
                }
            }
            catch (Exception ex)
            {
                Toast.makeText(getApplicationContext(), ex.getMessage(), Toast.LENGTH_LONG).show();
            }
        }
    };
}