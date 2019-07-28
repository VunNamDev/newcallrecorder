package com.example.newcallrecorder.utils;

public class Rate {
    public void showRateDialog() {
        int count = SharedPrefsUtils.getInstance(this).getInt("rate");
​
        if (count < 4) {
            RatingDialog ratingDialog = new RatingDialog(this);
            ratingDialog.setRatingDialogListener(this);
            ratingDialog.showDialog();
        }
    }
​
    @Override
    public void onDismiss() {
​
    }
​
    @Override
    public void onSubmit(float rating) {
        int count = SharedPrefsUtils.getInstance(this).getInt("rate");
        count++;
        SharedPrefsUtils.getInstance(this).putInt("rate", count);
        rateApp(this);
​
    }
​
    @Override
    public void onRatingChanged(float rating) {
​
    }
}
