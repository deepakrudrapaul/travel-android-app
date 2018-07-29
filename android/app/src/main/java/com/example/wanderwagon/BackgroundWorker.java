package com.example.wanderwagon;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.location.Location;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.util.Log;
import android.widget.Toast;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;
import androidx.work.Worker;

public class BackgroundWorker extends Worker {

    private static final String TAG = BackgroundWorker.class.getSimpleName();
    private static final int REQUEST_FINE_LOCATION = 1000;

    private FusedLocationProviderClient mFusedLocationClient;
    private LocationRequest locationRequest;
    private LocationCallback locationCallback;
    private long UPDATE_INTERVAL = 10 * 1000;


    @NonNull
    @Override
    public Result doWork() {

        final Context applicationContext = getApplicationContext();
        mFusedLocationClient = LocationServices.getFusedLocationProviderClient(applicationContext);
        if (ActivityCompat.checkSelfPermission(applicationContext, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            Log.d("doWork()  :   ",  "LOCATION DISABLED");
            return Result.FAILURE;
        } else  {
            mFusedLocationClient.getLastLocation().addOnSuccessListener(new OnSuccessListener<Location>() {
                @Override
                public void onSuccess(Location location) {
                    if (location != null) {
                        Log.d("Success  :   ",  location.toString());
                    }
                }
            });
            return Result.SUCCESS;
        }
    }

}
