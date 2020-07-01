import 'package:flutter/material.dart';
import 'package:flutterworkshops/screens/weather_page.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class ChooseLocationPage extends StatefulWidget {
  ChooseLocationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  List<String> _locations;

  @override
  void initState() {
    super.initState();

    _locations = [
      "Hellsinki Wielkie",
      "Hellsinki Małe",
      "Hellsinki Dolne",
      "Hellsinki Górne"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                setState(() {
                  _locations = WeatherService.get().getLocation(text);
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _locations.length,
                  itemBuilder: (context, index) {
                    var item = _locations[index];
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WeatherPage(item)));
                      },
                    );
                  }),
            )
          ],
        ));
  }
}
