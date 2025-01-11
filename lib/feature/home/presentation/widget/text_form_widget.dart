import 'package:chat/feature/home/presentation/logic/btn_cubit.dart';
import 'package:chat/feature/home/presentation/logic/home_cubit.dart';
import 'package:chat/feature/login/presentation/screen/export.dart';

class TextFormWidget extends StatelessWidget {
   TextFormWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtnCubit, bool>(

        builder: (context, state) {
      return TextFormField(

        controller: HomeCubit.get(context).controller,
        onChanged: (value) {
          BlocProvider.of<BtnCubit>(context).changeBtnColor(value);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            suffixIcon: IconButton(
                onPressed: () {
                  HomeCubit.get(context).addMessage();
                  HomeCubit.get(context).scrollToEnd();
                  HomeCubit.get(context).controller!.clear();
                  BlocProvider.of<BtnCubit>(context).changeBtnColor("");
                },
                icon: Icon(
                  Icons.send,
                  color: state ? Colors.orange : KPrimaryColor,
                ))),
      );
    });
  }
}
