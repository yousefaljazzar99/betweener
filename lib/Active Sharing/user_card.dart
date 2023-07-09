import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffB8B8B8), width: 3))),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
          ),
          radius: 30,
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yousef Aljazzar',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text('@YousefAljazzar',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w300))
          ],
        ),
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.all(8),
          minWidth: 117,
          height: 48,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Color(0xFFFF1D20),
          child: const Text("Follow",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }
}
