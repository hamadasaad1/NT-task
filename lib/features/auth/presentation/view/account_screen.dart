import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/app/singlton.dart';
import 'package:template/shared/common/widget/button_widget.dart';
import 'package:template/shared/common/widget/cach_image.dart';
import 'package:template/shared/common/widget/custom_image_widget.dart';
import 'package:template/shared/common/widget/image_picker_action_sheet.dart';
import 'package:template/shared/common/widget/text_filed_widget.dart';
import 'package:template/shared/resources/assets_manager.dart';
import 'package:template/shared/resources/color_manager.dart';
import 'package:template/shared/resources/manager_values.dart';
import 'package:template/shared/resources/size_config.dart';

import '../../../../app/media/media_service_interface.dart';
import '../../../../app/service_locator.dart';
import '../../../../shared/common/state_renderer/state_renderer.dart';
import '../../../../shared/common/widget/component.dart';
import '../model/input_update_user.dart';
import '../view_model/auth_cubit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isShowPassword = true;
  late AuthCubit _viewModel;
  final MediaServiceInterface _mediaService = locator<MediaServiceInterface>();
  File? image;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  void _getUserDetails(bool isGetData) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.getUser(isGetData: isGetData);
    });
  }

  @override
  void initState() {
    initAuthModule();

    if (Singleton().userData != null) {
      nameController.text = Singleton().userData?['fullName'] ?? '';
      emailController.text = Singleton().userData?['email'] ?? '';
    }

    // Initialize animation controller for fade-in transition
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _pickImageSource() async {
    AppImageSource? _appImageSource = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => ImagePickerActionSheet(),
    );
    if (_appImageSource != null) {
      _getImage(_appImageSource);
    }
  }

  Future<void> _getImage(AppImageSource _appImageSource) async {
    final _pickedImageFile =
        await _mediaService.uploadImage(context, _appImageSource);
    if (_pickedImageFile != null) {
      setState(() => image = _pickedImageFile);
      // Animate the upload
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: BlocProvider<AuthCubit>(
        create: (context) {
          _viewModel = AuthCubit();
          _getUserDetails(false);
          return _viewModel;
        },
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthUploadFileLoadingState) {
              // You can add more loading indicators if necessary
              showPopupDialog(
                  context: context,
                  stateRendererType: StateRendererType.popupLoadingState);
              _animationController.reverse(); // Trigger fade out
            }
            if (state is AuthUploadFileSuccessState) {
              dismissDialog(context);
              _getUserDetails(true);
              _animationController.forward(); // Trigger fade in after success
            }
            if (state is AuthUploadFileErrorState) {
              dismissDialog(context);
              showPopupDialog(
                  context: context,
                  message: state.failure.message,
                  retryActionFunction: () {},
                  stateRendererType: StateRendererType.popupErrorState);
            }
            if (state is AuthGetUserSuccessState) {
              nameController.text = Singleton().userData?['fullName'];
            }
          },
          builder: (context, state) {
            return SizedBox(
              height: ScreenUtil().screenHeight,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: getPadding(horizontal: AppPadding.p16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120.h,
                                child: InkWell(
                                  onTap: () async {
                                    _pickImageSource();
                                  },
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 96.w,
                                          height: 96.w,
                                          padding:
                                              getPadding(all: AppPadding.p16),
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFF2F2F2),
                                            shape: OvalBorder(),
                                          ),
                                          child: image != null
                                              ? Image.file(
                                                  File(image!.path),
                                                  height: 32.h,
                                                  width: 32.w,
                                                  fit: BoxFit.cover,
                                                )
                                              : Singleton().userData?[
                                                              'imageUrl'] !=
                                                          null &&
                                                      Singleton()
                                                          .userData?['imageUrl']
                                                          .isNotEmpty
                                                  ? CachedImage(
                                                      boxShape: BoxShape.circle,
                                                      url:
                                                          Singleton().userData?[
                                                              'imageUrl'],
                                                      fit: BoxFit.cover,
                                                    )
                                                  : CustomSvgImage(
                                                      width: 20.w,
                                                      height: 20.w,
                                                      imageName: Assets
                                                          .assetsSvgPerson),
                                        ),
                                      ),
                                      Positioned(
                                        left: ScreenUtil().screenWidth / 2.8,
                                        top: 90.h,
                                        child: Container(
                                          width: 2,
                                          height: 12,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              _pickImageSource();
                                            },
                                            child: const Icon(
                                                color: ColorManager.primary,
                                                size: 30,
                                                Icons
                                                    .add_circle_outline_outlined),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppSize.s20),
                              CustomTextField(
                                controller: nameController,
                                hintText: "Name",
                              ),
                              const SizedBox(height: AppSize.s20),
                              CustomTextField(
                                controller: emailController,
                                hintText: "Email",
                                isClickable: false,
                              ),
                              const SizedBox(height: AppSize.s40),
                              Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    child: CustomButton(
                                      onPress: () async {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          _viewModel.uploadFile(
                                              userModel: InputUpdateUserModel(
                                            name: nameController.text,
                                            image: image,
                                            email: emailController.text,
                                          ));
                                        }
                                      },
                                      labelText: 'Save',
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const SizedBox(height: AppSize.s28),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
