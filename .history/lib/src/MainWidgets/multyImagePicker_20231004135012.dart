import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'custom_alert.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class MultiImagePickerBtn extends StatefulWidget {
  final ValueChanged<List<File>>? onChangeFile;
  final List<Photo>? photos;
  final int? type;
  const MultiImagePickerBtn({
    Key? key,
    this.onChangeFile,
    this.photos,
    this.type,
  }) : super(key: key);
  @override
  _MultiImagePickerBtnState createState() => _MultiImagePickerBtnState();
}

class _MultiImagePickerBtnState extends State<MultiImagePickerBtn> {
  List<File> _img = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => ImagePickerDialogBtSheet().show(
              context: context,
              onGet: (f, v) {
                if (v == 0) {
                  setState(() => _img.addAll(f));
                } else {
                  setState(() => _img.add(f));
                }
                widget.onChangeFile(_img);
                return;
              }),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromRGBO(220, 220, 220, 1))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Icon(Icons.photo), Text("المعرض")]),
            ),
          ),
        ),
        widget.photos == null
            ? SizedBox()
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    height: 120,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.photos.length,
                        itemBuilder: (context, index) => _oneImgNetwork(
                            widget.photos[index].photo,
                            index,
                            widget.photos[index].id)))),
        (_img.length < 1) == true
            ? Container()
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: 120,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _img.length,
                    itemBuilder: (context, index) =>
                        _oneImgFile(_img[index], index),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _oneImgFile(File img, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    img,
                  )),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () => setState(() => _img.removeAt(index)),
              child: Material(
                color: Colors.white,
                elevation: 2,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.close, size: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _oneImgNetwork(String img, int index, int id) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    img,
                  )),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                if (widget.photos.length == 1) {
                  CustomAlert().toast(title: "لا يمكن الحذف");
                } else {
                  // if (widget.type == 0) {
                  //   setState(() => widget.photos.removeAt(index));
                  //   Provider.of<DeletePhotoProvider>(context, listen: false)
                  //       .deleteGalleryPhoto(id);
                  //   //     .then((v) {
                  //   //   if (v == true) {
                  //   //     setState(() => widget.photos.removeAt(index));
                  //   //   }
                  //   // });
                  // } else {
                  //   Provider.of<DeletePhotoProvider>(context, listen: false)
                  //       .deletePhoto(id)
                  //       .then((v) {
                  //     if (v == true) {
                  //       setState(() => widget.photos.removeAt(index));
                  //     }
                  //   });
                  // }
                  //
                  // widget.onDelete().then((v) {
                  //   if (v == true) {
                  //     setState(() => widget.photos.removeAt(index));
                  //   }
                  // });
                }
              },
              child: Material(
                color: Colors.white,
                elevation: 2,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.close, size: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerDialogBtSheet {
  List<File> files = [];

  Widget _roundedButton({String label, Color bgColor, Color txtColor}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        label,
        style: new TextStyle(
          color: txtColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _openCamera(onGet(f, v), BuildContext context) async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    onGet(File(image.path), 1);
    Navigator.pop(context);
  }

  _openGallery(onGet(f, v), BuildContext context) async {
    List<Asset> resultList =
        await MultiImagePicker.pickImages(maxImages: 5, enableCamera: false);

    for (int i = 0; i < resultList.length; i++) {
      final byteData = await resultList[i].getByteData();
      final tempFile =
          File("${(await getTemporaryDirectory()).path}/${resultList[i].name}");
      final file = await tempFile.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      files.add(file);
    }

    onGet(files, 0);
    Navigator.pop(context);
  }

  show({ValueChanged onGet(f, v), BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Material(
          type: MaterialType.transparency,
          child: Opacity(
            opacity: 1.0,
            child: Container(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _openCamera(onGet, context),
                    child: _roundedButton(
                      label: "Camera",
                      bgColor: Theme.of(context).primaryColor,
                      txtColor: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _openGallery(onGet, context),
                    child: _roundedButton(
                      label: "Gallery",
                      bgColor: Theme.of(context).primaryColor,
                      txtColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                      child: _roundedButton(
                        label: "Cancel",
                        bgColor: Colors.black,
                        txtColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Photo {
  Photo({
    this.id,
    this.mealId,
    this.meal,
    this.photo,
  });

  int id;
  int mealId;
  String meal;
  String photo;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] == null ? null : json["id"],
        mealId: json["meal_id"] == null ? null : json["meal_id"],
        meal: json["meal"] == null ? null : json["meal"],
        photo: json["photo"] == null ? null : json["photo"],
      );
  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "meal_id": mealId == null ? null : mealId,
        "meal": meal == null ? null : meal,
        "photo": photo == null ? null : photo,
      };
}
