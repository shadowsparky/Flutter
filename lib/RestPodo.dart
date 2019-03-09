class ResultObject {
  int page;
  int per_page;
  int total;
  int total_pages;
  List<ResultData> data;

  ResultObject(this.page, this.per_page, this.total, this.total_pages, this.data);

  factory ResultObject.parse(Map<String, dynamic>map){
    return ResultObject(
      map['page'],
      map['per_page'],
      map['total'],
      map['total_pages'],
      ResultData.parseList(map)
    );
  }

}

class ResultData {
  int id;
  String first_name;
  String last_name;
  String avatar;

  ResultData(this.id, this.first_name, this.last_name, this.avatar);

  static List<ResultData> parseList(Map<String, dynamic> map) {
    List<ResultData> data = [];
    for (var el in map['data']) {
      data.add(ResultData.parse(el));
    }
    return data;
  }

  factory ResultData.parse(Map<String, dynamic> map) {
    return ResultData(
      map['id'],
      map['first_name'],
      map['last_name'],
      map['avatar']
    );
  }

}