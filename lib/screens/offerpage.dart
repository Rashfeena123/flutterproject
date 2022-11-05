import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/models.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined,
              size: 15, color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationView()));
              },
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 20,),
                Positioned(
                    left: 9.0,
                    child: Icon(Icons.brightness_1,
                      color: Colors.yellow,
                      size: 9.0,))
              ],

            ),),
        ],
        backgroundColor: Color(0xffF9F9F9),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10, top: 5),
                color: Colors.white,
                padding: EdgeInsets.only(top: 10.0, bottom: 10),
                height: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: offerimage.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: 150,
                            color: Color(0xfff4f4f4),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    offerimage[index],
                                    fit: BoxFit.cover,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
