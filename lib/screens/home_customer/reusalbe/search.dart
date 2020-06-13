import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final data=MediaQuery.of(context);
    return SafeArea(
          child: Padding(
          padding: EdgeInsets.fromLTRB(5,(data.size.height/15),0,0),
          child: new TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: new InputDecoration(
                hintText: 'Search',
                contentPadding: EdgeInsets.symmetric(vertical:0, horizontal:0),
                filled: true,
                prefixIcon: new Icon(
                  Icons.search,
                  color: Colors.brown[400],
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                fillColor: Colors.white
            ),
          ),
        ),
    );
  }
}