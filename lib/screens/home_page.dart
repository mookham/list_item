import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  int currentindex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('List Item'),
          ),
        ),
        body: Column(
          children: [
            TabBar(
                onTap: (v) {
                  currentindex = v;
                  setState(() {});
                },
                indicator: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    color: Colors.red),
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Tab 1',
                  ),
                  Tab(
                    text: 'Tab 2',
                  ),
                  Tab(
                    text: 'Tab 3',
                  ),
                ]),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Container(
                  decoration:
                      BoxDecoration(color: Colors.red, border: Border.all()),
                  child: const Center(child: Text("TabBarView")),
                )),
                ListView.builder(
                  itemCount: currentindex + 1,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.black, width: 3)),
                      height: 120,
                      child: const Center(
                          child: Text(
                        "List item",
                        style: TextStyle(fontSize: 20),
                      )),
                    );
                  },
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
