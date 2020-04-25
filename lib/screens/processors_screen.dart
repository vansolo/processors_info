import 'package:flutter/material.dart';
import 'package:processors_info/models/processor_model.dart';
import 'package:processors_info/repository/processor_repository.dart';

class ProcessorsScreen extends StatefulWidget {
  @override
  _ProcessorsScreenState createState() => _ProcessorsScreenState();
}

class _ProcessorsScreenState extends State<ProcessorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Processadores"),
      ),
      body: FutureBuilder<List<ProcessorModel>>(
        future: ProcessorRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<ProcessorModel> processors) {
    return ListView.builder(
      itemCount: processors == null ? 0 : processors.length,
      itemBuilder: (BuildContext ctx, int index) {
        return processorCard(processors[index]);
      },
    );
  }

  Card processorCard(ProcessorModel processor) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 69, 0, .9),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.widgets,
              color: Colors.white,
            ),
          ),
          title: Text(
            processor.model,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    processor.brand,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/processors_details",
              arguments: processor,
            );
          },
        ),
      ),
    );
  }
}
