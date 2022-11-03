import 'package:flutter/material.dart';

import 'api.dart';

class DogsW extends StatefulWidget {
  const DogsW({super.key});

  @override
  State<DogsW> createState() => _DogsWState();
}

class _DogsWState extends State<DogsW> {
  List<Map<String, dynamic>> breedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: TextField(
              onChanged: (value) {
                if (value.length > 3) {
                  BreedApi().getBreed(value).then((list) {
                    setState(() {
                      if (list['statusCode'] == 200) {
                        breedList = list['breed'];
                      }
                    });
                  });
                } else {
                  setState(() {
                    breedList = [];
                  });
                }
              },
              autofocus: true,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintText: "Search Breed"),
              cursorColor: Colors.black,
            ),
          ),
          if (breedList.isNotEmpty)
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(30),
              child: ListView.builder(
                  itemCount: breedList.length,
                  itemBuilder: (context, index) {
                    return Text(breedList[index]['name']);
                  }),
            ))
        ],
      ),
    );
  }
}
