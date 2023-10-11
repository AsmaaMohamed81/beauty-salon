import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SortByDialog extends StatefulWidget {
  @override
  _SortByDialogState createState() => new _SortByDialogState();
}

class _SortByDialogState extends State<SortByDialog> {
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 160,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                InkWell(
                  onTap: () {
                    pop();
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xffd6246a), Color(0xff46095c)],
                          stops: [0, 1],
                          begin: Alignment(-0.77, -0.64),
                          end: Alignment(0.77, 0.64),
                        )),
                    child: const Center(
                        child: Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                    )),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(tr("Sort by"),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff202020),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.528,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: Text(tr("Top Rated"),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff3a3a3a),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.408,
                    )),
                leading: Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                    });
                  },
                  activeColor: const Color(0xff46095c),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: Text(tr("closest to me"),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff3a3a3a),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.408,
                    )),
                leading: Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                    });
                  },
                  activeColor: const Color(0xff46095c),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () {
              pop();
            },
            child: Container(
              width: 280,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xffd6246a), Color(0xff46095c)],
                  stops: [0, 1],
                  begin: Alignment(-1.00, -0.07),
                  end: Alignment(1.00, 0.07),
                ),
              ),
              child: Center(
                child: Text(tr("Order By"),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xffffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
