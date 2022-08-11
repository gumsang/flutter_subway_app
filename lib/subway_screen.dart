import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'subway_api.dart';
import 'subway_model.dart';
import 'subway_view_model.dart';

class SubwayScreen extends StatefulWidget {
  const SubwayScreen({Key? key}) : super(key: key);

  @override
  State<SubwayScreen> createState() => _SubwayScreenState();
}

class _SubwayScreenState extends State<SubwayScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SubwayScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('지하철 정보'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onTap: () {
              viewModel.fetchArrivalLists(_controller.text);
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  viewModel.fetchArrivalLists(_controller.text);
                  _controller.clear();
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: viewModel.arrivalList.map((Subway arrivalList) {
                return Column(
                  children: [
                    Text(arrivalList.trainLineNm),
                    const Divider(),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
