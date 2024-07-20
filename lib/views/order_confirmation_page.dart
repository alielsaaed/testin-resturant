import 'package:flutter/material.dart';
import '/Controllers/cart_controller.dart';
import '/Controllers/global-controller.dart';
import '/screens/main_screen.dart';
import '/utils/font_size.dart';
import '/utils/theme_colors.dart';
import '/views/order_details.dart';
import 'package:get/get.dart';

class OrderConfirmation extends StatefulWidget {
  final int? orderId;
  final String? totalAmount, deliveryCharge, subTotal, discount;
  OrderConfirmation(
      {required this.orderId,
      required this.discount,
      required this.totalAmount,
      required this.deliveryCharge,
      required this.subTotal});

  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  var mainHeight, mainWidth;

  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Get.find<CartController>().clearCart();
        Get.off(() => MainScreen());
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: confirmBottomSheet(),
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Get.find<CartController>().clearCart();
                Get.off(() => MainScreen());
              }),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Confirmation',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: ThemeColors.baseThemeColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: ThemeColors.baseThemeColor,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: mainWidth / 5,
                  ),
                  radius: mainWidth / 4,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your order has been placed",
                  style: TextStyle(
                      // fontWeight: FontWeight.w300,
                      fontSize: FontSize.xLarge,
                      color: Colors.black87),
                ),
                Text(
                  " successfully ",
                  style: TextStyle(
                      fontSize: FontSize.xLarge, color: Colors.black87),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  confirmBottomSheet() => Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: mainHeight / 3.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  'Sub Total',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                Container(
                    child: Text(
                  "${Get.find<GlobalController>().currency!}${widget.subTotal}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  'Discount',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                Container(
                    child: Text(
                  "${Get.find<GlobalController>().currency!}${widget.discount}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ],
            ),
          ),
          //SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  'Delivery Fee',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                Container(
                    child: Text(
                  "${Get.find<GlobalController>().currency!}${widget.deliveryCharge}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ],
            ),
          ),
          //SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                  'Total',
                  style: TextStyle(
                      color: ThemeColors.baseThemeColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 5,
                ),
                Container(
                    child: Text(
                  "${Get.find<GlobalController>().currency!}${widget.totalAmount}",
                  style: TextStyle(
                    color: ThemeColors.baseThemeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
              ],
            ),
          ),
          // SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: mainWidth,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.baseThemeColor, // background
                foregroundColor: Colors.white, // foreground
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // <-- Radius
                ),
              ),
              onPressed: () async {
                Get.find<CartController>().clearCart();
                setState(() {
                  Get.off(() => OrderDetails(orderId: widget.orderId));
                });
              },
              child: Text(
                'My orders',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ));
}
