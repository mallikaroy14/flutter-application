import 'package:flutter/material.dart';

import 'data.dart';

final List _photos = [
  Data("hello", "images/logo.png"),
  Data("Hello", "images/logo.png"),
  Data("Part ", "images/logo.png"),
  Data("Part", "images/logo.png"),
  Data("disbursement", "images/logo.png"),
  Data("Last2 ", "images/logo.png"),
  Data("Last ", "images/logo.png")
];

Widget GridViewLayout(context, void Function(String) gridCallBack) {
  return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        mainAxisSpacing: 2.5,
      ),
      itemCount: _photos.length,
      itemBuilder: (context, index) {
        return Container(
          height: 10.0,
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0)),
          child: InkWell(
            onTap: () {
              gridCallBack(_photos[index].text);
            },
            child: Row(
              children: [
                Image(
                  image: AssetImage(_photos[index].image),
                  width: 30,
                  height: 30,
                ),
                Text(
                  _photos[index].text,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      });
}
