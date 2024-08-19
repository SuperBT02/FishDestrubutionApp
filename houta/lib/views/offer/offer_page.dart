import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:houta/common/app_style.dart';
import 'package:houta/common/custom_buttom.dart';
import 'package:houta/common/pie_diag.dart';
import 'package:houta/common/reusable_text.dart';
import 'package:houta/constants/constants.dart';
import 'package:houta/controllers/cart_controller.dart';
import 'package:houta/controllers/login_controller.dart';
import 'package:houta/controllers/offers_controller.dart';
import 'package:houta/hooks/fetch_vendor.dart';
import 'package:houta/models/cart_request.dart';
import 'package:houta/models/login_response.dart';
import 'package:houta/models/offers_model.dart';
import 'package:houta/views/auth/login_page.dart';
import 'package:houta/views/auth/phone_verification_page.dart';
import 'package:houta/views/cart/cart_page.dart';
import 'package:houta/views/vendor/vendor_page.dart';

class OfferPage extends StatefulHookWidget {
  const OfferPage({super.key, required this.offer});
  final OffersModel offer;

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    LoginResponse? user;
    final controller = Get.put(OfferController());
    final loginController = Get.put(LoginController());
    user = loginController.getUserInfo();
    final hookResult = useFetchVendorr(widget.offer.vendor);
    print(widget.offer.imageUrl);
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
          child: Stack(
            children: [
              SizedBox(
                height: 230.h,
                child: PageView(children: [
                  Container(
                    width: width,
                    height: 230.h,
                    color: kGray,
                    child: CachedNetworkImage(
                        fit: BoxFit.cover, imageUrl: widget.offer.imageUrl),
                  ),
                ]),
              ),
              Positioned(
                top: 40.h,
                left: 12.w,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Ionicons.chevron_back_circle,
                    color: kPrimary,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 12.w,
                child: CustomButton(
                  onTap: () {
                    Get.to(() => VendorPage(
                         vendor: hookResult.data,
                        ));
                  },
                  btnWidth: 120.w,
                  text: "Available Vendor",
                ),
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            text: widget.offer.title,
                            style: appStyle(18, kDark, FontWeight.w600)),
                        Obx(
                          () => ReusableText(
                              text:
                                  "TND ${widget.offer.price * controller.count.value}",
                              style: appStyle(18, kPrimary, FontWeight.w600)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(widget.offer.description,
                        textAlign: TextAlign.justify,
                        maxLines: 8,
                        style: appStyle(13, kGray, FontWeight.w400)),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 19,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(widget.offer.offerTags.length,
                            (index) {
                          final tag = widget.offer.offerTags[index];
                          return Container(
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: ReusableText(
                                text: tag,
                                style: appStyle(11, kWhite, FontWeight.w400),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ReusableText(
                        text: "Dishes & Meals :",
                        style: appStyle(18, kDark, FontWeight.w600)),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 160,
                        width: 300,
                        child: ListView(
                          padding: EdgeInsets.only(top: 7.w, left: 55.w),
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                              widget.offer.offerDishes.length, (index) {
                            final tag = widget.offer.offerDishes[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10.w, top: 1.w),
                              decoration: BoxDecoration(
                                // image: DecorationImage(image:NetworkImage("https://banner2.cleanpng.com/20231210/ivv/transparent-yellow-circle-design-fork-and-spoon-crossed-utensi-flat-low-relief-image-of-yellow-fork-and-spoon657597631fcc25.6247302717022052831302.jpg",scale: 1.5)),
                                color: kSecondary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 7.w, left: 80.w, bottom: 7.w),
                                child: ReusableText(
                                  text: tag,
                                  style: appStyle(14, kWhite, FontWeight.w500),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 150,
                        width: 500,
                        child: PieChartSample(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            text: "Quantity",
                            style: appStyle(14, kDark, FontWeight.w600)),
                        SizedBox(
                          width: 5.w,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.increment();
                              },
                              child: const Icon(
                                AntDesign.pluscircleo,
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Obx(() => ReusableText(
                                    text: "${controller.count.value}",
                                    style:
                                        appStyle(14, kDark, FontWeight.w600)))),
                            GestureDetector(
                              onTap: () {
                                controller.decrement();
                              },
                              child: const Icon(
                                AntDesign.minuscircleo,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(user == null){
                                Get.to(()=> const LoginPage());
                              }else if(user.phoneVerification == false){
                                showVerificationSheet(context);
                              }else{
                                //print("order placed");
                                Get.to(()=> const CartPage());
                              }
                              
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: ReusableText(
                                  text: "Add To Cart",
                                  style: appStyle(
                                      20, kLightWhite, FontWeight.w600)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(widget.offer.vendor);
                                final box = GetStorage();

                              double price = (widget.offer.price * controller.count.value).toDouble();
                              var data= CartRequest(productId: widget.offer.id, 
                              quantity: controller.count.value, 
                              totalPrice: price,
                              vendor_id: widget.offer.vendor
                              );
                              String cart = cartRequestToJson(data);
                             box.read("token") == null? showDialog(context: context , builder: (context)=>AlertDialog(title: Icon(Icons.warning),content: Container(height: 70,child: Center(child: Text("You need To Login first"))),)): cartController.addToCart(cart);
                            },
                            child: CircleAvatar(
                                backgroundColor: kSecondary,
                                radius: 30.r,
                                child: const Icon(
                                  Ionicons.cart,
                                  color: kWhite,
                                  size: 35,
                                )),
                          )
                        ],
                      ),
                    )
                  ]),
            ))
      ],
    ));
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 500.h,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            )),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  ReusableText(
                      text: "Verify Your Phone Number",
                      style: appStyle(18, kPrimary, FontWeight.w600)),
                  SizedBox(
                    height: 280.h,
                    child: Column(
                      children:
                          List.generate(verificationReasons.length, (index) {
                        return ListTile(
                            leading: const Icon(Icons.check_circle_outline,
                                color: kPrimary),
                            title: Text(verificationReasons[index],
                                textAlign: TextAlign.justify,
                                style: appStyle(11, kDark, FontWeight.w400)));
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    text: "Verify Phone Number",
                    btnHeight: 40.h,
                    onTap: () {
                      Get.to(()=> const PhoneVerificationPage());
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
