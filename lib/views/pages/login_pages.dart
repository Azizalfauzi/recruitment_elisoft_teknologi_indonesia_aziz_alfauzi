part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // adding check token to load routes
  @override
  void initState() {
    _checkStatusPageToken();
    super.initState();
  }

  Future<void> _checkStatusPageToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString('name');

    if (name != null) {
      var duration = const Duration(milliseconds: 1000);
      Timer(duration, () {
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        context.read<RoutesCubit>().emit(RoutesDashboard());
      });
    } else {
      var duration = const Duration(milliseconds: 1000);
      Timer(duration, () {
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        context.read<RoutesCubit>().emit(RoutesLogin());
      });
    }
  }

  // adding form text field
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // adding to header text
  // title and image
  Widget headerText() {
    return SizedBox(
      height: MyUtility(context).height / 10,
      width: double.infinity,
      child: Center(
        child: Text(
          'MY APP',
          style: greenTextStyleInter.copyWith(
            fontWeight: bold,
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  // adding to header text
  // title and image
  Widget headerImage() {
    return Container(
      height: MyUtility(context).height / 3,
      width: MyUtility(context).width / 1.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ic_login.png'),
          scale: 0.2,
        ),
      ),
    );
  }

// adding to content page
// form or textfield
  Widget contentEmail() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Type your email here',
          labelStyle: greenTextStyleInter.copyWith(
            fontSize: 15,
            fontWeight: light,
          ),
          border: const OutlineInputBorder(),
          hintText: 'email',
        ),
      ),
    );
  }

  Widget contentPassword() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 15,
      ),
      child: TextField(
        obscureText: _obscureText,
        controller: passwordController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Type your password here',
          labelStyle: greenTextStyleInter.copyWith(
            fontSize: 15,
            fontWeight: light,
          ),
          hintText: 'Password',
          hintStyle: greenTextStyleInter.copyWith(
            fontSize: 15,
            fontWeight: light,
          ),
          suffix: InkWell(
            onTap: _toggle,
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              size: 15.0,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }

  // adding to footer page
  // button
  Widget footer() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: kPrimaryColor,
      textStyle: whiteTextStyleInter.copyWith(
        fontWeight: medium,
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 2.0,
        right: 2.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Flushbar(
                duration: const Duration(milliseconds: 3000),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Colors.green,
                titleText: Text(
                  'Success Login',
                  style: whiteTextStyleInter.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                messageText: Text(
                  'Berhasil melakukan login',
                  style: whiteTextStyleInter.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ).show(context);
              // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
              context.read<RoutesCubit>().emit(RoutesDashboard());
            } else if (state is LoginFailed) {
              Flushbar(
                duration: const Duration(milliseconds: 3000),
                flushbarPosition: FlushbarPosition.TOP,
                backgroundColor: Colors.red,
                titleText: Text(
                  'Gagal Login',
                  style: whiteTextStyleInter.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                messageText: Text(
                  state.message,
                  style: whiteTextStyleInter.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: kPrimaryColor,
                  size: 50,
                ),
              );
            }
            return ElevatedButton(
              style: style,
              onPressed: () async {
                if (emailController.text == "" ||
                    passwordController.text == "") {
                  Flushbar(
                    duration: const Duration(milliseconds: 3000),
                    flushbarPosition: FlushbarPosition.TOP,
                    backgroundColor: Colors.red,
                    titleText: Text(
                      'Ada form kosong!',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    messageText: Text(
                      'Lakukan pengisian form dengan benar',
                      style: whiteTextStyleInter.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ).show(context);
                } else {
                  // ignore: use_build_context_synchronously
                  context.read<LoginCubit>().loginGlobal(
                      emailController.text, passwordController.text);
                }
              },
              child: Text(
                'Login',
                style: whiteTextStyleInter.copyWith(
                  fontSize: 16,
                ),
              ),
            );
          },
        ),
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
                headerText(),
                headerImage(),
                contentEmail(),
                contentPassword(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
