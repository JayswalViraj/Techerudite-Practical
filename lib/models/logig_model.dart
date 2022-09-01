// To parse this JSON data, do
//
//     final loginApiModel = loginApiModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginApiModel loginApiModelFromJson(String str) => LoginApiModel.fromJson(json.decode(str));

String loginApiModelToJson(LoginApiModel data) => json.encode(data.toJson());

class LoginApiModel {
    LoginApiModel({
        required this.success,
        required this.message,
        required this.data,
    });

    bool success;
    String message;
    Data data;

    factory LoginApiModel.fromJson(Map<String, dynamic> json) => LoginApiModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.user,
        required this.token,
    });

    User user;
    String token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    User({
        required this.usrId,
        required this.usrFname,
        required this.usrLname,
        required this.usrUsername,
        required this.usrEmail,
        required this.usrProfile,
        required this.usrEmailVerToken,
        required this.usrResetPassToken,
        required this.usrEmailVerifiedAt,
        required this.usrProviderId,
        required this.usrLoginType,
        required this.usrStatus,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.usrProfileImg,
    });

    int usrId;
    String usrFname;
    String usrLname;
    String usrUsername;
    String usrEmail;
    String usrProfile;
    String usrEmailVerToken;
    String usrResetPassToken;
    DateTime usrEmailVerifiedAt;
    dynamic usrProviderId;
    dynamic usrLoginType;
    int usrStatus;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String usrProfileImg;

    factory User.fromJson(Map<String, dynamic> json) => User(
        usrId: json["usr_id"],
        usrFname: json["usr_fname"],
        usrLname: json["usr_lname"],
        usrUsername: json["usr_username"],
        usrEmail: json["usr_email"],
        usrProfile: json["usr_profile"],
        usrEmailVerToken: json["usr_email_ver_token"],
        usrResetPassToken: json["usr_reset_pass_token"],
        usrEmailVerifiedAt: DateTime.parse(json["usr_email_verified_at"]),
        usrProviderId: json["usr_provider_id"],
        usrLoginType: json["usr_login_type"],
        usrStatus: json["usr_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        usrProfileImg: json["usr_profile_img"],
    );

    Map<String, dynamic> toJson() => {
        "usr_id": usrId,
        "usr_fname": usrFname,
        "usr_lname": usrLname,
        "usr_username": usrUsername,
        "usr_email": usrEmail,
        "usr_profile": usrProfile,
        "usr_email_ver_token": usrEmailVerToken,
        "usr_reset_pass_token": usrResetPassToken,
        "usr_email_verified_at": usrEmailVerifiedAt.toIso8601String(),
        "usr_provider_id": usrProviderId,
        "usr_login_type": usrLoginType,
        "usr_status": usrStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "usr_profile_img": usrProfileImg,
    };
}
