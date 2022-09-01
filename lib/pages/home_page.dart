import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practicaltecherudite/api_services/api_services.dart';
import 'package:practicaltecherudite/models/home_list_model.dart';
import 'package:practicaltecherudite/responsiv_layout/responsiv_class.dart';
import 'package:practicaltecherudite/utils/assets_path.dart';
import 'package:practicaltecherudite/utils/colors.dart';
import 'package:practicaltecherudite/widgets/custome_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiServices.callHomeListApi();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Search',
      style: optionStyle,
    ),
    Text(
      'Index 1: Events',
      style: optionStyle,
    ),
    Text(
      'Index 2: Favorites',
      style: optionStyle,
    ),
    Text(
      'Index 3: Pofile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cardWidth = MediaQuery.of(context).size.width * 0.70;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsResources().searchIcon,
              height: SizeConfig.heightMultiplier * 2,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsResources().calenderIcon,
              height: SizeConfig.heightMultiplier * 2,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsResources().heartOutlineIcon,
              height: SizeConfig.heightMultiplier * 2,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsResources().profileIcon,
              height: SizeConfig.heightMultiplier * 2,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.black,
        selectedItemColor: AppColors.textColorGreen,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: AppColors.homePageBackgroundColor,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.all(SizeConfig.widthMultiplier * 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomeText(
                      text: "Hello Renzo!",
                      color: AppColors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomeText(
                      text: "Are you ready to dance?",
                      color: AppColors.gray3,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 3,
              ),
              FutureBuilder(
                  future: ApiServices.callHomeListApi(),
                  builder: (context, AsyncSnapshot<HomeList> snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.data.events.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.widthMultiplier * 2,
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.widthMultiplier * 2)),
                                  color: AppColors.white,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: SizeConfig.heightMultiplier * 2,
                                      bottom: SizeConfig.heightMultiplier * 2,
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: SizeConfig.widthMultiplier * 2,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.heightMultiplier),
                                          child: Image.network(
                                            fit: BoxFit.fill,
                                            width:
                                                SizeConfig.heightMultiplier * 9,
                                            snapshot.data!.data.events[index]
                                                .eventProfileImg,
                                            height:
                                                SizeConfig.heightMultiplier * 9,
                                          ),
                                        ),
                                        SizedBox(
                                          width: SizeConfig.widthMultiplier * 2,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: cardWidth,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .data
                                                          .events[index]
                                                          .eventName,
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .textColor,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    AssetsResources().nextIcon,
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        2,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      0.5,
                                            ),
                                            Container(
                                              width: cardWidth,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomeText(
                                                    text: snapshot
                                                            .data!
                                                            .data
                                                            .events[index]
                                                            .readableToDate +
                                                        " - " +
                                                        snapshot
                                                            .data!
                                                            .data
                                                            .events[index]
                                                            .readableFromDate,
                                                    color: AppColors
                                                        .textColorGreen,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  CustomeText(
                                                    text: snapshot
                                                            .data!
                                                            .data
                                                            .events[index]
                                                            .city +
                                                        ", " +
                                                        snapshot
                                                            .data!
                                                            .data
                                                            .events[index]
                                                            .country,
                                                    color: AppColors.gray3,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),
                                            ), //65 - €450
                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      0.5,
                                            ),
                                            CustomeText(
                                              text: "€" +
                                                  snapshot
                                                      .data!
                                                      .data
                                                      .events[index]
                                                      .eventPriceTo
                                                      .toString() +
                                                  " - " +
                                                  "€" +
                                                  snapshot
                                                      .data!
                                                      .data
                                                      .events[index]
                                                      .eventPriceFrom
                                                      .toString(),
                                              color: AppColors.gray3,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                            ),

                                            SizedBox(
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      0.5,
                                            ),
                                            Container(
                                              width: cardWidth,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Wrap(
                                                    direction: Axis.horizontal,
                                                    children: [
                                                      for (int i = 0;
                                                          i <
                                                              snapshot
                                                                  .data!
                                                                  .data
                                                                  .events[index]
                                                                  .keywords
                                                                  .length;
                                                          i++) ...[
                                                        Container(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: SizeConfig
                                                                      .widthMultiplier *
                                                                  3,
                                                              vertical: SizeConfig
                                                                      .heightMultiplier *
                                                                  1),
                                                          //   = height: SizeConfig.heightMultiplier * 7.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColors
                                                                .chipsBackgroundColor,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    SizeConfig
                                                                            .heightMultiplier *
                                                                        3),
                                                          ),
                                                          child: Center(
                                                            child: CustomeText(
                                                              text: snapshot
                                                                  .data!
                                                                  .data
                                                                  .events[index]
                                                                  .keywords[i],
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig
                                                              .widthMultiplier,
                                                        )
                                                      ]
                                                    ],
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          AssetsResources()
                                                              .shareIcon,
                                                          height: SizeConfig
                                                                  .heightMultiplier *
                                                              3,
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig
                                                                  .widthMultiplier *
                                                              2,
                                                        ),
                                                        snapshot
                                                                    .data!
                                                                    .data
                                                                    .events[
                                                                        index]
                                                                    .isFavorite ==
                                                                0
                                                            ? Image.asset(
                                                                AssetsResources()
                                                                    .heartOutlineIcon,
                                                                height: SizeConfig
                                                                        .heightMultiplier *
                                                                    3,
                                                              )
                                                            : Image.asset(
                                                                AssetsResources()
                                                                    .fillheartIcon,
                                                                height: SizeConfig
                                                                        .heightMultiplier *
                                                                    3,
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
