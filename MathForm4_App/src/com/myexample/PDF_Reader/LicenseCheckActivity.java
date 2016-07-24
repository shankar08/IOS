package com.myexample.PDF_Reader;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.provider.Settings;
import android.util.Log;
import android.view.KeyEvent;
import com.google.android.vending.licensing.AESObfuscator;
import com.google.android.vending.licensing.LicenseChecker;
import com.google.android.vending.licensing.LicenseCheckerCallback;
import com.google.android.vending.licensing.ServerManagedPolicy;

public abstract class LicenseCheckActivity extends Activity
{

    static boolean licensed = true;
    static boolean didCheck = false;
    static boolean checkingLicense = false;
    static final String BASE64_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgnsAGwzRfAdANKrEZUvtdd6SpoOan7l2mfOw1OntHuF1/36lVv/tnD+wr9jY5LxbY1+cC+fkcMnqxITsxlmFDvwdnrhM6YiyX7kTyBIJMtm4Ek+PYBG9MtAJni+hkOdzMFvCLVfvnFNrU06M5vOTVY4BASB4LmBa8iFWtGvBh/6PkOEsTTcgv1yhFQNGjuB3mr5vW9FWrvBPO19AEq+DntESdt82HLghLtAFJiEx520rUs6E1i+UmEq/VdLgk11Y5pyemK8v9geGq3otNfU4VnbFrQ6eK1nHKRp6tVNGjOFEsgB7AKVbYPka9c0ntIzUuh2d2WhI8GMtav7k84gCcwIDAQAB";

    LicenseCheckerCallback mLicenseCheckerCallback;
    LicenseChecker mChecker;

    Handler mHandler;

    //SharedPreferences prefs;

    // REPLACE WITH YOUR OWN SALT , THIS IS FROM EXAMPLE
    private static final byte[] SALT = new byte[]
            {
                    -46, 65, 30, -128, -103, -57, 74, -64, 51, 88, -95, -45, 77, -117, -36, -113, -11, 32, -64, 89
            };

    private void displayResult(final String result)
    {
        mHandler.post(new Runnable()
        {
            public void run()
            {
                setProgressBarIndeterminateVisibility(false);
            }
        });
    }

    protected void doCheck()
    {
        didCheck = false;
        checkingLicense = true;
        setProgressBarIndeterminateVisibility(true);

        // Library calls this when it's done.
        mLicenseCheckerCallback = new MyLicenseCheckerCallback();
        mChecker.checkAccess(mLicenseCheckerCallback);
    }

    protected void checkLicense()
    {
        Log.i("LICENSE", "checkLicense");
        mHandler = new Handler();

        // Try to use more data here. ANDROID_ID is a single point of attack.
        String deviceId = Settings.Secure.getString(getContentResolver(), Settings.Secure.ANDROID_ID);

        // Construct the LicenseChecker with a policy.
        mChecker = new LicenseChecker( this, new ServerManagedPolicy(this, new AESObfuscator(SALT, getPackageName(), deviceId)),BASE64_PUBLIC_KEY);

//        mChecker = new LicenseChecker(
//                this, new StrictPolicy(),
//                BASE64_PUBLIC_KEY);

        doCheck();
    }

    protected class MyLicenseCheckerCallback implements LicenseCheckerCallback
    {

        public void allow(int notUsed)
        {
            Log.i("LICENSE", "allow");
            if (isFinishing()) {
                // Don't update UI if Activity is finishing.
                return;
            }
            // Should allow user access.
            displayResult(getString(R.string.allow));
            licensed = true;
            checkingLicense = false;
            didCheck = true;

        }

        public void dontAllow(int notUsed)
        {
            Log.i("LICENSE", "dontAllow");
            if (isFinishing()) {
                // Don't update UI if Activity is finishing.
                return;
            }
            displayResult(getString(R.string.dont_allow));
            licensed = false;
            // Should not allow access. In most cases, the app should assume
            // the user has access unless it encounters this. If it does,
            // the app should inform the user of their unlicensed ways
            // and then either shut down the app or limit the user to a
            // restricted set of features.
            // In this example, we show a dialog that takes the user to Market.
            checkingLicense = false;
            didCheck = true;

            showDialog(0);
        }

        public void applicationError(int errorCode)
        {
            Log.i("LICENSE", "error: " + errorCode);
            if (isFinishing()) {
                // Don't update UI if Activity is finishing.
                return;
            }
            licensed = false;
            // This is a polite way of saying the developer made a mistake
            // while setting up or calling the license checker library.
            // Please examine the error code and fix the error.
            String result = String.format(getString(R.string.application_error), errorCode);
            checkingLicense = false;
            didCheck = true;

            //displayResult(result);
            showDialog(0);
        }
    }

    protected Dialog onCreateDialog(int id)
    {
        // We have only one dialog.
        return new AlertDialog.Builder(this)
                .setTitle(R.string.unlicensed_dialog_title)
                .setMessage(R.string.unlicensed_dialog_body)
                .setPositiveButton(R.string.buy_button, new DialogInterface.OnClickListener()
                {
                    public void onClick(DialogInterface dialog, int which) {
                        Intent marketIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(
                                "http://market.android.com/details?id=" + getPackageName()));
                        startActivity(marketIntent);
                        finish();
                    }
                })
                .setNegativeButton(R.string.quit_button, new DialogInterface.OnClickListener()
                {
                    public void onClick(DialogInterface dialog, int which)
                    {
                        finish();
                    }
                })

                .setCancelable(false)
                .setOnKeyListener(new DialogInterface.OnKeyListener() {
                    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                        Log.i("License", "Key Listener");
                        finish();
                        return true;
                    }
                })
                .create();

    }

    @Override
    protected void onDestroy()
    {
        super.onDestroy();
        if (mChecker != null) {
            Log.i("LIcense", "distroy checker");
            mChecker.onDestroy();
        }
    }

}