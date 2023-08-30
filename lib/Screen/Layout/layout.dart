import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../../model/resultModel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../Food/favFood.dart';
import '../Home.dart';
import '../login/login.dart';
import '../meal.dart';
import '../poll.dart';
import '../settings.dart';
import 'bloc/appbloc.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    //ResultModel resultModel = BlocProvider.of<AppBloc>(context).resultModel!;
    return
        // BlocProvider(
        // create: (BuildContext context) {
        //   return AppBloc(Repository());
        // },
        // child:
        AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [defaultNavyBlue, defaultPurple],
          ),
        ),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: white,
          iconColor: white,
          minLeadingWidth: 0.1,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 60.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(170.0),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: const Image(
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi !',
                            style: GoogleFonts.signikaNegative(
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                          Text('name',
                            // BlocProvider.of<AppBloc>(context)
                            //     .resultModel!
                            //     .name
                            //     .toString(),
                            style: GoogleFonts.signikaNegative(
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ListTile(
                    onTap: () {
                      navigateTo(
                        context,
                        setting(),
                      );
                    },
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                  ),
                  ListTile(
                    onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PollScreeen(context.read<AppBloc>());
                    }));
                  },
                    leading: const Icon(Icons.poll_outlined),
                    title: const Text('Poll'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.nights_stay),
                    title: const Text('mode'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.notifications_active),
                    title: const Text('notifications'),
                  ),
                  ListTile(
                    onTap: () {
                      CacheHelper.remove(key: 'token');
                    navigateAndFinish(context, LoginScreeen());
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        body:
            // child:
            BlocConsumer<AppBloc, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Scaffold(
                    body: state is Loading
                        ? const Center(child: CircularProgressIndicator(color: defaultPurple,))
                        : state is Error
                            ? Center(
                                child: ElevatedButton(
                                    child: const Text("try again"),
                                    onPressed: () {
                                      BlocProvider.of<AppBloc>(context)
                                          .add(InitFunc());
                                    }),
                              )
                            : IndexedStack(
                                index: BlocProvider.of<AppBloc>(context)
                                    .currentIndex,
                                children: [
                                  Home(),
                                  Meal(),
                                  Fav(),
                                ],
                              ),
                    bottomNavigationBar: WaterDropNavBar(
                      //height: 60.0,
                      barItems: <BarItem>[
                        BarItem(
                          filledIcon: Icons.home_rounded,
                          outlinedIcon: Icons.home_outlined,
                        ),
                        BarItem(
                          filledIcon: Icons.bookmark_rounded,
                          outlinedIcon: Icons.bookmark_border_rounded,
                        ),
                        BarItem(
                          filledIcon: Icons.favorite,
                          outlinedIcon: Icons.favorite_border,
                        ),
                      ],
                      //key: bottomNavigationKey,
                      backgroundColor: Colors.white70,
                      inactiveIconColor: grey,
                      waterDropColor: defaultPurple,
                      onItemSelected: (index) {
                        BlocProvider.of<AppBloc>(context).add(
                          AppChangeBottomIndex(index),
                        );
                      },
                      selectedIndex:
                          BlocProvider.of<AppBloc>(context).currentIndex,
                    ),
                  );
              }),
        ),
        // ),
    );
  }
}
