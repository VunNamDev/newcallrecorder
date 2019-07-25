package com.example.newcallrecorder.service;

import com.example.newcallrecorder.modal.CallData;

import io.flutter.plugin.common.EventChannel;

public class FlutterListion implements EventChannel.StreamHandler {
    EventChannel.EventSink eventSink;
    public void sendData(CallData d){
        if(this.eventSink!=null){
            this.eventSink.success(d);
        }
    }
    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
    }

    @Override
    public void onCancel(Object o) {
        this.eventSink = null;
    }
}
