package com.example.newcallrecorder.service;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.os.Build;
import android.os.Environment;
import android.os.IBinder;
import android.service.notification.StatusBarNotification;
import android.support.v4.app.NotificationCompat;
import android.util.Log;

import com.example.newcallrecorder.R;
import com.example.newcallrecorder.receiver.CallReceiver;

import java.io.File;

import static android.content.Intent.ACTION_NEW_OUTGOING_CALL;
import static android.telephony.TelephonyManager.ACTION_PHONE_STATE_CHANGED;

public class MyService extends Service {
    private CallReceiver callReceiver;
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        startMyOwnForeground();
        File folder = new File(Environment.getExternalStorageDirectory() +
                File.separator + "MyRecordCall");
        boolean success = true;
        if (!folder.exists()) {
            success = folder.mkdirs();
        }
        if (success) {
            callReceiver = new CallReceiver();
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction(ACTION_PHONE_STATE_CHANGED);
            intentFilter.addAction(ACTION_NEW_OUTGOING_CALL);
            intentFilter.addAction("sendDataToBroatcast");
            registerReceiver(callReceiver, intentFilter);

        } else {
            // Do something else on failure
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {


        return START_STICKY;
    }
    private void startMyOwnForeground() {
        NotificationChannel chan;
        String NOTIFICATION_CHANNEL_ID = "com.permanence";
        String channelName = "Background Service";


        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        assert manager != null;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            int c = 0;
            chan = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_HIGH);
            chan.setLightColor(Color.BLUE);
            chan.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);
            manager.createNotificationChannel(chan);


            StatusBarNotification[] arrNotifications = manager.getActiveNotifications();
            Log.d("idMesss",arrNotifications.length + " haha");

            NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID);
            Notification notification = notificationBuilder.setOngoing(true)
                    .setContentTitle("App is running in background")
                    .setPriority(NotificationManager.IMPORTANCE_MIN)
                    .setCategory(Notification.CATEGORY_SERVICE)
                    .build();
            startForeground(2, notification);

        }

    }
//    private void startMyOwnForeground(){
//        String NOTIFICATION_CHANNEL_ID = "com.example.simpleapp";
//        String channelName = "My Background Service";
//        NotificationChannel chan = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_NONE);
//        chan.setLightColor(Color.BLUE);
//        chan.setLockscreenVisibility(Notification.VISIBILITY_PRIVATE);
//        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//        assert manager != null;
//        manager.createNotificationChannel(chan);
//
//        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID);
//        Notification notification = notificationBuilder.setOngoing(true)
//                .setSmallIcon(R.drawable.launch_background)
//                .setContentTitle("App is running in background")
//                .setPriority(NotificationManager.IMPORTANCE_MIN)
//                .setCategory(Notification.CATEGORY_SERVICE)
//                .build();
//        startForeground(2, notification);
//    }
    @Override
    public void onDestroy() {
        super.onDestroy();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            stopForeground(true); //true will remove notification
        }
        stopSelf();
        unregisterReceiver(callReceiver);
    }
}
