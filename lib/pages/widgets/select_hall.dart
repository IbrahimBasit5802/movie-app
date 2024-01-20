import 'package:flutter/material.dart';
import 'package:movie_app/theme/colors.dart';

class SelectHallWidget extends StatelessWidget {
  final String time;
  final String hall;
  final String price;
  final String bonus;
  const SelectHallWidget({
    super.key,
    required this.time,
    required this.hall,
    required this.price,
    required this.bonus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(23, 0, 0, 15),
        child: RichText(
          text: TextSpan(
            text: time.toString(),
            style: const TextStyle(
              color: Color(0xFF202C43),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: hall,
                style: const TextStyle(
                  color: Color(0xFF8F8F8F),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kLightBlue,
            ),
            color: kAppBarBackgroundColor,
          ),
          child: Image.asset('assets/images/seats.png'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(23, 0, 0, 15),
        child: RichText(
          text: TextSpan(
            text: 'From ',
            style: const TextStyle(
              color: Color(0xFF8F8F8F),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: price,
                  style: const TextStyle(
                    color: Color(0xFF202C43),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  )),
              const TextSpan(
                text: ' or',
                style: TextStyle(
                  color: Color(0xFF8F8F8F),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                  text: bonus,
                  style: const TextStyle(
                    color: Color(0xFF202C43),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
      ),
    ]);
  }
}
