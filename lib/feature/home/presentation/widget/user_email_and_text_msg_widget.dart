import 'package:chat/feature/login/presentation/screen/export.dart';

class UserEmailAndTextMsgWidget extends StatelessWidget {
  const UserEmailAndTextMsgWidget(
      {super.key, required this.userEmail, required this.title, this.friend=false});

  final String userEmail;
  final String title;
  final bool? friend;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:friend!? CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.start,
              userEmail,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          textAlign: TextAlign.start,
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
