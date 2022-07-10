import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/report/income_expanes/report_mont_PDF.dart';
import '../../notifire/Repport_Notifire.dart';
Button_prin({required String type,required report_incomeNotifire mont,required BuildContext context}){

  return  Container(
    margin: const EdgeInsets.only(right: 10, left: 10),
    width: double.maxFinite,
    height: 55,
    child: ElevatedButton(
        onPressed: () {
          switch(type){
            case'incomeMont':{
              report_mont_PDF.Save_income_Mont_PDF(mont, context);
            }
            break;
            case'incomeDay':{
             report_Day_PDF.Save_income_Day_PDF(mont, context);
            }
            break;
            case'expanesMont':{

            }
            break;
            case'expanesDay':{

            }
            break;


          }
          //ImportProductPDF.SaveImportProductPDF(pro, context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const  [
            Icon(Icons.print),
          Text('  ພິມລາຍງານ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ],
        )),
  );

}