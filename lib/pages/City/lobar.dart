
import 'package:flutter/material.dart';
import 'package:pariwisatalom/model/lobar_place.dart';
import 'package:pariwisatalom/pages/home/detail.dart';

class LobarScreen extends StatelessWidget {
  const LobarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Kabupaten Lombok Barat',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.white),
        ),
      ),
     body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 800) {
            return Detailmobile();
          } else if (constraints.maxWidth > 1200) {
            return Detailweb(gridCount: 4);
          } else {
            return Detailweb(gridCount: 4);
          }
        },
      ),
    );
  }
}

class Detailweb extends StatelessWidget {
  final int gridCount;
  const Detailweb({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: parislobar.map((place) {
        return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(place: place),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(place.imageAsset), fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        place.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              place.location,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));

      }).toList(), 
    );
  }
}

class Detailmobile extends StatelessWidget {
  const Detailmobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: parislobar.length,
          itemBuilder: (context, index) {
            final place = parislobar[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(place: place),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(place.imageAsset), fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        place.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              place.location,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
