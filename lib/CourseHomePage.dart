import 'package:flutter/material.dart';
import 'package:ui_challange_3/models/Category.dart';

enum CategoryType { ui, coding, basicui, python, cpp }

class CourseHomePage extends StatefulWidget {
  @override
  _CourseHomePageState createState() => _CourseHomePageState();
}

class _CourseHomePageState extends State<CourseHomePage> {
  CategoryType categoryType = CategoryType.ui;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: "Choose Your\n",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: "Design Course",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage("assets/img.jpeg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 30.0,
                ),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue[50].withOpacity(1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search for course",
                                border: InputBorder.none,
                                // labelText: "Search for course",
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          size: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ),
                child: Text(
                  "Category",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                // width: 700,
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    getType("Ui/Ux", CategoryType.ui,
                        categoryType == CategoryType.ui),
                    getType("Coding", CategoryType.coding,
                        categoryType == CategoryType.coding),
                    getType("Basic UI", CategoryType.basicui,
                        categoryType == CategoryType.basicui),
                    getType("Python", CategoryType.python,
                        categoryType == CategoryType.python),
                    getType("CPP", CategoryType.cpp,
                        categoryType == CategoryType.cpp),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30.0),
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Category.categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category obj = Category.categoryList[index];
                    return GetDetailedCard(
                      title: obj.title,
                      imagePath: obj.imagePath,
                      lessonCount: obj.lessonCount,
                      money: obj.money,
                      rating: obj.rating,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: Text(
                  "Popular Course",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.80,
                children: List.generate(
                  Category.categoryList.length,
                  (index) {
                    Category obj = Category.categoryList[index];
                    return PopularCard(obj: obj);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  getType(String s, CategoryType type, bool b) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categoryType = type;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 100.0,
        margin: EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: b ? Colors.blue : Colors.blue[50].withOpacity(0.5),
            border: Border.all(color: Colors.blue, width: 3.0)),
        child: Text(
          s,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key key,
    @required this.obj,
  }) : super(key: key);

  final Category obj;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            decoration: BoxDecoration(
              color: Colors.blue[50].withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    obj.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${obj.lessonCount} lessons"),
                        Row(
                          children: <Widget>[
                            Text(obj.rating.toString()),
                            Icon(
                              Icons.star,
                              color: Colors.blue,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 140.0,
              height: 110.0,
              decoration: BoxDecoration(
                  color: Colors.blue[50].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage("assets/img.jpeg"),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class GetDetailedCard extends StatelessWidget {
  final String title;
  final int lessonCount;
  final int money;
  final double rating;
  final String imagePath;

  const GetDetailedCard({
    Key key,
    this.title,
    this.lessonCount,
    this.money,
    this.rating,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        width: 250.0,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue[50].withOpacity(0.5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 70,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${lessonCount} lesson",
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  // width: 50.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${rating}",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "\$${money}",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 17,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.cyan,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
