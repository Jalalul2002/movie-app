import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_app/screens/home_screen.dart';

final GlobalKey<HomeScreenState> kHomeScreenKey = GlobalKey();

const kThemoviedbURL = "https://api.themoviedb.org/3/movie";
const kThemovieDiscoverdbURL = "https://api.themoviedb.org/3/discover/movie";
const kThemoviedbSearchURL = "https://api.themoviedb.org/3/search/movie";
const kThemoviedbImageURL = "https://image.tmdb.org/t/p/w300";
const kHomeScreenButtonFirstText = "Populars";
const kHomeScreenButtonSecondText = "Coming Soon";
const kHomeScreenButtonThirdText = "Top Rated";
const kHomeScreenTitleText = "Watch Now";
const k404Text = "Movies not found";
const kFavoriteRemovedText = "Movie removed from Favorites";
const kFavoriteAddedText = "Movie added to Favorites";
const kDetailsScreenTitleText = "Overview";
const kStoryLineTitleText = "Storyline";
const kSplashScreenTitleText = "loading..";
const kFinderScreenTitleText = "Finder";
const kFavoriteScreenTitleText = "Favorites";
const kDrawerTitleFirstText = "OUR TEAM";
const kDrawerTitleSecondText = "ABOUT";
const kAppliedTheme = "Theme applied";
const kNotFoundErrorText = "Not found";
const kDrawerAboutDescText =
    "Hello!! We are from Team 1 Mobile Dev Informatic UIN Bandung";
const kMainGreenColor = Color(0xFF2C78C5);
const kMainOrangeColor = Color(0xFFE58901);
const kMainBlueColor = Color(0xFF2C78C5);
const kMainPinkColor = Color(0xFFE84CAF);

const kPrimaryColor = Color(0xFFE9F0F5);
const kLightGrey = Color(0xFFD2EBFD);
const kAppBarColor = Color(0xFFFFFFFF);
const kTextShadowColor = Color(0x4D000000);
const kBackgroundShadowColor = Color(0x4D161616);
const kDrawerLineColor = Color(0xFF707070);
const kInactiveButtonColor = Color(0xFF474747);
const kDrawerTextColor = Color(0xFF161616);
const kSubTitleCardBoxColor = Color(0xFF8E8E8E);
const kSearchAppBarColor = Color(0xFF2C78C5);

final kTextShadow = [
  Shadow(offset: Offset(0, 0.1.h), blurRadius: 6.0.sp, color: kTextShadowColor),
];

final kBoxShadow = [
  BoxShadow(
    color: kPrimaryColor,
    spreadRadius: 2,
    blurRadius: 2.sp,
    offset: const Offset(0,5),
  ),
];

final kHomeScreenButtonTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.bold,
);

final kBoldTitleTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.bold,
);

final kTitleTextStyle = TextStyle(
  fontSize: 12.sp,
);

final kDrawerDescTextStyle = TextStyle(
  fontSize: 12.sp,
  color: kDrawerTextColor,
  height: 0.19.h,
);

final kAppBarTitleTextStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
);

final kSplashScreenTextStyle = TextStyle(
  fontSize: 12.0.sp,
  color: kLightGrey,
);

final kSubTitleCardBoxTextStyle = TextStyle(
  color: kSubTitleCardBoxColor,
  fontSize: 9.sp,
);

final kSmallAppBarTitleTextStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
);

final kSmallTitleTextStyle = TextStyle(fontSize: 18.sp);

const kTextFieldDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

final kMovieAppBarTitleTextStyle = TextStyle(fontSize: 22.sp);

final kDetailScreenBoldTitle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
);
final kDetailScreenRegularTitle = TextStyle(
  fontSize: 20.sp,
);
