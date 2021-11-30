import 'package:final_app/controller/history.dart';
import 'package:final_app/model/history.dart';
import 'package:final_app/services/services.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  Services? services;
  HistoryController? controller;
  List<HistoryModel> history = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    services = FirebaseServices();
    controller = HistoryController(services!);
    controller!.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
    getHistory();
  }

  void getHistory() async {
    var newHistory = await controller!.fetchHistory();

    setState(() {
      history = newHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('History'),
            ),
            body: ListView.separated(
              itemCount: history.isEmpty ? 1 : history.length,
              itemBuilder: (BuildContext context, index) {
                HistoryModel newHistory = history[index];
                return ListTile(
                  title: Text(
                    newHistory.equation,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  subtitle: Text(
                    newHistory.result,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Color(0xFF263238),
                );
              },
            ),
          );
  }
}
