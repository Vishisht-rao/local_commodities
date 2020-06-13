import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(3, 120,3, 0),
        child: new TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: 'Search',
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              filled: true,
              prefixIcon: new Icon(
                Icons.search,
                color: Colors.green,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              fillColor: Colors.white
          ),
        ),
      );
    }
  }


