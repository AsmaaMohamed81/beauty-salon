import 'dart:async';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<bool>? onSearch;
  final bool? cheackSearsh;

  const CustomSearchBar({Key? key, this.onSearch, this.cheackSearsh})
      : super(key: key);
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController controller = TextEditingController();
  Timer? _typingTimer;
  bool _isTyping = false;
  void _runTimer(String searchKey) {
    if (_typingTimer!.isActive) _typingTimer!.cancel();
    _typingTimer = Timer(Duration(milliseconds: 600), () {
      if (!_isTyping) return;
      _isTyping = false;
    });
    _isTyping = true;
  }

  String text = "";
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Row(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: TextFormField(
                  onTap: () {
                    if (!widget.cheackSearsh!) widget.onSearch!(true);
                  },
                  controller: controller,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (v) {},
                  decoration: InputDecoration(
                    icon: text.isEmpty
                        ? null
                        : InkWell(
                            onTap: () => setState(() {
                                  controller.clear();
                                  text = "";
                                }),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.clear),
                            )),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: "ابحث عن كل ما تحتاجه",
                  ),
                  onChanged: (v) {
                    setState(() => text = v);
                    _runTimer(v);
                  },
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: InkWell(
                  onTap: () {
                    widget.onSearch!(false);
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      !widget.cheackSearsh! ? Icons.search : Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
