package com.myexample.PDF_Reader;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;

/**
 * Created by RedSin on 3/9/14.
 */
public class ListActivity extends Activity
{
    public static final int NAVIGATION_BTN_TEXT_SIZE = 15;


    String directory;       // save the sub folder which user chose
    Intent fromCaller;      // this is the intent of who navigate to this activity
    Intent toViewerView;
    Intent toListView;
    Intent toHomeView;
    ListView listView;
    Button btn_navigation1;
    Button btn_navigation2;

    int currentButtonID;    // this is ID is button is clicked from parent activity - who call this activity



    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.list_view);
        ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);      // show the navigate up button
        actionBar.setDisplayShowHomeEnabled(false);     // hide the app icon

        toViewerView = new Intent(this, ViewerActivity.class);
        toListView = new Intent(this, ListActivity.class);
        toHomeView = new Intent(this, MainActivity.class);

        /* links all controls */
        listView = (ListView)findViewById(R.id.listView);
        btn_navigation1 = (Button)findViewById(R.id.btn_navigation1);
        btn_navigation1.setOnClickListener(btn_navigate_OnClickListener);
        btn_navigation2 = (Button)findViewById(R.id.btn_navigation2);
        btn_navigation2.setOnClickListener(btn_navigate_OnClickListener);



        // display label corresponding to name of button pressed
        // also change 2 button names at the bottom dynamically
        fromCaller = getIntent();
        currentButtonID = fromCaller.getIntExtra(MainActivity.BUTTON_ID, -1);
        switch (currentButtonID)
        {
            case R.id.btn_syllabus:
                directory = getResources().getString(R.string.btn_syllabus_name);

                // hide 2 navigation buttons in this case
                btn_navigation1.setVisibility(0);
                btn_navigation2.setVisibility(0);
                break;

            case R.id.btn_review:
                directory = getResources().getString(R.string.btn_review_name);

                btn_navigation1.setText(R.string.btn_questions_name);
                btn_navigation1.setId(R.id.btn_questions);
                btn_navigation2.setText(R.string.btn_solutions_name);
                btn_navigation2.setId(R.id.btn_solutions);
                break;

            case R.id.btn_questions:
                directory = getResources().getString(R.string.btn_questions_name);

                btn_navigation1.setText(R.string.btn_review_name);
                btn_navigation1.setId(R.id.btn_review);
                btn_navigation2.setText(R.string.btn_solutions_name);
                btn_navigation2.setId(R.id.btn_solutions);
                break;

            case R.id.btn_solutions:
                directory = getResources().getString(R.string.btn_solutions_name);

                btn_navigation1.setText(R.string.btn_questions_name);
                btn_navigation1.setId(R.id.btn_questions);
                btn_navigation2.setText(R.string.btn_review_name);
                btn_navigation2.setId(R.id.btn_review);
                break;
        }
        // set text size dynamically based on different screen density
        btn_navigation1.setTextSize(NAVIGATION_BTN_TEXT_SIZE * getResources().getDisplayMetrics().density);
        btn_navigation2.setTextSize(NAVIGATION_BTN_TEXT_SIZE * getResources().getDisplayMetrics().density);
        actionBar.setTitle(directory);



        ArrayList<String> files = new ArrayList<String>();
        AssetManager assetManager = this.getAssets();       // used to get list of files in asset
        String[] fileNames;                                 // store all file names

        // get all pdf files from chosen directory
        try
        {
            fileNames = assetManager.list(directory);
            directory += "/";

            // syllabus is special, there is only one file in the Syllabus directory
            // so we will open that file directly here
            if (currentButtonID == R.id.btn_syllabus)
            {
                String fileName = fileNames[0].toString();
                // send file path to ViewerActivity to let it know which file to open
                toViewerView.putExtra(MainActivity.DIRECTORY_NAME, directory);
                toViewerView.putExtra(MainActivity.FILE_NAME, RemoveFileExtension(fileName));
                toViewerView.putExtra(MainActivity.BUTTON_ID, currentButtonID);
                startActivity(toViewerView);

                // if user want to go back, go back directly to home,
                // not stay in this list view
                finish();
            }


            for (int i = 0; i < fileNames.length; i++)
            {
                String fileName = fileNames[i].toString();
                fileName = this.RemoveFileExtension(fileName);
                fileName = fileName.replace("_", " ");
                files.add(fileName);
            }
        }
        catch (IOException e1)
        {

        }

        // show all chosen PDF file on the list view
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, R.layout.file_list, files );

        Comparator<String> normalSort = new Comparator<String>()
        {
            public int compare(String lhs, String rhs)
            {
                return lhs.compareTo(rhs);
            }
        };

        Comparator<String> inverseSort = new Comparator<String>()
        {
            public int compare(String lhs, String rhs)
            {
                return rhs.compareTo(lhs);
            }
        };

        switch (currentButtonID)
        {
            case R.id.btn_review:
                adapter.sort(normalSort);
                break;

            case R.id.btn_questions:
            case R.id.btn_solutions:
                adapter.sort(inverseSort);
                break;
        }

        listView.setAdapter(adapter);

        // ListView Item Click Listener
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id)
            {
                // ListView Clicked item value
                String  fileName = (String) listView.getItemAtPosition(position);

                // send file path to ViewerActivity to let it know which file to open
                toViewerView.putExtra(MainActivity.DIRECTORY_NAME, directory);
                toViewerView.putExtra(MainActivity.FILE_NAME, fileName);
                toViewerView.putExtra(MainActivity.BUTTON_ID, currentButtonID);
                startActivity(toViewerView);
            }
        });
    }



    /* handle 2 navigation buttons click event */
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
                    case R.id.btn_review:
                        toListView.putExtra(MainActivity.BUTTON_ID, R.id.btn_review);
                        startActivity(toListView);
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



    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        try
        {
            switch (item.getItemId())
            {
                // Respond to the action bar's Up/Home button
                case android.R.id.home:
                    //finish();
                    startActivity(toHomeView);
                    return true;
            }
        }
        catch (Exception ex)
        {
            Toast.makeText(getApplicationContext(), ex.getMessage(), Toast.LENGTH_LONG).show();
        }

        return super.onOptionsItemSelected(item);
    }


    static public String RemoveFileExtension (String fileName)
    {
        String result = fileName;

        int extensionIndex = fileName.lastIndexOf(".");

        if (extensionIndex != -1)
        {
            result = fileName.substring(0, extensionIndex);
        }

        return result;
    }
}