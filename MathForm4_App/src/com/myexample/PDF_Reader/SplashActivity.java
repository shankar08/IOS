package com.myexample.PDF_Reader;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

/**
 * Created by RedSin on 3/21/14.
 */
public class SplashActivity extends Activity
{
    private final int SPLASH_DISPLAY_LENGHT = 1000;
    Intent toMain;

    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash_view);

        ActionBar actionBar = getActionBar();

        actionBar.hide();

        toMain = new Intent (this, MainActivity.class);

        /* New Handler to start the Menu-Activity
            * and close this Splash-Screen after some seconds.*/
        new Handler().postDelayed(new Runnable()
        {
            @Override
            public void run()
            {
                startActivity(toMain);
                finish();
            }
        }, SPLASH_DISPLAY_LENGHT);
    }
}