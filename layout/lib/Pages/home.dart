import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/Pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class homePages extends StatefulWidget {
  //const homePages({ Key? key }) : super(key: key);

  @override
  _homePagesState createState() => _homePagesState();
}

class _homePagesState extends State<homePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แอพการใช้งาน Flutter'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //var data = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(20),
                      child: myBox(
                          snapshot.data[index]['title'],
                          snapshot.data[index]['subtitle'],
                          snapshot.data[index]['imgurl'],
                          snapshot.data[index]['detaildata']));
                },
                itemCount: snapshot.data.length,
              );
            },
            //future:DefaultAssetBundle.of(context).loadString('assets/data.json'),
            future: getdata(),
          )),
    );
  }

  Widget myBox(
    String titlemybox,
    String desmybox,
    String urlimg,
    String detailbox,
  ) {
    var v1, v2, v3, v4;
    v1 = titlemybox;
    v2 = desmybox;
    v3 = urlimg;
    v4 = detailbox;
    return Container(
      padding: EdgeInsets.all(20),
      //color: Colors.green[300],
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
              image: NetworkImage(urlimg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white54.withOpacity(0.1), BlendMode.darken))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titlemybox,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            desmybox,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailPages(v1, v2, v3, v4)));
              },
              child: Text('อ่านต่อ...'))
        ],
      ),
    );
  }

  Future getdata() async {
    //https://raw.githubusercontent.com/phoom22443/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/phoom22443/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
