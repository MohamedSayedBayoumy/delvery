import 'package:flutter/material.dart';
import 'package:mts/core/widgets/custom_padding.dart';
import 'package:mts/core/widgets/custom_text_filed.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Color currentColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          centerTitle: true,
        ),
        body: CustomPadding(
          child: Column(
            children: [
              TabBar(
                indicatorColor: currentColor,
                labelStyle: TextStyle(color: currentColor),
                indicatorWeight: 8.0,
                unselectedLabelColor: Colors.black,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 40.0),
                onTap: (i) {
                  if (i == 1) {
                    currentColor = Colors.red;
                  } else {
                    currentColor = Colors.green;
                  }
                  setState(() {});
                },
                tabs: const [
                  Tab(
                    text: "Completed",
                  ),
                  Tab(
                    text: "Cancel Delivery",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: CustomTextField(
                  hinText: "Search Order ID",
                  labelText: "Search Order ID",
                  controller: TextEditingController(),
                  suffixWidget: const Icon(Icons.search, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
