import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttercatalog/presentation/layout/adaptive.dart';
import 'package:fluttercatalog/values/values.dart';
import 'package:fluttercatalog/widgets/custom_button.dart';
import 'package:fluttercatalog/widgets/spaces.dart';

class OnBoardingScreen5 extends StatefulWidget {
  @override
  _OnBoardingScreen5State createState() => _OnBoardingScreen5State();
}

class _OnBoardingScreen5State extends State<OnBoardingScreen5> {
  double currentIndexPage;
  int pageLength;
  List<String> onBoardingImageList = [
    ImagePath.CARRIBEAN,
    ImagePath.YOGA_2,
    ImagePath.SUNRISE,
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = onBoardingImageList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: assignHeight(context: context, fraction: 0.65),
            child: PageView(
              children: _buildBackgroundImages(onBoardingImageList),
              onPageChanged: (value) {
                setState(() => currentIndexPage = value.toDouble());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.PADDING_16,
            ),
            child: _buildDotsIndicator(),
          ),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Container(
      height: assignHeight(context: context, fraction: 0.65),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: assignHeight(context: context, fraction: 0.1),
              child: DotsIndicator(
                dotsCount: pageLength,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  color: AppColors.indigo50,
                  activeColor: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackgroundImages(List<String> imageList) {
    List<Widget> images = [];

    for (int index = 0; index < imageList.length; index++) {
      images.add(
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(Sizes.RADIUS_60),
          ),
          child: Image.asset(
            imageList[index],
            width: assignWidth(context: context, fraction: 1),
            height: assignHeight(context: context, fraction: 0.65),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return images;
  }

  Widget _buildInfo() {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: assignHeight(context: context, fraction: 0.65),
      ),
      child: Container(
        height: assignHeight(context: context, fraction: 0.35),
        child: Column(
          children: [
            Spacer(),
            Text(StringConst.WELCOME, style: theme.textTheme.headline4),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_16),
              child: Text(
                StringConst.LOREM_IPSUM,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyText2.copyWith(
                  color: AppColors.blackShade6,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: assignHeight(context: context, fraction: 0.1),
              decoration: BoxDecoration(
                color: AppColors.violet400,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(Sizes.RADIUS_60),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  Text(
                    StringConst.CONTINUE,
                    style: theme.textTheme.subtitle1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
