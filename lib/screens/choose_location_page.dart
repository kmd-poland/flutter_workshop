import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterworkshops/blocs/choose_location_bloc.dart';
import 'package:flutterworkshops/screens/weather_page.dart';
import 'package:flutterworkshops/services/weather_service.dart';

class ChooseLocationPage extends StatefulWidget {
  ChooseLocationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  ChooseLocationBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = ChooseLocationBloc();
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
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Enter location",
                contentPadding: EdgeInsets.all(10)
              ),
              onChanged: (text) {
                _bloc.add(LocationSearchEvent(text));
              },
            ),
            BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is ChooseLocationListLoadedState) {
                  return _buildResultList(state);
                } else if (state is ChooseLocationErrorState){
                  return _buildError();
                }
                  return Container();
              },
            ),
          ],
        ));
  }

  Widget _buildError(){
    return Expanded(
      child: Center(child: Text("We couldn't fetch your desired location. Please check your network connection ")),
    );
  }
  Widget _buildResultList(ChooseLocationListLoadedState state) {
     return Expanded(
      child: ListView.builder(
          itemCount: state.locations.length,
          itemBuilder: (context, index) {
            var item = state.locations[index];
            return ListTile(
              title: Text(item.title),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WeatherPage(item)));
              },
            );
          }),
    );
  }
}
