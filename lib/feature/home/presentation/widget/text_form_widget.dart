import 'package:chat/feature/home/presentation/logic/home_cubit.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      bool btnColor = false;
      if (state is ChangBtnState) {
        btnColor = state.color;
      }
      return TextField(
        controller: HomeCubit.get(context).controller,
        onChanged: (value) {
          BlocProvider.of<HomeCubit>(context).changeBtnColor(value);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: IconButton(
                onPressed: () {
                  HomeCubit.get(context).addMessage();
                  HomeCubit.get(context).controller!.clear();
                },
                icon: Icon(
                  Icons.send,
                  color: btnColor ? Colors.orange : KPrimaryColor,
                ))),
      );
    });
  }
}
