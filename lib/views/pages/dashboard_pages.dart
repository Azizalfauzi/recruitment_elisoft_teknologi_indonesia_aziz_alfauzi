part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // adding widget hader profile
  Widget headerProfile() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      height: MyUtility(context).height / 20,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello Aziz',
            style: greenTextStyleInter.copyWith(
              fontWeight: bold,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.teal,
            ),
          )
        ],
      ),
    );
  }

  // adding content content horizontal
  Widget contentHorizontal() {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          WidgetHeader(),
          WidgetHeader(),
          WidgetHeader(),
          WidgetHeader(),
        ],
      ),
    );
  }

// adding content vertical
  Widget contentVertical() {
    return SizedBox(
      height: MyUtility(context).height / 1.5,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          WidgetContent(),
          WidgetContent(),
          WidgetContent(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              children: [
                headerProfile(),
                contentHorizontal(),
                contentVertical(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
