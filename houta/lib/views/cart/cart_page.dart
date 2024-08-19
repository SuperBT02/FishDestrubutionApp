import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/custom_container.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/common/shimmers/foodlist_shimmer.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/cart_controller.dart';
import 'package:houta/controllers/login_controller.dart';
import 'package:houta/hooks/fetch_cart.dart';
import 'package:houta/main.dart';
import 'package:houta/models/cart_response.dart';
import 'package:houta/models/hook%20models/hook_result.dart';
import 'package:houta/models/login_response.dart';
import 'package:houta/views/auth/login_redirect.dart';
import 'package:houta/views/auth/verification_page.dart';
import 'package:houta/views/cart/widgets/cart_tile.dart';
import 'package:houta/views/home/home_page.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    FetchHook  hookResult = useFetchCart();
    final List<CartResponse> carts = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;
    LoginResponse? user;
    final controller = Get.put(LoginController());
    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
    }
    if (token != null && user!.verification == false) {
      return const VerificationPage();
    }
    if (token == null) {
      return const LoginRedirectPage();
    }else{

    

    return Scaffold(

      
      backgroundColor: kPrimary,
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(color: kPrimary,onPressed: ()async{
            {
          final userId = box.read("userId");
                 bool response =  await CartController().confirmCart(userId);
                 if(response){
          Get.to(defaultHome);
          Get.snackbar("Cart Confirmed Successfully","Enjoy",
              colorText: kLightWhite,
              snackPosition: SnackPosition.TOP,
              backgroundColor: kPrimary,
              icon: const Icon(Icons.check_circle_outline, color: kLightWhite));       }else{
          Get.snackbar("Error Confirming cart","Try Again",
              colorText: kLightWhite,
              snackPosition: SnackPosition.TOP,
              backgroundColor: kRed,
              icon: const Icon(Icons.check_circle_outline, color: kLightWhite));
                 }
                }
          },child: Text("Confirm",style: TextStyle(color: kWhite),), ),
        )],
          elevation: 0,
          backgroundColor: kOffWhite,
          centerTitle: true,
          title: ReusableText(
              text: "Cart ", style: appStyle(14, kGray, FontWeight.w600))),
      body: SafeArea(
          child: CustomContainer(
              ContainerContent: isLoading
                  ? const FoodsListShimmer()
                  : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        width: width,
                        height: height,
                        child: ListView.builder(
                            itemCount: carts.length,
                            itemBuilder: (context, i) {
                              var cart = carts[i];
                              return CartTile(
                                refetch: refetch,
                                color: kLightWhite,
                                cart: cart);
                            }),
                      ),
                  ))),


                  

                  //button ==> fc 
    );
  }
  }
}
