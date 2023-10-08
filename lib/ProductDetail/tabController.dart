import 'package:flutter/material.dart';

class tabController extends StatefulWidget {
  const tabController({super.key});

  @override
  State<tabController> createState() => _tabControllerState();
}

class _tabControllerState extends State<tabController>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Description',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Specification',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Review',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                    insets: EdgeInsets.symmetric(horizontal: 16.0))),
          ),
          Expanded(
            child: Container(
                width: double.maxFinite,
                // height: MediaQuery.of(context).size.height*0.4,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam id aliquam aliquet, nisl nunc aliquam nunc, vitae aliquam nunc nunc sed nisl. Sed euismod, diam id aliquam aliquet, nisl nunc '),
                        ),
                      ),
                    ),
                    Container(
                      child: Text('Specification'),
                    ),
                    Container(
                      child: Text('Review'),
                    ),
                  ],
                  controller: _tabController,
                )),
          )
        ],
      ),
    );
  }
}
