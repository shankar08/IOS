package com.myexample.PDF_Reader;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.*;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.Toast;

/**
 * Created by RedSin on 3/9/14.
 */
public class ViewerActivity extends Activity
{
    Intent fromCaller;
    Intent backHome;
    Intent toListView;
    WebView wbv_pdfViewer;
    int ViewSize = 1;

    String directoryName;   // get directory of the PDF file
    String fileName;        // name of the PDF file

    Button btn_navigation1;
    Button btn_navigation2;
    int currentButtonID;

    //File publicFile;

    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.viewer_view);

        ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);      // show the navigate up button
        actionBar.setDisplayShowHomeEnabled(false);     // hide the app icon

        backHome = new Intent (this, MainActivity.class);
        toListView = new Intent(this, ListActivity.class);

        btn_navigation1 = (Button)findViewById(R.id.btn_navigation1);
        btn_navigation1.setOnClickListener(btn_navigate_OnClickListener);
        btn_navigation2 = (Button)findViewById(R.id.btn_navigation2);
        btn_navigation2.setOnClickListener(btn_navigate_OnClickListener);

        fromCaller = getIntent();
        currentButtonID = fromCaller.getIntExtra(MainActivity.BUTTON_ID, -1);
        switch (currentButtonID)
        {
            case R.id.btn_review:
                btn_navigation1.setText(R.string.btn_questions_name);
                btn_navigation1.setId(R.id.btn_questions);
                btn_navigation2.setText(R.string.btn_solutions_name);
                btn_navigation2.setId(R.id.btn_solutions);
                break;

            case R.id.btn_questions:
                btn_navigation1.setText(R.string.btn_review_name);
                btn_navigation1.setId(R.id.btn_review);
                btn_navigation2.setText(R.string.btn_solutions_name);
                btn_navigation2.setId(R.id.btn_solutions);
                break;

            case R.id.btn_solutions:
                btn_navigation1.setText(R.string.btn_questions_name);
                btn_navigation1.setId(R.id.btn_questions);
                btn_navigation2.setText(R.string.btn_review_name);
                btn_navigation2.setId(R.id.btn_review);
                break;

            default:
                // hide 2 navigation buttons in other cases
                btn_navigation1.setVisibility(0);
                btn_navigation2.setVisibility(0);
                break;
        }
        // set text size dynamically based on different screen density
        btn_navigation1.setTextSize(ListActivity.NAVIGATION_BTN_TEXT_SIZE * getResources().getDisplayMetrics().density);
        btn_navigation2.setTextSize(ListActivity.NAVIGATION_BTN_TEXT_SIZE * getResources().getDisplayMetrics().density);

        wbv_pdfViewer = (WebView)findViewById(R.id.wbv_pdfViewer);
        wbv_pdfViewer.getSettings().setBuiltInZoomControls(true);  //show zoom buttons
        wbv_pdfViewer.getSettings().setSupportZoom(true);          //allow zoom
        //get the width of the webview
        wbv_pdfViewer.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
        {
            @Override
            public void onGlobalLayout()
            {
                ViewSize = wbv_pdfViewer.getWidth();
                wbv_pdfViewer.getViewTreeObserver().removeGlobalOnLayoutListener(this);
            }
        });
        wbv_pdfViewer.getSettings().setUseWideViewPort(true);
        wbv_pdfViewer.setInitialScale(1);

        fromCaller = getIntent();
        directoryName = fromCaller.getStringExtra(MainActivity.DIRECTORY_NAME);
        fileName = fromCaller.getStringExtra(MainActivity.FILE_NAME);
        setTitle(fileName);     // show file name without expansion


        //publicFile = CreateTempAssetFile();
        //LoadPDFasHTML(publicFile);

        // load html file directly from asset
        String path = "file:///android_asset/" + directoryName + fileName.replace(" ", "_") + ".html";
        wbv_pdfViewer.loadUrl(path);
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



    /*
    Add actions to the action bar - home
     */
    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        // Inflate the menu items for use in the action bar
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.viewer_activity_actions, menu);
        return super.onCreateOptionsMenu(menu);
    }



    /*
    handle action in the action bar
     */
    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        try
        {
            switch (item.getItemId())
            {
                // Respond to the action bar's Up/Home button
                // go up to parent activity
                case android.R.id.home:
                    finish();
                    return true;

                // return directly to home - MainActivity
                case R.id.action_home:
                    startActivity(backHome);
                    return true;
            }
        }
        catch (Exception ex)
        {
            Toast.makeText(getApplicationContext(), ex.getMessage(), Toast.LENGTH_LONG).show();
        }

        return super.onOptionsItemSelected(item);
    }
}