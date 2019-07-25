package com.example.newcallrecorder.modal;

public class CallData {
    private String phoneNumber;
    private int timeCall;
    private String incoming;
    private int timeStamp;
    private String path;
    private String nuName;

    public CallData(String phoneNumber, long timeCall, String incoming, long time, String path, String contact) {
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getTimeCall() {
        return timeCall;
    }

    public void setTimeCall(int timeCall) {
        this.timeCall = timeCall;
    }

    public String getIncoming() {
        return incoming;
    }

    public void setIncoming(String incoming) {
        this.incoming = incoming;
    }

    public int getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(int timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getNuName() {
        return nuName;
    }

    public void setNuName(String nuName) {
        this.nuName = nuName;
    }

    public CallData(String phoneNumber, int timeCall, String incoming, int timeStamp, String path, String nuName) {
        this.phoneNumber = phoneNumber;
        this.timeCall = timeCall;
        this.incoming = incoming;
        this.timeStamp = timeStamp;
        this.path = path;
        this.nuName = nuName;
    }
}
