import 'export_register_sc_import.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: BlocProvider(
        create: (context) => getIt<RegisterCubit>(),
        child: Builder(builder: (context) {
          return BlocListener<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  showDialogLoading(context);
                }
                if (state is RegisterError) {
                  Navigator.pop(context);
                  showDialogText(context: context,msg:"${state.msg}" );

                }
                if (state is RegisterSucceed) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppNameScreen.home, (route) => false);
                }
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: RegisterCubit.get(context).key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoWidget(),
                      const SizedBox(height: 35),
                      Center(
                        child: TextWidget(
                            fontSize: 30,
                            title: 'Register',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 25),
                      TextFormFieldWidget(
                        hintText: 'Email',
                        controller: RegisterCubit.get(context).email,
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                        controller: RegisterCubit.get(context).password,
                      ),
                      const SizedBox(height: 25),
                      BtnWidget(
                        onTap: (){
                        BlocProvider.of<RegisterCubit>(context).register();
                      },
                        text: 'Register',
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }
}



