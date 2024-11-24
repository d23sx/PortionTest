import 'package:flutter/material.dart';
import 'package:oz_cafe/ui/common/text_style.dart';
import 'package:oz_cafe/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: kcBackgroundColor,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Image.asset("assets/icons/Frame-8.png",height: 22,color: kcEazyBlueColor,)),
            ]),
        backgroundColor: kcBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 70),
                  child: SizedBox(
                    height: 150,
                    child: ClipOval(
                      child: Image.asset("assets/img/user.png"),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Text("Dana Showaiter", style: FontStyles.header2,),
                verticalSpaceTiny,
                Text("Dana.Showaiter@gmail.com", style: FontStyles.body,),
                verticalSpaceSmall,
                SizedBox(
                  width: 150,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kcEazyBlueColor,
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    child: const Text("Edit Profile",
                        style: TextStyle(
                          color: kcVintageCreamColor,
                          fontSize: 20,
                        )),
                  ),
                ),
                verticalSpaceMedium,
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    decoration:  const BoxDecoration(
                      color: kcLighterGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: kcLightEazyBlueColor,
                            child: Icon(Icons.list_alt_outlined,color: kcEazyBlueColor,),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order History",style: FontStyles.title1,overflow: TextOverflow.ellipsis,),
                                Text("Order History",style: FontStyles.caption,overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,color: kcEazyBlueColor,))
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    decoration:  const BoxDecoration(
                      color: kcLighterGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: kcLightEazyBlueColor,
                            child: Icon(Icons.payment,color: kcEazyBlueColor,),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Payment Methods",style: FontStyles.title1,overflow: TextOverflow.ellipsis,),
                                Text(" cards",style: FontStyles.caption,overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,color: kcEazyBlueColor,))
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    decoration:  const BoxDecoration(
                      color: kcLighterGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: kcLightEazyBlueColor,
                            child: Icon(Icons.card_giftcard,color: kcEazyBlueColor,),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rewards",style: FontStyles.title1,overflow: TextOverflow.ellipsis,),
                                Text("120 Points",style: FontStyles.caption,overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,color: kcEazyBlueColor,))
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    decoration:  const BoxDecoration(
                      color: kcLighterGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: kcLightEazyBlueColor,
                            child: Icon(Icons.my_location,color: kcEazyBlueColor,),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Delivery Addresses",style: FontStyles.title1,overflow: TextOverflow.ellipsis,),
                                Text("your Adresses",style: FontStyles.caption,overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,color: kcEazyBlueColor,))
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    decoration:  const BoxDecoration(
                      color: kcLighterGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: kcLightEazyBlueColor,
                            child: Icon(Icons.help,color: kcEazyBlueColor,),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Get Help",style: FontStyles.title1,overflow: TextOverflow.ellipsis,),
                                Text("Questions",style: FontStyles.caption,overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,color: kcEazyBlueColor,))
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 70,
                    decoration:  const BoxDecoration(
                      color: kcLighterGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: kcLightEazyBlueColor,
                            child: Icon(Icons.settings,color: kcEazyBlueColor,),
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("User Settings",style: FontStyles.title1,overflow: TextOverflow.ellipsis,),
                                Text("Additional Settings",style: FontStyles.caption,overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.navigate_next_rounded,color: kcEazyBlueColor,))
                        ],
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
