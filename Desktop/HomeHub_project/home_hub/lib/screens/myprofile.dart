import '../utils/imports.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _Myprofile();
}

class _Myprofile extends State<Myprofile> {
  final List<String> sentences = [
    'Edit Profile',
    'Notifications',
    'Switch to service provider account',
    'Logout',
  ];

  final List<IconData> icons = [
    Icons.arrow_forward,
    Icons.arrow_forward,
    Icons.arrow_forward,
    Icons.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_left, size: 35),
        ),

        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/photodeprofile.jpg'),
              radius: 60,
            ),
            SizedBox(height: 15),
            Text(
              'User Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'Account Type',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(4, (i) {
                return Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 1),
                      bottom: BorderSide(color: Color(0xFF004E98), width: 1),
                      left: BorderSide(
                        color: Color(0xFF004E98).withOpacity(0.5),
                        width: 1,
                      ),
                      right: BorderSide(
                        color: Color(0xFF004E98).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF004E98).withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sentences[i],
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Icon(icons[i], size: 20),
                    ],
                  ),
                );
              }),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
