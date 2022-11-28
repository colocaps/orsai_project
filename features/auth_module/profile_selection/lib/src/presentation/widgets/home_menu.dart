import 'package:flutter/material.dart';
import 'package:profile_selection/src/presentation/widgets/home_menu_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeMenu extends StatelessWidget {
  final Function() _onNavigateToMovies;
  final String _moviesTitle;
  final String _seriesTitle;
  final String _castTitle;

  const HomeMenu({
    Key? key,
    required Function() onNavigateToMovies,
    required String moviesTitle,
    required String seriesTitle,
    required String castTitle,
  })  : _onNavigateToMovies = onNavigateToMovies,
        _moviesTitle = moviesTitle,
        _seriesTitle = seriesTitle,
        _castTitle = castTitle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double mobileHeigth;
    double mobileWidth;
    double tabletHeigth;
    double tabletWidth;

    mobileHeigth = size.height * 0.20;
    mobileWidth = size.width * 0.50;

    tabletHeigth = size.height * 0.23;
    tabletWidth = size.width * 0.39;

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.99,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/no-image.jpg',
                package: 'core',
              ),
              fit: BoxFit.none,
              opacity: 1.2,
            ),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: 30,
                runSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: _onNavigateToMovies,
                    child: HomeMenuItem(
                      imageRoute: 'assets/images/no-image.jpg',
                      itemName: _moviesTitle,
                      backgroundColor: Colors.blueAccent,
                      height: screenType == ScreenType.mobile
                          ? mobileHeigth
                          : tabletHeigth,
                      width: Device.screenType == ScreenType.mobile
                          ? mobileWidth
                          : tabletWidth,
                    ),
                  ),
                  GestureDetector(
                    onTap: _onNavigateToMovies,
                    child: HomeMenuItem(
                      imageRoute: 'assets/images/no-image.jpg',
                      itemName: _seriesTitle,
                      backgroundColor: Colors.redAccent,
                      height: screenType == ScreenType.mobile
                          ? mobileHeigth
                          : tabletHeigth,
                      width: Device.screenType == ScreenType.mobile
                          ? mobileWidth
                          : tabletWidth,
                    ),
                  ),
                  GestureDetector(
                    onTap: _onNavigateToMovies,
                    child: HomeMenuItem(
                      imageRoute: 'assets/images/no-image.jpg',
                      itemName: _castTitle,
                      backgroundColor: Colors.yellowAccent,
                      height: screenType == ScreenType.mobile
                          ? mobileHeigth
                          : tabletHeigth,
                      width: Device.screenType == ScreenType.mobile
                          ? mobileWidth
                          : tabletWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
