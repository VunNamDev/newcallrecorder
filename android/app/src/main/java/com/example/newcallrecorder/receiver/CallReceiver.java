package com.example.newcallrecorder.receiver;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.media.MediaRecorder;
import android.os.Environment;
import android.os.Handler;
import android.provider.ContactsContract;
import android.util.Log;

import com.example.newcallrecorder.MainActivity;
import com.example.newcallrecorder.modal.CallData;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public class CallReceiver extends PhoneCallReceiver {
    private MediaRecorder myAudioRecorder;
    private String outputFile;
    private Context context;
    String name = "";
    Intent service;
    SharedPreferences sharedPreferences;
//    FlutterListion flutterListion = new FlutterListion();
    @Override
    protected void onIncomingCallReceived(Context ctx, String number, Date start) {
        Log.e("TAGGGGG", "onIncomingCallReceived " + start.getTime());
        context = ctx;
    }

    @Override
    protected void onIncomingCallAnswered(Context ctx, String number, Date start) {
        Log.e("TAGGGGG", "onIncomingCallAnswered " + start.getTime());
        context = ctx;
        name = setFileName(start);

        startRecord(PhoneCallReceiver.sharedPreferences.getInt("bitrate",128000), setFileName(start));
    }

    @Override
    protected void onIncomingCallEnded(Context ctx, String number, Date start, Date end) {
        Log.e("TAGGGGG", "onIncomingCallEnded " + start.getTime());
        context = ctx;
        stopRecord();
        sendData(number, (end.getTime() - start.getTime()) / 1000, "true", start, Environment.getExternalStorageDirectory().getAbsolutePath() + "/MyRecordCall/" + "callrecord_" + name + "." + PhoneCallReceiver.sharedPreferences.getString("format","m4a"));

    }

    @Override
    protected void onOutgoingCallStarted(Context ctx, String number,final Date start) {
        Log.e("TAGGGGG", "onOutgoingCallStarted " + number + "_" + setFileName(start));

        context = ctx;
        name = setFileName(start);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                startRecord(PhoneCallReceiver.sharedPreferences.getInt("bitrate",128000), setFileName(start));
            }
        }, 0);
    }

    @Override
    protected void onOutgoingCallEnded(Context ctx, String number, Date start, Date end) {
        Log.e("TAGGGGG", "onOutgoingCallEnded " + number + "_" + setFileName(end));
        context = ctx;
        stopRecord();
        sendData(number, (end.getTime() - start.getTime()) / 1000, "false", start, Environment.getExternalStorageDirectory().getAbsolutePath() + "/MyRecordCall/" + "callrecord_" + name + "." + PhoneCallReceiver.sharedPreferences.getString("format","m4a"));
    }

    @Override
    protected void onMissedCall(Context ctx, String number, Date start) {
        context = ctx;
    }
    String setFileName(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        return c.get(Calendar.DATE) + "_" + c.get(Calendar.MONTH) + "_" + c.get(Calendar.YEAR) + "_" + c.get(Calendar.HOUR_OF_DAY) + "_" + c.get(Calendar.MINUTE) + "_" + c.get(Calendar.SECOND);
    }
    void startRecord(int bitrate, String fileName) {//long bitrate, String fileName
        try {
            Log.e("TAGGGG", "bat dau ghi am");
            outputFile = Environment.getExternalStorageDirectory().getAbsolutePath() + "/MyRecordCall/" + "callrecord_" + name + "." + PhoneCallReceiver.sharedPreferences.getString("format","m4a");
            Log.e("TAGGGG", "file : " + outputFile);
            myAudioRecorder = new MediaRecorder();
            myAudioRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
            myAudioRecorder.setAudioEncodingBitRate(bitrate);
            myAudioRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
            myAudioRecorder.setAudioEncoder(MediaRecorder.OutputFormat.AMR_NB);
            myAudioRecorder.setOutputFile(outputFile);
            myAudioRecorder.prepare();
            myAudioRecorder.start();

        } catch (IllegalStateException ise) {
            // make something ...
            Log.e("TAGGGG", "IllegalStateException");
        } catch (IOException ioe) {
            Log.e("TAGGGG", "IOException");
            // make something
        }
    }
    void sendData(String phoneNumber, long timeCall, String incoming, Date timeStamp, String path) {
        CallData callData = new CallData(phoneNumber,timeCall,incoming,timeStamp.getTime(),path,getContact(phoneNumber));
        MainActivity.flutterListion.sendData(callData);
    }
    void stopRecord() {
        myAudioRecorder.stop();
        myAudioRecorder.release();
        myAudioRecorder = null;
    }
    private String getContact(String ph) {
        if(ph!=null){
            ContentResolver cr = context.getContentResolver();
            Cursor cur = cr.query(ContactsContract.Contacts.CONTENT_URI,
                    null, null, null, null);
            if ((cur != null ? cur.getCount() : 0) > 0) {
                while (cur != null && cur.moveToNext()) {
                    String id = cur.getString(
                            cur.getColumnIndex(ContactsContract.Contacts._ID));
                    String name = cur.getString(cur.getColumnIndex(
                            ContactsContract.Contacts.DISPLAY_NAME));

                    if (cur.getInt(cur.getColumnIndex(
                            ContactsContract.Contacts.HAS_PHONE_NUMBER)) > 0) {
                        Cursor pCur = cr.query(
                                ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                                null,
                                ContactsContract.CommonDataKinds.Phone.CONTACT_ID + " = ?",
                                new String[]{id}, null);
                        while (pCur.moveToNext()) {
                            String phoneNo = pCur.getString(pCur.getColumnIndex(
                                    ContactsContract.CommonDataKinds.Phone.NUMBER));

                            if (ph.equals(phoneNo)) {
                                Log.d("abcdefgh", ph + " vs " + phoneNo);
                                return name;
                            }

                        }
                        pCur.close();
                    }
                }
            }
            if (cur != null) {
                cur.close();
            }
        }
        return "Can't get name";
    }
    void saveData(int bitrate,String format){
        SharedPreferences sharedPreferences = context.getSharedPreferences("data", Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putInt("bitrate",bitrate);
        editor.putString("format",format);
        editor.commit();
//        Toast.makeText(abc.this,a + " ss ",Toast.LENGTH_SHORT).show();
    }
//    int getData(){
//        SharedPreferences sharedPreferences = context.getSharedPreferences("data", Context.MODE_PRIVATE);
//        return sharedPreferences.getInt("number",-1);
//    }
}
