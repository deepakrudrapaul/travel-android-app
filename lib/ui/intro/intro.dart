import 'package:flutter/material.dart';
import 'package:wanderwagon/ui/intro/dots_indicator.dart';
import 'package:wanderwagon/ui/intro/intro_page_item.dart';
import 'package:wanderwagon/ui/intro/page_transformer.dart';

class IntroPage extends StatefulWidget {
  @override
  IntroPageState createState() => new IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: PageTransformer(
              pageViewBuilder: (context, visibilityResolver) {
                return PageView.builder(
                  controller: _pageController,
                  itemCount: sampleItems.length,
                  itemBuilder: (context, index) {
                    final item = sampleItems[index];
                    final pageVisibility =
                        visibilityResolver.resolvePageVisibility(index);

                    return IntroPageItem(
                      item: item,
                      pageVisibility: pageVisibility,
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
              bottom: 10.0,
              left: 0.0,
              right: 0.0,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DotsIndicator(
                        pageController: _pageController,
                        itemCount: sampleItems.length,
                        onPageSelected: (int page) {
                          _pageController.animateToPage(
                            page,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.orange[600],
                                  Colors.orange[900],
                                ],
                                begin: Alignment(0.5, -1.0),
                                end: Alignment(0.5, 1.0)
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Material(
                            child: MaterialButton(
                              child: Text('I\'M NEW',
                                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                              ),
                              onPressed: (){},
                              highlightColor: Colors.orange.withOpacity(0.5),
                              splashColor: Colors.orange.withOpacity(0.5),
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),

                        Container(
                          width: 150.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Colors.white, width: 1.0),
                            color: Colors.transparent,
                          ),
                          child: Material(
                            child: MaterialButton(
                              child: Text('LOG IN',
                                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, '/login');
                              },
                              highlightColor: Colors.white30,
                              splashColor: Colors.white30,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),


        ],
      ),
    );
  }
}

final sampleItems = <IntroItem>[
   IntroItem(
    title: 'Travelling together is what we do best!',
    category: 'COLLABORATION',
    imageUrl: 'assets/pic1.jpg',
  ),
   IntroItem(
    title: 'Occasionally wearing pants is a good idea.',
    category: 'CULTURE',
    imageUrl: 'assets/pic2.jpg',
  ),
   IntroItem(
    title: 'We might have the best team spirit ever.',
    category: 'SPIRIT',
    imageUrl: 'assets/pic3.jpg',
  ),
];
