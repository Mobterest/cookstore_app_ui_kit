import 'package:cookstore/globals/config.dart';
import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import '../globals/colors.dart';
import '../globals/config.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import 'recipeDetails.dart';
import 'cart.dart';

class Recipes extends StatefulWidget {
  final List cart;

  Recipes(this.cart);
  State<StatefulWidget> createState() => RecipesState();
}

class RecipesState extends State<Recipes> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _searchController = new TextEditingController();
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> result = [];
  int numberOfItems;
  bool favourite = false;
  bool like = false;

  @override
  void initState() {
    super.initState();
    data = RECIPES;
    numberOfItems = widget.cart.length;
  }

  Widget build(context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text(
            APP_TITLE,
            style: TextStyle(color: DBLUE_PALETTE, fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  (widget.cart.length > 0)
                      ? Icons.shopping_cart
                      : Icons.add_shopping_cart,
                  color:
                      (widget.cart.length > 0) ? BLUE_PALETTE : GRAY_PALETTE_1,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cart(widget.cart)));
                })
          ],
          centerTitle: true,
          backgroundColor: WHITE_PALETTE,
          bottomOpacity: 0.0,
          elevation: 0.0),
      body: Stack(children: <Widget>[
        Padding(
            padding: DIM_RECIPES_PADDING_1,
            child: Text(
              R_HEADER,
              style: STYLE_RECIPE_TITLE,
            )),
        Padding(
            padding: DIM_RECIPES_PADDING_2,
            child: FloatingSearchBar(
                controller: _searchController,
                trailing: IconButton(
                  icon: new Icon(Icons.clear, size: RECIPE_ICON_SIZE_1),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      data = RECIPES;
                    });
                  },
                ),
                pinned: true,
                onChanged: (String value) {
                  if (value == '') {
                    setState(() {
                      data = RECIPES;
                    });
                  } else {
                    result = [];
                    RECIPES.forEach((userDetail) {
                      if (userDetail['title']
                          .toUpperCase()
                          .contains(value.toUpperCase())) {
                        result.add(userDetail);
                      }
                    });
                    setState(() {
                      data = result;
                      _buildList();
                    });
                  }
                },
                onTap: () {},
                children: <Widget>[
                  Padding(
                      padding: DIM_RECIPES_PADDING_3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _buildList())
                          ]))
                ],
                decoration: InputDecoration.collapsed(
                    hintText: R_SUBHEADER, hintStyle: STYLE_RECIPE_SUBHEADER))),
      ]),
      backgroundColor: WHITE_PALETTE,
    );
  }

  List<Widget> _buildList() {
    List<Widget> _recipes = [];
    for (var i = 0; i < data.length; i++) {
      _recipes.add(Container(
          child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetails(data[i], widget.cart, i)));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: RECIPE_CONTAINER_HEIGHT,
                  child: Card(
                    color: DBLUE_PALETTE,
                    child: Row(children: <Widget>[
                      Image.asset(data[i]['image'],
                          width: MediaQuery.of(context).size.width *
                              RECIPE_IMAGE_WIDTH,
                          height: MediaQuery.of(context).size.height),
                      Padding(
                          padding: DIM_RECIPES_PADDING_4,
                          child: Column(children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: LIGHT_PALETTE,
                            ),
                            Text(
                              data[i]['duration'],
                              style: STYLE_RECIPE_DURATION,
                            ),
                            SizedBox(height: RECIPE_SIZEDBOX_HEIGHT),
                            Icon(
                              Icons.room_service,
                              color: LIGHT_PALETTE,
                            ),
                            Text(data[i]['calories'],
                                style: STYLE_RECIPE_CALORIES),
                            SizedBox(height: RECIPE_SIZEDBOX_HEIGHT),
                            Container(
                                width: RECIPE_BTN_CONTAINER_SIZE,
                                height: RECIPE_BTN_CONTAINER_SIZE,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Column(children: <Widget>[
                                    Padding(
                                        padding: DIM_RECIPES_PADDING_5,
                                        child: Icon(Icons.fastfood,
                                            color: DBLUE_PALETTE)),
                                    Text(
                                        data[i]['ingredients']
                                                .length
                                                .toString() +
                                            '/' +
                                            data[i]['ingredients']
                                                .length
                                                .toString(),
                                        style: TextStyle(
                                            color: DBLUE_PALETTE,
                                            fontWeight: FontWeight.w700))
                                  ]),
                                ))
                          ]))
                    ]),
                  ))),
          Row(children: <Widget>[
            Text(
              data[i]['title'],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            IconButton(
                icon: Icon((like) ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    like = !like;
                  });
                }),
            IconButton(
                icon: Icon((favourite) ? Icons.star : Icons.star_border),
                onPressed: () {
                  setState(() {
                    favourite = !favourite;
                  });
                })
          ])
        ],
      )));
    }
    return _recipes;
  }
}
