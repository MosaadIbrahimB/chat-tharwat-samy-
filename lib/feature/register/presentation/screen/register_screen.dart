import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constrain.dart';
import '../../../../core/widget/show_dialog.dart';
import '../../../../core/widget/show_dialog_loading.dart';
import '../../../../core/widget/button_widget.dart';
import '../../../../core/widget/logo_widget.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../core/widget/text_field_widget.dart';
import '../logic/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: BlocProvider(
        create: (context) => RegisterCubit(),
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
                      context, 'homeScreen', (route) => false);
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
                        print("reg");
                      BlocProvider.of<RegisterCubit>(context).register();

                    },
                      text: 'Register',
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}



