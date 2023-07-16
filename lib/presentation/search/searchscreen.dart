import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/functions/functions.dart';
import 'package:netflix/presentation/search/widgets/searchidle.dart';
import 'package:netflix/presentation/search/widgets/searchresultwidget.dart';

TextEditingController searchControllor = TextEditingController();
ValueNotifier searchScreenNotifier = ValueNotifier([]);

class SearchScreen extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ValueListenableBuilder(
                valueListenable: searchScreenNotifier,
                builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoSearchTextField(
                        focusNode: _focusNode,
                        onChanged: (value) {
                          getimageSearchGrid(value.trim());
                          searchScreenNotifier.notifyListeners();
                        },
                        controller: searchControllor,
                        backgroundColor: kgreycolor.withOpacity(0.3),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: kgreycolor,
                        ),
                        suffixIcon: const Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: kgreycolor,
                        ),
                        onTap: () {
                          searchControllor.clear();
                        },
                        style: const TextStyle(color: kwhite),
                      ),
                      kheigth,
                      (searchControllor.text.isEmpty)
                          ? const Expanded(child: SearchIdleWidget())
                          : const Expanded(child: SearchResultWidget())
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
