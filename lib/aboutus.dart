import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> about = [
      'Why us? ',
      'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet abc  '
    ];
    List<String> contact = [
      'Find us at',
      'Opening Hours',
      'Call us at',
      'Email us at'
    ];
    List<String> contactdetails = [
      'Kathmandu, Nepal',
      '10:00 AM - 8:00 PM',
      '01-1234567',
      'email@gmail.com'
    ];
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          title: Center(child: Image.asset('assets/images/logof.png')),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: const Offset(2, 3),
                    ) // changes position of shadow
                  ]),
              child: Column(
                children: [
                  Container(
                    // height: 300,
          
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < about.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(about[i]),
                            ),
                        ]),
                  ),
                  Container()
                ],
              ),
            ),
          );
        }, childCount: 1)),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                       width: MediaQuery.of(context).size.width ,
                    // height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(2, 3),
                          ) // changes position of shadow
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width ,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            for(int i=0; i<contact.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(contact[i]),
                            ),
                            ]),
                      ),
                    ),
                  ),
                ),
                Container()
              ],
            ),
          );
        }, childCount: 1))
      ],
    ));
  }
}
