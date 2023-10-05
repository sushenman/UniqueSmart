import 'package:flutter/material.dart';

class myProducts extends StatelessWidget {
  const myProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
         height: MediaQuery.of(context).size.height * 1.4 ,
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1.6 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 67, 67, 67).withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 4))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Center(
                              child: Image.asset(
                            'assets/images/ups.png',
                            width: 100,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('UPS Router Backup 12v'),
                                Text(''),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                    Text('3/5'),
                                    Text(' 400')
                                  ],
                                ),
                                Text(''),
                                Text('Rs 4000',
                                    style: TextStyle(fontWeight: FontWeight.w500)),
                                Text(''),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('View Details'),
                                    Text(''),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 10,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          },
           physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
