/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\features\account\presentation\pages\account.picker.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 15th 2021, 9:43:40 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/bloc/shared_bloc_state.dart';
import 'package:mobile/features/shared/presentation/widgets/button.dart';
import 'package:mobile/shared/shared.dart';

class UserAccountPickerPage extends StatefulWidget {
  const UserAccountPickerPage({Key? key}) : super(key: key);

  @override
  UserAccountPickerPageState createState() => UserAccountPickerPageState();
}

class UserAccountPickerPageState extends State<UserAccountPickerPage> {
  // account images
  final _accountTypeImages = <String>[
    'https://images.unsplash.com/photo-1543499459-d1460946bdc6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y291cmllcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGN1c3RvbWVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1556745753-b2904692b3cd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2VsbGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
  ];

  // user account type
  AccountType? _accountType;

  // bloc
  final _authBloc = AuthBloc(repository: Injector.get());

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, BlocState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is SuccessState<bool> && state.data) {
          // when data is saved successfully, navigate to login page
          context.showSnackBar(
              message: "Continuing as a ${_accountType?.asText()}");
          context.router
              .pushAndPopUntil(AuthenticationRoute(), predicate: (_) => false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // intro section
              'Welcome cherished user'.h5(),
              'Select an account type to get started'
                  .bodyText2(opacity: 0.67)
                  .top(4)
                  .bottom(40),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    var accountType = AccountType.values[index];
                    var accountImage = _accountTypeImages[index];

                    return GestureDetector(
                      onTap: () => setState(() => _accountType = accountType),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: DeviceConfig.kColorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            // image here
                            // Image.network(accountImage),
                            Positioned.fill(
                              child: CachedNetworkImage(
                                imageUrl: accountImage,
                                fit: BoxFit.cover,
                                color: DeviceConfig.kColorScheme.primary,
                                colorBlendMode: _accountType == accountType
                                    ? BlendMode.colorDodge
                                    : BlendMode.color,
                              ),
                            ),

                            // account type text
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                child: accountType.asText().bodyText1(
                                      color:
                                          DeviceConfig.kColorScheme.onSurface,
                                    ),
                                decoration: BoxDecoration(
                                  color: DeviceConfig.kColorScheme.surface
                                      .withOpacity(0.65),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),

                            // check button
                            Positioned(
                              top: 8,
                              right: 8,
                              child: AnimatedOpacity(
                                opacity: _accountType == accountType ? 1 : 0,
                                duration: Duration(milliseconds: 350),
                                child: Icon(
                                  Icons.check_circle,
                                  color: DeviceConfig.kColorScheme.background,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: AccountType.values.length,
                ),
              ),

              RoundedCornerButton(
                onTap: () => _authBloc
                    .add(SaveAccountTypeEvent(accountType: _accountType!)),
                enabled: _accountType != null,
                label: "Save & continue",
                icon: Icons.arrow_right_alt,
              ),
            ],
          ).horizontal(24).bottom(20).top(48),
        ),
      ),
    );
  }
}
