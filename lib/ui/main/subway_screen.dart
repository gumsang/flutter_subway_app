import 'package:flutter/material.dart';
import 'package:flutter_subway_api/debouncer.dart';
import 'package:provider/provider.dart';

import '../../data/model/subway_model.dart';
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
    final debouncer = Debouncer(milliseconds: 1000);

    return Scaffold(
      appBar: AppBar(
        title: const Text('지하철 정보'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              if (value.isNotEmpty) {
                debouncer
                    .run(() => viewModel.fetchArrivalLists(_controller.text));
              }
            },
            decoration: InputDecoration(
              prefixIcon: GestureDetector(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    viewModel.fetchArrivalLists(_controller.text);
                    _controller.clear();
                  }
                },
                child: const Icon(Icons.search),
              ),
              suffixIcon: _controller.text.isEmpty
                  ? null // Show nothing if the text field is empty
                  : IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                      },
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
