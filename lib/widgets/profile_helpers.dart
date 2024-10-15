import 'package:flutter/material.dart';

class ProfileHelpers {
  Widget getTopProfile(
      {required String name,
      required String role,
      double? rate,
      String? profileImageURL,
      }) {
        
    return Row(
      children: [
        //======================================================
        CircleAvatar(
          backgroundColor: Colors.blueGrey,
          radius: 25,
          backgroundImage: profileImageURL != null
              ? NetworkImage(profileImageURL) 
              : null,
          child: profileImageURL == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        //=======================================================
        const SizedBox(
          width: 20,
        ),
        //======================================================
        Column(
          children: [
            Text(
              
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            //=====================================
            Text(
              role,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        //=====================================================
        const Spacer(),
        //=====================================================
        Container(
          height: 35,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.transparent,
              border: Border.all(
                color: Colors.black,
                width: 2,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                rate!.toString(),
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getProfileEndButton({
    required String title,
    required BuildContext context,
    Widget? page,
    required String color,
    GestureTapCallback? onTap,
  }) {
    return ElevatedButton(
        onPressed: onTap ?? () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page!));
        },
        style: ButtonStyle(
          backgroundColor:  WidgetStateProperty.all<Color>(
            color=='green'?const Color.fromARGB(255, 72, 175, 65):color=='red'?const Color.fromARGB(255, 215, 31, 7):const Color.fromARGB(255, 240, 161, 43),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ));
  }


  Widget skillcontainer({required String title}) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Row takes only the necessary width
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 219, 219),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: const Color.fromARGB(255, 161, 158, 158),
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8
                ), // Adjust padding as needed
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ),
      ],
    );
  }


  Widget getProfileContainer(
      {required String title,
      required String item,
      }) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.green,
            width: 8,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              item,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
