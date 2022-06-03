

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Search"),
      backgroundColor: Colors.amber,),

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: TextFormField(

          cursorColor: Colors.black,
          // controller: doctorName,
          autocorrect: false,
          //keyboardType: inputType,
          decoration:  InputDecoration(
            suffixIcon: const Icon(Icons.search,color: Colors.amber,),
              border: OutlineInputBorder(
                borderSide:  const BorderSide(width: 3, color: Colors.amber),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:  const BorderSide(width: 3, color: Colors.amber),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:  const BorderSide(width: 3, color: Colors.amber),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:  const BorderSide(width: 3, color: Colors.amber),
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:  const BorderSide(width: 3, color: Colors.amber),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'search',
              hintStyle: const TextStyle(
                  color: Colors.grey, fontSize: 14)),
        ),
      ),
    );
  }
}
