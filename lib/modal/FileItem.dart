class FileItem {
  String phoneNumber;
  int timeCall;
  bool incoming;
  int timeStamp;
  String path;
  String nuName;

  FileItem(
      {this.phoneNumber,
      this.timeCall,
      this.incoming,
      this.timeStamp,
      this.path,
      this.nuName});

  FileItem.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    timeCall = json['timeCall'];
    incoming = json['incoming'];
    timeStamp = json['timeStamp'];
    path = json['path'];
    nuName = json['nuName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['timeCall'] = this.timeCall;
    data['incoming'] = this.incoming;
    data['timeStamp'] = this.timeStamp;
    data['path'] = this.path;
    data['nuName'] = this.nuName;
    return data;
  }
}
