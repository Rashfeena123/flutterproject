import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:newproject/models.dart';
import 'package:newproject/screens/offerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double rating = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Text(
          "Hi, Muhammed Faisal !",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        )),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
                },
                icon: Stack(
                  children: const [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    Positioned(
                        left: 9.0,
                        child: Icon(
                          Icons.brightness_1,
                          color: Colors.yellow,
                          size: 9.0,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Color(0xffF9F9F9),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 170,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 2.0,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.asset(item,
                                    fit: BoxFit.cover, width: 1000.0),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 6.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.grey)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OfferPage()));
                  },
                  child: Row(
                    children: [
                      Text(
                        "See All ",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height /20,
            child: Text(
              "Recommend Point Offers",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
            // color: Colors.green,
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 15),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(cards[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.11,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.10,
                                      // width: 50.0,
                                      // height: 45.0,
                                      child: Image.asset(
                                        logo[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      luluname[index],
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 7),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              23,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 11.0, vertical: 7.0),
                                      decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                              BorderRadius.circular(9)),
                                      child: Center(
                                        child: const Text('Member Only',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height /20,
            // margin: EdgeInsets.fromLTRB(0, 5, 90, 15),
            child: Text(
              "Recommend Dining Offers",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: food.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      child: Stack(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 15),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(food[index]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 110,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height / 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enjoy Your Dining",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 90,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Color(0xff3F3B6C),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(13),
                                    bottomLeft: Radius.circular(13))),
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height / 25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30% Points Offer",
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          child:   Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  height: MediaQuery.of(context).size.width /10,
                                  child: Image.asset(
                                    "assets/images/logo.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 1.0,
                                ),
                                Text(
                                  luluname[index],
                                  style: TextStyle(
                                      fontSize: 6,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.19,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    itemSize: 11,
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, right: 3,left: 4,bottom: 6),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        height: MediaQuery.of(context).size.height/40,
                                        decoration: BoxDecoration(
                                            color: Colors.orangeAccent,
                                            borderRadius:
                                            BorderRadius.circular(9)),
                                        child: Center(
                                          child: const Text('Member Only',
                                              style: TextStyle(
                                                fontSize: 7,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),)
                      ]),
                    );
                  })),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height /20,
            // margin: EdgeInsets.fromLTRB(0, 5, 10, 10),
            child: Text(
              "Earn and Redeem Online & Instore",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
            // color: Colors.green,
            height: MediaQuery.of(context).size.height * 0.23,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: booking.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(9, 0, 0, 15),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(booking[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin:EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      width: MediaQuery.of(context).size.width *
                                          0.10,
                                      height:
                                      MediaQuery.of(context).size.width *
                                          0.10,
                                      child: Image.asset(
                                        "assets/images/logo.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.0,
                                    ),
                                    Text(
                                      book[index],
                                      style: TextStyle(
                                          fontSize: 5.5,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 10, right: 7),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.14,
                                      height:
                                      MediaQuery.of(context).size.height /
                                          40,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 11.0, vertical: 7.0),
                                      decoration: BoxDecoration(
                                          color: Colors.orangeAccent,
                                          borderRadius:
                                          BorderRadius.circular(9)),
                                      child: Center(
                                        child: const Text('Book Now',
                                            style: TextStyle(
                                              fontSize: 5,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
