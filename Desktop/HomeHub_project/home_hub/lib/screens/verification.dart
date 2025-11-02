import '../utils/imports.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _Verification();
}

class _Verification extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left, size: 35),
          ),

          SizedBox(height: 40),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Verification Code',
                      style: TextStyle(
                        color: Color(0xFF004E98),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  Row(
                    children: [
                      for (var i = 0; i <= 4; i++)
                        Container(
                          margin: EdgeInsets.all(8),
                          color: Colors.grey.withOpacity(0.4),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: TextField(
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 45),
                  Center(
                    child: Mybutton(
                      text: 'Verify',
                      bgcolor: Color(0xFF004E98),
                      fgcolor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/homescreen');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
