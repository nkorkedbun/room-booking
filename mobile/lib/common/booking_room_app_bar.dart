import 'package:flutter/material.dart';

class BookingRoomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingRoomAppBar(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage('assets/app_bar_bg.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Container(
          color: const Color.fromRGBO(
              0, 0, 0, 0.5), // Semi-transparent overlay color
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Back button pressed");
                        print(Navigator.canPop(context));
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                              height: 1.5),
                        )),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
