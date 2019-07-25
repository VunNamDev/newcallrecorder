package com.example.newcallrecorder.NativeModule;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import com.example.newcallrecorder.service.MyService;

public class MyModule {
    Context context;
    Intent it;
    MyService myService;
    public MyModule(Context context) {
        this.context = context;
    }
    public void turnOn( String title, String content ) {
        it = new Intent(context,MyService.class);
        it.putExtra("title",title);
        it.putExtra("content",content);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            context.startForegroundService(it);
        }
        else {
            context.startService(it);
        }

    }
    public void turnOff(  ) {
        if(it!= null){
            context.stopService(it);
        }
        it = null;
    }
}
