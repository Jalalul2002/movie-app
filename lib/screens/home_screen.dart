import 'package:flutter/material.dart';
import 'package:movie_app/screens/drawer_screen.dart';
import 'package:movie_app/screens/finder_screen.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/utils/file_manager.dart' as file;
import 'package:movie_app/utils/navi.dart' as navi;
import 'package:movie_app/utils/scroll_top_with_controller.dart'
as scrollTop;
import 'package:movie_app/utils/toast_alert.dart' as alert;
import 'package:movie_app/widgets/bottom_navigation.dart';
import 'package:movie_app/widgets/bottom_navigation_item.dart';
import 'package:movie_app/widgets/custom_loading_spin_kit_ring.dart';
import 'package:movie_app/widgets/custom_main_appbar_content.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/movie_card_container.dart';
import 'package:movie_app/widgets/shadowless_floating_button.dart';
import 'package:sizer/sizer.dart';
import 'package:movie_app/services/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //for custom drawer opening
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //for scroll upping
  ScrollController? _scrollController;
  bool showBackToTopButton = false;
  Color? themeColor;
  int? activeInnerPageIndex;
  List<MovieCard>? _movieCards;
  bool showSlider = true;
  String title = kHomeScreenTitleText;
  int bottomBarIndex = 1;

  Future<void> loadData() async {
    MovieModel movieModel = MovieModel();
    _movieCards = (bottomBarIndex == 1)
        ? await movieModel.getMovies(
        moviesType: MoviePageType.values[activeInnerPageIndex!],
        themeColor: themeColor!)
        : await movieModel.getFavorites(
        themeColor: themeColor!, bottomBarIndex: bottomBarIndex);
    setState(() {
      scrollTop.scrollToTop(_scrollController!);
      showBackToTopButton = false;
    });
  }

  void pageSwitcher(int index) {
    setState(() {
      bottomBarIndex = (index == 2) ? 2 : 1;
      title = (index == 2) ? kFavoriteScreenTitleText : kHomeScreenTitleText;
      showSlider = !(index == 2);
      _movieCards = null;
      loadData();
    });
  }

  void movieCategorySwitcher(int index) {
    setState(() {
      activeInnerPageIndex = index;
      _movieCards = null;
      loadData();
    });
  }

  @override
  void initState() {
    super.initState();
        () async {
      themeColor = await file.currentTheme();
      print(themeColor);
      _scrollController = ScrollController()
        ..addListener(() {
          setState(() {
            showBackToTopButton = (_scrollController!.offset >= 200);
          });
        });
      activeInnerPageIndex = 0;
      setState(() {
        loadData();
      });
    }();
  }

  @override
  void dispose() {
    if (_scrollController != null) _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (themeColor == null)
        ? CustomLoadingSpinKitRing(loadingColor: themeColor)
        : Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.transparent.withOpacity(0.1),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kAppBarColor,
        bottom: PreferredSize(
          preferredSize:
          Size.fromHeight((bottomBarIndex == 1) ? 13.0.h : 7.h),
          child: CustomMainAppBarContent(
            showSlider: showSlider,
            title: title,
            activeButtonIndex: activeInnerPageIndex!,
            activeColor: themeColor!,
            buttonFistOnPressed: (index) => movieCategorySwitcher(index),
            buttonSecondOnPressed: (index) =>
                movieCategorySwitcher(index),
            buttonThirdOnPressed: (index) => movieCategorySwitcher(index),
            searchOnPressed: () => navi.newScreen(
              context: context,
              newScreen: () => FinderScreen(
                themeColor: themeColor!,
              ),
            ),
          ),
        ),
      ),
      body: (_movieCards == null)
          ? CustomLoadingSpinKitRing(loadingColor: themeColor)
          : (_movieCards!.length == 0)
          ? Center(child: Text(k404Text))
          : MovieCardContainer(
        scrollController: _scrollController!,
        themeColor: themeColor!,
        movieCards: _movieCards!,
      ),
      bottomNavigationBar: BottomNavigation(
        activeColor: themeColor!,
        index: bottomBarIndex,
        children: [
          BottomNavigationItem(
            icon: Icon(Icons.menu_rounded),
            iconSize: 24.sp,
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          BottomNavigationItem(
            icon: Icon(Icons.home_rounded),
            iconSize: 24.sp,
            onPressed: () {
              pageSwitcher(1);
            },
          ),
          BottomNavigationItem(
              icon: Icon(Icons.star_rounded),
              iconSize: 24.sp,
              onPressed: () {
                pageSwitcher(2);
              }),
        ],
      ),
      drawerEnableOpenDragGesture: false,
      drawer: DrawerScreen(colorChanged: (color) {
        themeColor = color;
        setState(() {
          alert.toastAlert(
              message: kAppliedTheme, themeColor: themeColor);
        });
      }),
      floatingActionButton: showBackToTopButton
          ? ShadowlessFloatingButton(
        iconData: Icons.keyboard_arrow_up_outlined,
        onPressed: () {
          setState(() {
            scrollTop.scrollToTop(_scrollController!);
          });
        },
        backgroundColor: themeColor,
      )
          : null,
    );
  }
}
