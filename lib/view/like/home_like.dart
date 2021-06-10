import 'package:flutter/material.dart';

class HomeLike extends StatefulWidget {

  @override
  _HomeLikeState createState() => _HomeLikeState();
}

class _HomeLikeState extends State<HomeLike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            bottom: PreferredSize(
              child: Container(),
              preferredSize: Size(0, 20),
            ),
            pinned: true,
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            forceElevated: true,
            flexibleSpace: Stack(
              children: [
                
                Positioned(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      ),
                    ),
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Text("Search",
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontSize: 56.0,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index + 1 % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}