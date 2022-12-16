class FollowServicesModel {
  int? id;
  String? categoryName;
  String? categoryStatus;
  String? createdAt;
  String? updatedAt;

  FollowServicesModel({
    this.id,
    this.categoryName,
    this.categoryStatus,
    this.createdAt,
    this.updatedAt,
  });

  FollowServicesModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryStatus = json['category_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_status'] = this.categoryStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
