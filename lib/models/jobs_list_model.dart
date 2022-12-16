class Data {
  int? id;
  String? categoryId;
  String? userId;
  String? jobTitle;
  String? shortDescription;
  String? longDescription;
  String? budget;
  String? lat;
  String? long;
  String? serviceCode;
  String? jobStatus;
  String? createdAt;
  String? updatedAt;
  UserJob? userJob;
  List<JobMedias>? jobMedias;

  Data(
      {this.id,
      this.categoryId,
      this.userId,
      this.jobTitle,
      this.shortDescription,
      this.longDescription,
      this.budget,
      this.lat,
      this.long,
      this.serviceCode,
      this.jobStatus,
      this.createdAt,
      this.updatedAt,
      this.userJob,
      this.jobMedias});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    userId = json['user_id'];
    jobTitle = json['job_title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    budget = json['budget'];
    lat = json['lat'];
    long = json['long'];
    serviceCode = json['service_code'];
    jobStatus = json['job_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userJob = json['user_job'] != null
        ? new UserJob.fromJson(json['user_job'])
        : null;
    if (json['job_medias'] != null) {
      jobMedias = <JobMedias>[];
      json['job_medias'].forEach((v) {
        jobMedias!.add(new JobMedias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['user_id'] = this.userId;
    data['job_title'] = this.jobTitle;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['budget'] = this.budget;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['service_code'] = this.serviceCode;
    data['job_status'] = this.jobStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userJob != null) {
      data['user_job'] = this.userJob!.toJson();
    }
    if (this.jobMedias != null) {
      data['job_medias'] = this.jobMedias!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserJob {
  int? id;
  Null? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? city;
  String? province;
  String? postalcode;
  String? profileCompleted;
  String? roleType;
  String? status;
  String? profileCompletedAt;
  Null? profilePicture;

  UserJob(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      this.city,
      this.province,
      this.postalcode,
      this.profileCompleted,
      this.roleType,
      this.status,
      this.profileCompletedAt,
      this.profilePicture});

  UserJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    city = json['city'];
    province = json['province'];
    postalcode = json['postalcode'];
    profileCompleted = json['profile_Completed'];
    roleType = json['role_type'];
    status = json['status'];
    profileCompletedAt = json['profile_completed_at'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['city'] = this.city;
    data['province'] = this.province;
    data['postalcode'] = this.postalcode;
    data['profile_Completed'] = this.profileCompleted;
    data['role_type'] = this.roleType;
    data['status'] = this.status;
    data['profile_completed_at'] = this.profileCompletedAt;
    data['profile_picture'] = this.profilePicture;
    return data;
  }
}

class JobMedias {
  int? id;
  String? basePath;
  String? fileName;
  String? jobId;
  String? createdAt;
  String? updatedAt;

  JobMedias(
      {this.id,
      this.basePath,
      this.fileName,
      this.jobId,
      this.createdAt,
      this.updatedAt});

  JobMedias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    basePath = json['base_path'];
    fileName = json['file_name'];
    jobId = json['job_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['base_path'] = this.basePath;
    data['file_name'] = this.fileName;
    data['job_id'] = this.jobId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
