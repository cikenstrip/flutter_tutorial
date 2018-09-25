import 'package:flutter/material.dart';

class PageBottomnavbar extends StatefulWidget {
  @override
  _PageBottomnavbarState createState() => new _PageBottomnavbarState();
}

class _PageBottomnavbarState extends State<PageBottomnavbar> {
  // Inisiasi controller & type data untuk variabel
  // variabel yg mengatur pageview mana yg sekarang tampil
  PageController _pageController;
  int _page = 0;

  void bottomnavbarDipijit(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void onPageChanged(int page) {
    setState(() {
      // Ubah nilai index page yg sedang tampil
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Bottom Nav Bar"),
      ),
      body: new PageView(
        children: <Widget>[
          new Center(child: new Text("Halaman satu.")),
          new Center(child: new Text("Halaman dua.")),
          new Center(child: new Text("Halaman tiga.")),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home")
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text("Content A")
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.flight),
            title: new Text("Content B")
          ),
        ],
        onTap: bottomnavbarDipijit,
        currentIndex: _page,
      ),
    );
  }
}