import 'package:flutter/material.dart';
import 'package:newsanbercode/const.dart';

class DescriptionList extends StatelessWidget {
  const DescriptionList({
    required this.dataList,
    required this.isDetail,
    required this.dataLen,
    required this.index,
    Key? key,
  }) : super(key: key);

  final List<dynamic> dataList;
  final bool isDetail;
  final int dataLen;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isDetail
          ? [
              Container(
                width: 15,
                child: Text(
                  "$index. ",
                  style: kFontRegular.copyWith(fontSize: 13),
                ),
              ),
              SizedBox(width: 5),
              Flexible(
                child: Text(
                  "${dataList[index - 1]}",
                  style: kFontRegular.copyWith(
                      fontSize: 13, overflow: TextOverflow.visible),
                ),
              ),
            ]
          : index == dataLen
              ? [
                  Container(
                    child: Text("...."),
                  ),
                ]
              : [
                  Container(
                    width: 15,
                    child: Text(
                      "$index. ",
                      style: kFontRegular.copyWith(fontSize: 13),
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      "${dataList[index - 1]}",
                      style: kFontRegular.copyWith(
                          fontSize: 13, overflow: TextOverflow.visible),
                    ),
                  ),
                ],
    );
  }
}
