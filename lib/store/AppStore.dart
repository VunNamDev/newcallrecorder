import 'package:mobx/mobx.dart';
import 'package:newcallrecorder/modal/FileItem.dart';
part 'AppStore.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  static List<FileItem> arr = [
    new FileItem(
        phoneNumber: "01927462728",
        nuName: "Van Nam",
        incoming: true,
        path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
        timeCall: 94,
        timeStamp: 1564061982),
    new FileItem(
        phoneNumber: "01927462728",
        nuName: "Van Nam",
        incoming: true,
        path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
        timeCall: 94,
        timeStamp: 1564061982),
    new FileItem(
        phoneNumber: "01927462728",
        nuName: "Van Nam",
        incoming: false,
        path: "https://luan.xyz/files/audio/nasa_on_a_mission.mp3",
        timeCall: 94,
        timeStamp: 1564061982),
  ];
  @observable
  List<FileItem> arrAll = arr; //new List<FileItem>();
  @observable
  List<FileItem> arrInComing = arr; // new List<FileItem>();
  @observable
  List<FileItem> arrOutGoing = arr; //new List<FileItem>();
  @observable
  List<FileItem> arrFavotite = arr; //new List<FileItem>();
  @observable
  FileItem playItem = new FileItem();
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
  void changeArrFavotite(List<FileItem> arrFavotite) {
    this.arrFavotite = arrFavotite;
  }

  @action
  void changePlayItem(FileItem item) {
    this.playItem = item;
  }
}

final AppStore store = new AppStore();
