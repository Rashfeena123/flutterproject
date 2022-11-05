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
                  children: [
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
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Text(
              "Recommend Point Offers",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
            ),
          ),
          Container(
            height: 170,
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 5,left: 5),
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                              ),
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                child: Image.asset(
                                  cards[index],
                                  fit: BoxFit.cover,
                                  width: 280,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                height: 40,
                                width: 280,
                                child: Row(
                                  children: [
                                    Image.asset(
                                     logo[index],
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      luluname[index],
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 90),
                                      child: InkWell(
                                        //                                   onTap: () {},
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.orangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 15,
                                          width: 55,
                                          child: Center(
                                            child: const Text('Member Only',
                                                style: TextStyle(
                                                  fontSize: 8,
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
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Text(
              "Recommend Dining Offers",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: food.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 5,right: 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                            height: 160.0,
                           // color: Colors.yellow,
                            width: 180,
                            child: Stack(
                                children: [
                              Container(
                                height: 140,
                                width: 180,
                                child: Container(
                                  height: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      food[index],
                                      fit: BoxFit.cover,
                                      width: 240,
                                    ),
                                  ),
                                ),
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 130,),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 12),
                                      height: 55,
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/logo.jpeg",
                                            width: 20,
                                            height: 20,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            luluname[index],
                                            style: TextStyle(
                                                fontSize: 6,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            // color: Colors.red,
                                            width: 80,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 13,
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
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 10),
                                                  child: InkWell(
                                                    //                                   onTap: () {},
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.orangeAccent,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                      height: 15,
                                                      width: 55,
                                                      child: Center(
                                                        child:
                                                        const Text('Member Only',
                                                            style: TextStyle(
                                                              fontSize: 8,
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
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                bottom: 100,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),

                                  height: 30,
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Enjoy Your Dining",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 75,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                 decoration: BoxDecoration(

                                   color: Color(0xff3F3B6C),
                                   borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13) )
                                   
                                 ),
                                  height: 30,
                                  width: 90,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("30% Points Offer",
                                        style: TextStyle(
                                         fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),),
                                    ],
                                  ),
                                ),
                              ),



                            ])),
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.only(right: 50,top: 15),
            child: Text(
              "Earn and Redeem Online & Instore",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:booking.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 9,right: 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                            height: 150.0,
                            // color: Colors.yellow,
                            width: 120,
                            child: Stack(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 120,
                                    child: Container(
                                      height: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: Image.asset(
                                          booking[index],
                                          fit: BoxFit.cover,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80,),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      height: 55,
                                      width: 200,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/logo.jpeg",
                                            width: 20,
                                            height: 20,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            book[index],
                                            style: TextStyle(
                                                fontSize: 6,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: InkWell(
                                              //                                   onTap: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.orangeAccent,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5)),
                                                height: 13,
                                                width: 30,
                                                child: Center(
                                                  child:
                                                  const Text('Book Now',
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
                                    ),
                                  ),




                                ])),
                      ),
                    );
                  })),

        ]),
      ),
    );
  }
}
