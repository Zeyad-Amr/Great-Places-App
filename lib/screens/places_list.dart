import 'package:flutter/material.dart';
import 'package:great_apps/providers/greatPlaces.dart';

import 'package:great_apps/screens/add_place.dart';
import 'package:provider/provider.dart';

class MyPlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Great Places',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.amber,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPlaceScreen()));
                }),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                builder: (context, greatPlaces, child) {
                  return greatPlaces.item.length <= 0
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You haven't any places yet \n Let's add some",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              Container(
                                width: size.width * 0.25,
                                child: FlatButton(
                                  padding: EdgeInsets.all(size.height * 0.02),
                                  splashColor: Colors.grey,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddPlaceScreen()));
                                  },
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 20),
                                  ),
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(29),
                                      side: BorderSide(color: Colors.grey)),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: ListView.builder(
                            itemCount: greatPlaces.item.length,
                            itemBuilder: (context, i) {
                              return Card(
                                color: Colors.amber,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        FileImage(greatPlaces.item[i].image),
                                  ),
                                  title: Text(greatPlaces.item[i].title),
                                  onTap: () {
                                    // Go to detail page ......
                                  },
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
      ),
    );
  }
}
