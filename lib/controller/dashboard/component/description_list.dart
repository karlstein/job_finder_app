import 'package:flutter/material.dart';
import 'package:newsanbercode/widgets/description_list.dart';

class Description {
  List<Widget> descriptionList(List<dynamic> dataList, bool isDetail) {
    List<Widget> dummies = [];
    int dataLen = isDetail
        ? dataList.length
        : dataList.length > 3
            ? 4
            : dataList.length;
    for (int i = 1; i <= dataLen; i++) {
      dummies.add(DescriptionList(
        dataList: dataList,
        isDetail: isDetail,
        dataLen: dataLen,
        index: i,
      ));
    }
    return dummies;
  }
}
