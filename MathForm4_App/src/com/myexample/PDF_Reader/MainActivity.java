package com.myexample.PDF_Reader;

import android.app.ActionBar;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends LicenseCheckActivity
{
    public final static String BUTTON_ID = "com.example.BUTTON_ID";
    public final static String DIRECTORY_NAME = "com.example.DIRECTORY_NAME";
    public final static String FILE_NAME = "com.example.FILE_NAME";

    Intent toListView;
    Intent toPastPapersView;
    Intent toViewerView;

    Button btn_syllabus;
    Button btn_review;
    Button btn_past_papers;
    Button btn_teams;



    /**
     * Called when the activity is first created.
     */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main_view);

        // check the license
        Toast.makeText(this, "Checking Application License", Toast.LENGTH_SHORT).show();
        checkLicense();

        try
        {
            ActionBar actionBar = getActionBar();
            actionBar.hide();

            toListView = new Intent(this, ListActivity.class);
            toPastPapersView = new Intent(this, PastPapersActivity.class);
            toViewerView = new Intent(this, ViewerActivity.class);

            // get all controls
            btn_syllabus = (Button)findViewById(R.id.btn_syllabus);
            btn_syllabus.setOnClickListener(btn_navigate_OnClickListener);
            btn_review = (Button)findViewById(R.id.btn_review);
            btn_review.setOnClickListener(btn_navigate_OnClickListener);
            btn_past_papers = (Button)findViewById(R.id.btn_past_papers);
            btn_past_papers.setOnClickListener(btn_navigate_OnClickListener);
            btn_teams = (Button)findViewById(R.id.btn_teams);
            btn_teams.setOnClickListener(btn_navigate_OnClickListener);
        }
        catch (Exception e1)
        {
            Toast.makeText(this, e1.getMessage(), Toast.LENGTH_LONG).show();
        }
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
                    case R.id.btn_syllabus:
                        toListView.putExtra(BUTTON_ID, R.id.btn_syllabus);
                        startActivity(toListView);
                        break;

                    case R.id.btn_review:
                        toListView.putExtra(BUTTON_ID, R.id.btn_review);
                        startActivity(toListView);
                        break;

                    case R.id.btn_past_papers:      // navigate to past papers activity
                        startActivity(toPastPapersView);
                        break;

                    case R.id.btn_teams:
                    {
                        // open the word file containing team information
                        toViewerView.putExtra(MainActivity.DIRECTORY_NAME, "");
                        toViewerView.putExtra(MainActivity.FILE_NAME, "Teams");
                        startActivity(toViewerView);
                    }
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
