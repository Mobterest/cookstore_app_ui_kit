import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/styles.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import 'recipes.dart';

class RecipeDetails extends StatefulWidget {
  final Map<String, dynamic> recipe;
  final List cart;
  final int index;

  RecipeDetails(this.recipe, this.cart, this.index);
  State<StatefulWidget> createState() => RecipeDetailsState();
}

class RecipeDetailsState extends State<RecipeDetails> {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: BLUE_PALETTE),
          backgroundColor: WHITE_PALETTE,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.star_border,
                  color: BLUE_PALETTE,
                ),
                onPressed: null)
          ],
          bottomOpacity: 0.0,
          elevation: 0.0),
      backgroundColor: WHITE_PALETTE,
      body: SingleChildScrollView(
          child: Container(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: DIM_RECIPE_DETAILS_PADDING_1,
              child: ClipRRect(
                  child: Container(
                    child: Image.asset(widget.recipe['image'],
                        width: MediaQuery.of(context).size.width),
                  ),
                  borderRadius: rdetailsImage)),
          Padding(
              padding: DIM_RECIPE_DETAILS_PADDING_2,
              child: Text(widget.recipe['title'],
                  style: STYLE_RECIPE_DETAILS_TITLE)),
          Padding(
              padding: DIM_RECIPE_DETAILS_PADDING_3,
              child: Text(widget.recipe['by'], style: STYLE_RECIPE_DETAILS_BY)),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: GRAY_PALETTE,
                  ),
                  Text(
                    widget.recipe['duration'],
                    style: STYLE_RECIPE_DETAILS_DURATION,
                  )
                ]),
                Column(children: <Widget>[
                  Icon(
                    Icons.room_service,
                    color: GRAY_PALETTE,
                  ),
                  Text(widget.recipe['calories'],
                      style: STYLE_RECIPE_DETAILS_CALORIES)
                ]),
                Container(
                    width: RECIPE_DETAILS_BTN_CONTAINER_SIZE,
                    height: RECIPE_DETAILS_BTN_CONTAINER_SIZE,
                    child: RaisedButton(
                      color: DBLUE_PALETTE,
                      onPressed: () {},
                      child: Column(children: <Widget>[
                        Padding(
                            padding: DIM_RECIPES_DETAILS_PADDING_4,
                            child: Icon(Icons.fastfood, color: WHITE_PALETTE)),
                        Text(
                            widget.recipe['ingredients'].length.toString() +
                                '/' +
                                widget.recipe['ingredients'].length.toString(),
                            style: TextStyle(
                                color: WHITE_PALETTE,
                                fontWeight: FontWeight.w700))
                      ]),
                    ))
              ]),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(INGR, style: TextStyle(color: GRAY_PALETTE_1))),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildList()),
          Align(
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Recipes(widget.cart)));
                  },
                  color: DBLUE_PALETTE,
                  child: Text(
                    BTN_SHOP_SEL,
                    style: TextStyle(color: WHITE_PALETTE),
                  ),
                  shape: StadiumBorder()))
        ],
      ))),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _ingredients = [];
    for (var i = 0; i < widget.recipe['ingredients'].length; i++) {
      String ingr = widget.recipe['ingredients'][i]['ingr'];
      _ingredients.add(CheckboxListTile(
          title: Text(ingr, style: STYLE_ING),
          value: widget.cart.contains( widget.recipe['ingredients'][i]),
          onChanged: (bool newValue) {
            setState(() {
              if (newValue) {
                widget.cart.add( widget.recipe['ingredients'][i]);
              } else {
                widget.cart.remove( widget.recipe['ingredients'][i]);
              }
            });
          },
          activeColor: DBLUE_PALETTE,
          controlAffinity: ListTileControlAffinity.leading));
    }
    return _ingredients;
  }
}
