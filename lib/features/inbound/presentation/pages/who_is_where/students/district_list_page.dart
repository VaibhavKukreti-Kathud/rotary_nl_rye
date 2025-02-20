import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotary_nl_rye/core/presentation/widgets/image_list_tile.dart';
import 'package:rotary_nl_rye/core/prop.dart';
import 'package:rotary_nl_rye/features/inbound/data/district_list.dart';
import 'package:rotary_nl_rye/features/inbound/presentation/models/year.dart';

import 'students_list_page.dart';

class DistrictsListPage extends StatelessWidget {
  final YearList year;

  const DistrictsListPage({required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Icon(
              Icons.arrow_back,
              color: Palette.accentColor,
              size: 30.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Palette.themeShadeColor,
            padding: const EdgeInsets.all(5.0),
          ),
        ),
        title: Text(
          'Districts Year ${year.year}',
          textScaleFactor: 0.9,
          style: TextStyle(color: Palette.indigo, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        //height: Device.height - 277,
        margin: EdgeInsets.only(left: 5, right: 5),
        child: ListView.builder(
          shrinkWrap: false,
          itemBuilder: (context, index) => InboundDistrictListTile(
              item: districtList[index],
              studentsListPage: StudentsListPage(
                students: year.list
                    .where((element) =>
                        element.district == districtList[index].districtName)
                    .toList(),
                districtnumber: districtList[index].number,
                district: districtList[index].districtName,
                year: year.year,
              )),
          itemCount: districtList.length,
        ),
      ),
    );
  }
}
//InboundsStudentsListTile(
//               item: districts.list[index],
//               inboundsStudentsListPage:
//                   InboundsDetails(person: districts.list[index])),
