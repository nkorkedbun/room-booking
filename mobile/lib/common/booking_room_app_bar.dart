import 'package:flutter/material.dart';

class BookingRoomAppBar extends StatelessWidget with PreferredSizeWidget {
  const BookingRoomAppBar(this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(22, 20, 22, 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage('assets/app_bar_bg.png'),
              fit: BoxFit.fitHeight,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
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
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
