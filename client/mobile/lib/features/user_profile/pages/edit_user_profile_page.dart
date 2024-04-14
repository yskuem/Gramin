
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/app_user/use_case/app_user_controller.dart';
import 'package:flutter_app_template/features/user_profile/constant/constant.dart';
import 'package:flutter_app_template/features/user_profile/pages/user_profile_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/custom_hooks/use_effect_once.dart';
import '../../../core/custom_hooks/use_form_field_state_key.dart';
import '../../../core/res/gen/assets.gen.dart';
import '../../../core/utils/image_operations.dart';
import '../../../core/widgets/show_indicator.dart';
import '../../../core/widgets/text_form_field/custom_text_form_field.dart';

class EditUserProfilePage extends HookConsumerWidget {
  const EditUserProfilePage({super.key});



  static String get pageName => 'edit_user_profile';
  static String get pagePath => '${UserProfilePage.pagePath}/$pageName';
  /// go_routerの画面遷移
  static void push(BuildContext context) {
    context.push(pagePath);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final newFileImage = useState<File?>(null);
    final currentUserState = ref.watch(appUserControllerProvider);
    final userNameTextFormKey = useFormFieldStateKey();
    final userIdTextFormKey = useFormFieldStateKey();
    final selfIntroductionTextFormKey = useFormFieldStateKey();

    useEffectOnce(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        userNameTextFormKey.currentState?.didChange(currentUserState.value?.name);
        userIdTextFormKey.currentState?.didChange(currentUserState.value?.displayId);
        selfIntroductionTextFormKey.currentState?.didChange(currentUserState.value?.description);
      });
      return null;
    });
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.quizBack1.path),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize( //appbar高さ調整
              preferredSize: Size.fromHeight(1 / 10 * MediaQuery.of(context).size.height),
              child: AppBar(
                title: const Text('プロフィール編集',style: TextStyle(fontSize: 17,color: Colors.black),),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back,color: Colors.black,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.red,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: ()  async {
                        if (
                          userIdTextFormKey.currentState?.validate() != true ||
                          userNameTextFormKey.currentState?.validate() != true ||
                          selfIntroductionTextFormKey.currentState?.validate() != true
                        ){
                          return;
                        }
                        showIndicator(context);
                        final userState = currentUserState.value;
                        if(userState == null) {
                          return;
                        }

                        String? updateIconUrl;
                        if(newFileImage.value != null) {
                          final upLoadImage = await ImageOperations.compressImage(newFileImage.value!, 10);
                          updateIconUrl = await ImageOperations.upLoadImage(userState.authId, upLoadImage);
                        }

                        await ref.read(appUserControllerProvider.notifier).onUpdate(
                          userState.copyWith(
                            iconUrl: updateIconUrl ?? userState.iconUrl,
                            name: userNameTextFormKey.currentState?.value ?? userState.name,
                            displayId: userIdTextFormKey.currentState?.value ?? userState.displayId,
                            description: selfIntroductionTextFormKey.currentState?.value ?? userState.description,
                          ),
                        );
                        dismissIndicator(context);
                        context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('プロフィールを変更しました'),
                              backgroundColor: Colors.blue,
                              //backgroundColor: Theme.of(context).primaryColor,
                            ),
                        ); //保存完了メッセージを出す
                      },
                      child: const Text('更新',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 120),
                child: TransparentCard(
                  opacity: 0.5,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final pickFile = await ImageOperations.pickImage();
                                      newFileImage.value = pickFile;
                                    },
                                    child: CircleAvatar(
                                      backgroundImage: newFileImage.value != null
                                          ? FileImage(newFileImage.value!)
                                          : CachedNetworkImageProvider(
                                              currentUserState.value?.iconUrl ?? '',
                                          ) as ImageProvider<Object>?,
                                      radius: 40,
                                      child: const Icon(Icons.camera_alt_outlined,color: Colors.white,size: 40,),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text('アイコン選択'),
                                ],
                              ),
                              const SizedBox(height: 30,),
                              Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 90/100,
                                    child: CustomTextFormField(
                                      maxLength: userNameMaxLength,
                                      labelName: userNameKey,
                                      textKey: userNameTextFormKey,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'ユーザーネームを入力してください';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 90/100,
                                    child: TextFormField(
                                      maxLength: userIdMaxLength,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                          labelText: userIdKey,
                                      ),
                                      key: userIdTextFormKey,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'ユーザーIDを入力してください';
                                        }
                                        final alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
                                        if (!alphaNumericRegex.hasMatch(value)) {
                                          return 'アルファベットと数字のみ使用できます。';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 90/100,
                                    child: TextFormField(
                                      maxLines: 3,
                                      maxLength: 100,
                                      key: selfIntroductionTextFormKey,
                                      decoration: const InputDecoration(
                                        hintText: '自己紹介を入力',
                                        labelText: '自己紹介',
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
