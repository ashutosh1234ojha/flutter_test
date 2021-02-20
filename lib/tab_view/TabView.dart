import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/tab_view/Watchlist.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  var watchList = [
    Watchlist(
        companyName: 'HDFC',
        marketName: 'NSE',
        currentRate: '99.75',
        changedRate: '+11.30(+1.15%)'),
    Watchlist(
        companyName: 'ICICI',
        marketName: 'BSE',
        currentRate: '199.75',
        changedRate: '+10.30(+2.15%)'),
    Watchlist(
        companyName: 'SBI',
        marketName: 'NSE',
        currentRate: '909.75',
        changedRate: '+12.30(+1.25%)'),
    Watchlist(
        companyName: 'SBI',
        marketName: 'NSE',
        currentRate: '909.75',
        changedRate: '+12.30(+1.25%)'),
    Watchlist(
        companyName: 'BAJAJ',
        marketName: 'BSE',
        currentRate: '109.75',
        changedRate: '+12.30(+1.25%)'),
    Watchlist(
        companyName: 'TATA',
        marketName: 'NSE',
        currentRate: '9.75',
        changedRate: '+2.30(+1.25%)'),
    Watchlist(
        companyName: 'APPLE',
        marketName: 'NSE',
        currentRate: '9.75',
        changedRate: '+2.30(+1.25%)'),
    Watchlist(
        companyName: 'ANDROID',
        marketName: 'NSE',
        currentRate: '9.75',
        changedRate: '+2.30(+1.25%)')
  ];

  @override
  Widget build(BuildContext context) {
    var addressController = TextEditingController();
    bool isValid = true;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(47, 79, 79, 1),
          title: Text('TabView'),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'Watchlist 1',
              ),
              Tab(
                text: 'Watchlist 2',
              ),
              Tab(
                text: 'Watchlist 3',
              ),
              Tab(
                text: 'Watchlist 4',
              ),
              Tab(
                text: 'Watchlist 5',
              ),
              Tab(
                text: 'Watchlist 6',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Color.fromRGBO(47, 79, 79, 1),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  MyInputFormField(
                      hint: 'Search & add                    50/50',
                      label: 'Address',
                      controller: addressController,
                      isValid: isValid),
                  SizedBox(height: 10,),

                  Expanded(
                    child: ListView.separated(
                      itemCount: watchList.length,
                      itemBuilder: (context, position) {
                        return listItem(watchList[position]);
                      },
                      separatorBuilder: (context, position) {
                        return separator();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
              child: Column(
                children: [
                  Text('hello'),
                  Text('hello'),
                  Expanded(child: ListView())
                ],
              ),
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(Watchlist watchList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              watchList.companyName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              watchList.currentRate,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              watchList.marketName,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            Text(
              watchList.changedRate,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            )
          ],
        ),
      ])),
    );
  }

  Widget separator() {
    return Divider(
      color: Colors.grey,
      height: 45,
      thickness: 2,
    );
  }
}

class MyInputFormField extends StatefulWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final bool isValid;

  const MyInputFormField(
      {Key key, this.hint, this.label, this.controller, this.isValid})
      : super(key: key);

  @override
  _MyInputFormFieldState createState() => _MyInputFormFieldState();
}

class _MyInputFormFieldState extends State<MyInputFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Form(
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                  errorText: widget.isValid ? null : 'enter valid address',
                  hintText: widget.hint,
                  hintStyle: TextStyle(color: Color.fromRGBO(208,208,208, 1)),
                  border: InputBorder.none,
                  // border: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.red, width: 1.0),
                  // ),
                  fillColor: Color.fromRGBO(95,158,160, 1),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(208,208,208, 1),
                    size: 30,
                  ),
                  suffixIcon: Icon(
                    Icons.settings_input_composite,
                    color:  Color.fromRGBO(208,208,208, 1),
                    size: 30,

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(95,158,160, 1), width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(95,158,160, 1), width: 1.0),
                  )),
              style: TextStyle(color: Color.fromRGBO(208,208,208,1),fontWeight: FontWeight.bold,fontSize: 20),
              keyboardType: TextInputType.name,
              maxLines: 1,
              validator: (String value) {
                return value.length > 3 ? 'Do not use the @ char.' : null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
