class FileItem {
  String icon;
  String name;

  FileItem({this.icon, this.name});

  FileItem.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['name'] = this.name;
    return data;
  }
}
