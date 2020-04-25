import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:processors_info/models/processor_model.dart';
// import 'package:processors_info/assets/processor.jpg';

class ProcessorsDetailScreen extends StatelessWidget {
  ProcessorModel processorModel;

  @override
  Widget build(BuildContext context) {
    processorModel = ModalRoute.of(context).settings.arguments;

    final topBarContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 80.0),
        Text(
          processorModel.model,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 22.7),
      ],
    );

    final topBar = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new NetworkImage(
                      "https://media.giphy.com/media/970Sr8vpwEbXG/giphy.gif"),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          child: topBarContent,
        ),
        Positioned(
          left: 25.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
            ),
          ),
        )
      ],
    );

    final detailsText = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 40.0),
      child: Row(
        children: <Widget>[
          Text(
            "Marca: ${processorModel.brand} \n\n +Threads: ${processorModel.threads} \n\nNúcleos: ${processorModel.core} \n\nVelocidade: ${processorModel.operationFrequency}",
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ],
      ),
    );

    final extraDetailsText = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              processorModel.extraDetails,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topBar,
          detailsText,
          extraDetailsText,
        ],
      ),
    );
  }
}
