import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Your Ride"),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5), // hide shadow top
                      blurRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.white, // replace with color of container
                      offset: Offset(-5, 0), // hide shadow right
                    ),
                    BoxShadow(
                      color: Colors.white, // replace with color of container
                      offset: Offset(5, 0), // hide shadow left
                    ),
                  ]),
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Your ride is"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$5.58",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("March 21, 2020 at 10:30 a.m."),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const RateContent(),
          ],
        ),
      ),
    );
  }
}

class RateContent extends StatefulWidget {
  const RateContent({super.key});

  @override
  State<RateContent> createState() => _RateContentState();
}

class _RateContentState extends State<RateContent> {
  double? rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), shape: BoxShape.circle),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/driver.jpeg'),
            ),
          ),
        ),
        const Text(
          "Michael Douglas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Rate your driver"),
        const SizedBox(
          height: 5,
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.green,
          ),
          onRatingUpdate: (value) {
            setState(() {
              rating = value;
            });
          },
        ),
        const SizedBox(
          height: 55,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Your message...",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                )),
            minLines: 4,
            maxLines: 5,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: SizedBox(
            width: double
                .infinity,
                height: 55, 
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text("Done", style: TextStyle(
                fontSize: 20,
              ),),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
