import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';

class SaveButtonProfile extends StatefulWidget {

  final Color color;
  final bool isSaved;
  final String symbol;

  SaveButtonProfile({
    this.color,
    this.isSaved,
    this.symbol
  });

  @override
  _SaveButtonProfileState createState() => _SaveButtonProfileState();
}

class _SaveButtonProfileState extends State<SaveButtonProfile> {

  bool isSaved;
  Color color;
  
  @override
  void initState() {
    this.isSaved = this.widget.isSaved;
    this.color = this.isSaved 
      ? this.widget.color
      : Colors.grey;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void changeState({bool isSaved, Color color}) {
    setState(() {
      this.isSaved = isSaved;
      this.color = color;
    });
  }

  void onPressedHandler() {

    if (this.isSaved) {
      changeState(isSaved: false, color: Colors.grey);

      print(this.widget.symbol);

      BlocProvider
      .of<PortfolioBloc>(context)
      .add(DeleteProfile(symbol: this.widget.symbol));
      
    } else {
      changeState(isSaved: true, color: this.widget.color);
    
      BlocProvider
      .of<PortfolioBloc>(context)
      .add(SaveProfile(symbol: this.widget.symbol));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(FontAwesomeIcons.solidCheckCircle, color: this.color), 

        onPressed: () => onPressedHandler()
      ),
    );
  }
}