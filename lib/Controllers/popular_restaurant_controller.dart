import 'dart:convert';
import 'package:get/get.dart';
import '/models/popular_restaurant.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';

class PopularRestaurantController extends GetxController {
  UserService userService = UserService();
  Server server = Server();

  bool popularRestaurantLoader = true;
  List<Datum> bestSellingRestaurantList = <Datum>[];

  @override
  void onInit() {
    super.onInit();
    popularRestaurantLoader = true;
    getPopularRestaurant();
  }

  getPopularRestaurant() async {
    print("getPopularRestaurant");
    bestSellingRestaurantList.clear();
    try {
      final response =
          await server.getRequest(endPoint: APIList.popularRestaurant);
      if (response != null && response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("Response from server: $jsonResponse");

        if (jsonResponse['data'] != null) {
          var data = jsonResponse['data'];
          if (data['status'] == 200) {
            if (data['data'] != null && data['data'].isNotEmpty) {
              var popularRestaurantData =
                  PopularRestaurant.fromJson(jsonResponse);
              if (popularRestaurantData.data?.data != null) {
                bestSellingRestaurantList
                    .addAll(popularRestaurantData.data!.data!);
                print("Loaded ${bestSellingRestaurantList.length} restaurants");
              } else {
                print("Data field is empty");
              }
            } else {
              print("No popular restaurants available.");
            }
          } else {
            print(
                "Failed to load popular restaurants: ${data['message'] ?? 'Unknown error'}");
          }
        } else {
          print("Response data is null");
        }
      } else {
        print("Error: ${response?.statusCode} ${response?.reasonPhrase}");
      }
    } catch (e) {
      print("Exception caught: $e");
    } finally {
      popularRestaurantLoader = false;
      update();
    }
  }
}
