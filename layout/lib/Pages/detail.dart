import 'package:flutter/material.dart';

class detailPages extends StatefulWidget {
  final v1, v2, v3, v4;
  detailPages(this.v1, this.v2, this.v3, this.v4);

  @override
  _detailPagesState createState() => _detailPagesState();
}

class _detailPagesState extends State<detailPages> {
  var _v1, _v2, _v3, _v4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [Text(_v1), Text(_v2), Image.network(_v3), Text(_v4)],
        ),
      ),
    );
  }
}
