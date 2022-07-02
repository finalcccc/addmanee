import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/notifire/productNotifire.dart';

import '../api/searchData/search_Data.dart';

// ignore: non_constant_identifier_names
WidgetSearch({String? label, required String? type ,var notifire}) {
  var txt =TextEditingController();
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              controller: txt,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,

              ),
              placeholder: label,
              prefix: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xff7b7b7b),
                  ),
                  onPressed: () {
                    switch(type){
                      case 'product':
                        {
                          SearchProduct(notifire,txt.text).then((value){
                            txt.clear();
                          });
                        }
                        break;
                      case'emp':
                         Searchemp(notifire,txt.text);
                          txt.clear();
                        break;
                      case'cate':
                        Searchcategory(notifire,txt.text).then((value){
                          txt.clear();
                        });
                        break;
                      case'supp':
                        Searchsupp(notifire, txt.text);
                        break;

                    }

                  },
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xfff7f7f7),
                borderRadius: BorderRadius.circular(40),
              ),
              style: const TextStyle(
                color: Color(0xff707070),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
