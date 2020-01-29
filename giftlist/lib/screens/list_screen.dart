import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:giftlist/bloc/favorite_bloc.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../api/post_model.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(253, 146, 30, 1),
      appBar: GradientAppBar(
        backgroundColorStart: Color.fromRGBO(231, 40, 74, 1),
        backgroundColorEnd: Color.fromRGBO(253, 146, 30, 1),
        centerTitle: true,
        leading: Container(),        
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Container(
          child: Text(
            "Meus Animes ^^", 
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: StreamBuilder<Map<String,Results>>(
        stream: bloc.outFav,
        builder: (context,snapshot){
          if (snapshot.data == null) {
            return Container();
          }

          return ListView(    
            padding: EdgeInsets.all(1),        
            children: snapshot.data.values.map((a){
              return Container(
                padding: EdgeInsets.fromLTRB(3,0, 0,0),
                margin: EdgeInsets.fromLTRB(3,0, 0 ,0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(                                        
                      children: [
                        Container(
                          child: Image.network(a.imageUrl),
                          margin: EdgeInsets.fromLTRB(0,10,0,10),                      
                        ),
                        SizedBox(height: 0,),
                        Text(a.title,style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(height: 0,),
                        Text(a.type,style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),),
                      ],
                    ),                   
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
