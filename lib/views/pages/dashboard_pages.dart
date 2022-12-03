part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    _checkStatusPageToken();
    context.read<DashboardCubit>().getDashboardData();
    super.initState();
  }

  String namaUser = '';
  Future<void> _checkStatusPageToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString('name');

    if (name != null) {
      setState(() {
        namaUser = name;
      });
    } else {
      setState(() {});
    }
  }

  // handle scroolview
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    // ignore: use_build_context_synchronously
    context.read<DashboardCubit>().getDashboardData();
    // ignore: use_build_context_synchronously

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }

  // adding widget hader profile
  Widget headerProfile() {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 35,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is DashboardGetSuccess) {
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
                  'Hello, $namaUser',
                  style: greenTextStyleInter.copyWith(
                    fontWeight: bold,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    _showMyDialog();
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.teal,
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(child: Text('Data kosong!'));
        }
      },
    );
  }

  // adding alert dialog to confirm logout
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Apakah anda yakin?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah anda yakin?'),
                Text('Untuk keluar dari aplikasi.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tidak',
                style: blackTextStyleInter.copyWith(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ya'),
              onPressed: () async {
                Navigator.of(context).pop();
                context.read<RoutesCubit>().emit(RoutesLogin());
                context.read<LoginCubit>().logoutGlobal();
              },
            ),
          ],
        );
      },
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
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const ShimmerHeaderLoading();
          } else if (state is DashboardGetSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                var dataArticle = state.result[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: WidgetHeader(
                    title: dataArticle.title,
                    subtitle: dataArticle.content,
                  ),
                );
              },
            );
          } else if (state is DashboardGetFailed) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Ada kesalahan!'),
            );
          }
        },
      ),
    );
  }

// adding content vertical
  Widget contentVertical() {
    return SizedBox(
      height: MyUtility(context).height / 1.5,
      width: double.infinity,
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const ShimmerContentLoading();
          } else if (state is DashboardGetSuccess) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                var dataArticle = state.result[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: WidgetContent(
                    img: dataArticle.image,
                    title: dataArticle.title,
                    subtitle: dataArticle.content,
                    dtime: dataArticle.created.date,
                  ),
                );
              },
            );
          } else if (state is DashboardGetFailed) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: Text('Ada kesalahan!'),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: SmartRefresher(
              enablePullDown: true,
              header: ClassicHeader(
                refreshingText: "Loading",
                textStyle: blackTextStyleInter,
                refreshingIcon: const SpinKitFadingCircle(
                  size: 20,
                  color: Colors.teal,
                ),
                completeIcon: const Icon(Icons.done, color: Colors.white),
                releaseIcon: const Icon(Icons.refresh, color: Colors.white),
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView(
                children: [
                  headerProfile(),
                  contentHorizontal(),
                  contentVertical(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
