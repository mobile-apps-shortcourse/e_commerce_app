/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\features\onboarding\presentation\pages\welcome.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 8th 2021, 11:50:07 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/account/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/onboarding/presentation/widgets/page.indicator.dart';
import 'package:mobile/shared/shared.dart';

/// initial route for all users
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // configure page view
  int _currentPage = 0, _pages = 4;

  final _authBloc = AuthBloc(repository: Injector.get());

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // setup device configuration
    DeviceConfig.init(context);

    return Scaffold(
      extendBody: true,
      // content of the page
      body: Column(
        children: [
          // top section
          Expanded(
            flex: 3,
            // Stack -> allows for children to be place one on top
            // of the other
            child: SafeArea(
              child: Stack(
                children: [
                  // takes the top-left corner of the screen
                  Positioned.fill(
                    top: 28,
                    left: 16,
                    right: 16,
                    // this displays text
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          'New collection\nSpring 2021',
                          style: DeviceConfig.kTextTheme.headline4?.copyWith(
                            color: Colors.black,
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        // updates the current page index whenever the user swipes
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: _pages,
                    ),
                  ),

                  // takes up the bottom-center of the screen
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 16,
                    child: Row(
                      children: [
                        // indicators
                        Expanded(
                          child: PageIndicator(
                            pages: _pages,
                            currentPageIndex: _currentPage,
                          ),
                        ),

                        // round button
                        FloatingActionButton(
                          onPressed: () async {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //       builder: (context) => HomePage()),
                            // );
                            // navigate to a certain page and remove all other pages in the route stack
                            // context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => false);

                            // remove current route and navigate to new page
                            context.router.popAndPush(UserAccountPickerRoute());
                            // context.router.popAndPush(_authBloc.isLoggedIn
                            //     ? HomeRoute()
                            //     : UserAccountPickerRoute());

                            // navigate to the next route and back
                            // context.router.navigate(HomeRoute());
                          },
                          child: Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // bottom section
          Expanded(
            flex: 4,
            child: Container(
              width: DeviceConfig.kDeviceWidth,
              height: DeviceConfig.kDeviceHeight,
              decoration: BoxDecoration(
                // color: kColorScheme.onBackground,
                image: DecorationImage(
                  image: AssetImage(kWelcomeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
