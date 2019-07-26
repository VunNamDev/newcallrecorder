import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:newcallrecorder/main.dart';
import 'package:newcallrecorder/modal/FileItem.dart';
import 'package:newcallrecorder/screens/SplashScreen.dart';
part 'AppStore.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  List<FileItem> arrAll = new List<FileItem>();
  @observable
  List<FileItem> arrInComing = new List<FileItem>();
  @observable
  List<FileItem> arrOutGoing = new List<FileItem>();
  @observable
  List<FileItem> arrFavorite = new List<FileItem>();
  @observable
  FileItem playItem = new FileItem();

  @action
  void addArrAll(FileItem item) {
    this.arrAll.add(item);
    saveAll();
  }

  @action
  void addArrInComing(FileItem item) {
    this.arrInComing.add(item);
    saveIn();
  }

  @action
  void addArrOutGoing(FileItem item) {
    this.arrOutGoing.add(item);
    saveOut();
  }

  @action
  void removeArrAll(FileItem item) {
    if (sameItem(this.arrAll, item)) {
      print("remove all");
      this.arrAll.remove(item);
      saveAll();
    }
  }

  @action
  void removeArrInComing(FileItem item) {
    if (sameItem(this.arrInComing, item)) {
      print("remove in comming");

      this.arrInComing.remove(item);
      saveIn();
    }
  }

  @action
  void removeArrOutGoing(FileItem item) {
    if (sameItem(this.arrOutGoing, item)) {
      print("remove outgoing");

      this.arrOutGoing.remove(item);
      saveOut();
    }
  }

  @action
  void changeArrAll(List<FileItem> arrAll) {
    this.arrAll = arrAll;
  }

  @action
  void changeArrInComing(List<FileItem> arrInComing) {
    this.arrInComing = arrInComing;
  }

  @action
  void changeArrOutGoing(List<FileItem> arrOutGoing) {
    this.arrOutGoing = arrOutGoing;
  }

  @action
  void changearrFavorite(List<FileItem> arrFavorite) {
    this.arrFavorite = arrFavorite;
  }

  @action
  void changePlayItem(FileItem item) {
    print("change item");
    this.playItem = item;
  }

  @action
  void addarrFavorite(FileItem item, {del: false}) {
    if (del) {
      this.arrFavorite.remove(item);
    } else {
      if (!this.arrFavorite.contains(item)) {
        this.arrFavorite.add(item);
      } else {
        this.arrFavorite.remove(item);
      }
    }

    saveFavorite();
  }

  void saveAll() {
    List<String> arrStr = new List<String>();
    this.arrAll.forEach((f) {
      arrStr.add(jsonEncode(f.toJson()));
    });
    MyApp.prefs.setStringList("all", arrStr);
  }

  void saveIn() {
    List<String> arrStr = new List<String>();
    this.arrInComing.forEach((f) {
      arrStr.add(jsonEncode(f.toJson()));
    });
    MyApp.prefs.setStringList("in", arrStr);
  }

  void saveOut() {
    List<String> arrStr = new List<String>();
    this.arrOutGoing.forEach((f) {
      arrStr.add(jsonEncode(f.toJson()));
    });
    MyApp.prefs.setStringList("out", arrStr);
  }

  void saveFavorite() {
    List<String> arrStr = new List<String>();
    this.arrFavorite.forEach((f) {
      arrStr.add(jsonEncode(f.toJson()));
    });
    MyApp.prefs.setStringList("favorite", arrStr);
  }

  bool sameItem(List<FileItem> list, FileItem b) {
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        FileItem a = list[i];
        if (a.timeStamp == b.timeStamp &&
            a.phoneNumber.compareTo(b.phoneNumber) == 0 &&
            a.incoming.toString().compareTo(b.incoming.toString()) == 0 &&
            a.timeCall == b.timeCall) {
          return true;
        }
      }
    }

    return false;
  }
}

final AppStore store = new AppStore();
