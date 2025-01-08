import 'package:chat/core/route/screen_name.dart';

import 'export.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(builder: (context) {
          return BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  showDialogLoading(context);
                }
                if (state is LoginError) {
                  Navigator.pop(context);
                  showDialogText(context: context, msg: "${state.msg}");
                }
                if (state is LoginSucceed) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ScreenName.home, (route) => false);
                }
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LogoWidget(),
                    const SizedBox(height: 35),
                    Center(
                      child: TextWidget(
                          fontSize: 30,
                          title: 'Login',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 25),
                    TextFormFieldWidget(
                      hintText: 'Email',
                      controller: LoginCubit.get(context).email,
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      hintText: 'Password',
                      obscureText: true,
                      controller: LoginCubit.get(context).password,
                    ),
                    const SizedBox(height: 25),
                    BtnWidget(
                        onTap: () {
                          BlocProvider.of<LoginCubit>(context).login();
                        },
                        text: 'Login'),
                    const SizedBox(height: 25),
                    const NotHaveAccountWidget(),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
