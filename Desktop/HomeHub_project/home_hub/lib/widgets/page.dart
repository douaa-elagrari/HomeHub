import '../utils/imports.dart';

class Mypage extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;

  final bool circleone;
  final bool circletwo;
  final bool circlethree;
  final bool chevron;
  const Mypage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.circleone,
    required this.circletwo,
    required this.circlethree,
    required this.chevron,
  });
  String _getCurrentTime() {
    final now = DateTime.now();
    final hours = now.hour.toString().padLeft(2, '0');
    final minutes = now.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: ReversedBottomCurveClipper(),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.6,
                color: const Color(0xFF004E98),
              ),
            ),
            Positioned(
              top: screenHeight * 0.01,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('assets/images/phonemockup.png'),

                  Positioned(
                    top: 45,
                    child: Container(
                      width: 130,
                      height: 275,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 5),
                              Text(
                                _getCurrentTime(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(width: 75),
                              Icon(Icons.wifi, size: 10),
                              Transform.rotate(
                                angle: 1.5708,
                                child: const Icon(
                                  Icons.battery_4_bar,
                                  size: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Container(
                              width: 129,
                              height: 253,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              child: Image.asset(imagePath!, fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.75),
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 4,
              backgroundColor: circleone ? Colors.blue : Colors.grey,
            ),
            SizedBox(width: 5),
            CircleAvatar(
              radius: 4,
              backgroundColor: circletwo ? Colors.blue : Colors.grey,
            ),
            SizedBox(width: 5),
            CircleAvatar(
              radius: 4,
              backgroundColor: circlethree ? Colors.blue : Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 10),
        chevron
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/welcome');
                  },
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class ReversedBottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width / 2,
      size.height - 160,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
