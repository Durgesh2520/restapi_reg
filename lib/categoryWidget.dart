import 'package:flutter/material.dart';
import 'package:rest_api_app/model/business_type.dart';
import 'package:rest_api_app/view_model/api_viewmodel.dart';

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  ApiViewModel _apiViewModel = ApiViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
      ),
      body: Container(
        child: Column(
          children: [
            FutureBuilder<List<BusinessTypes>>(
              future: _apiViewModel.getAllCategoeries(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('ListCount  ${snapshot.data.length}');
                  return ListView.builder(
                    primary: false,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        snapshot.data.length == null ? 0 : snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var category = snapshot.data[index];
                      return Row(
                        children: [
                          Image.network(
                            category.image,
                            height: 90,
                            width: 90,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            category.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return CircularProgressIndicator();
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
