// import 'package:medicare/models/dashboard.dart';
// import 'package:medicare/models/relation.dart';
// import 'package:medicare/models/user_profile.dart';
// import 'package:medicare/utils/dio_client.dart';

// class UserEndpoint {
//   static const String dashboard = '/timesheet/api/user/dashboard';
//   static const String allowedUserBranch = '/api/user/branch';
//   static const String profile = '/timesheet/api/user/profile';
// }

// class UserDatasource {
//   late final DioClient _client;

//   UserDatasource() {
//     _client = DioClient();
//   }

//   Future<Dashboard> dashboard(List<int> branchIds) async {
//     final response = await _client.dio.get(UserEndpoint.dashboard,
//         queryParameters: {"branch_ids": branchIds.toString()});

//     return Dashboard.fromJson(response.data);
//   }

//   Future<List<Relation>> allowedBranch() async {
//     final response = await _client.dio.get(UserEndpoint.allowedUserBranch);

//     return List<Relation>.from(
//         response.data['data'].map((e) => Relation.fromJson(e)));
//   }

//   Future<UserProfile> profile() async {
//     final response = await _client.dio.get(UserEndpoint.profile);

//     return UserProfile.fromJson(response.data);
//   }
// }
