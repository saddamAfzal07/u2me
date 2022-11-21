import 'package:flutter/material.dart';
import 'package:u2me/constants/colors/colors.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.background,
        leading: Image.asset(
          "assets/images/backarrow.png",
          width: 7,
          height: 12,
        ),
        title: const Text(
          "Message",
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _topChat(),
                _bodyChat(),
                // SizedBox(
                //   height: 100,
                // )
              ],
            ),
            _formChat(),
          ],
        ),
      ),
    );
  }

  _topChat() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 6,
      // dense: true,
      // visualDensity: const VisualDensity(vertical: -1),
      leading: Image.asset(
        "assets/images/pic1.png",
        width: 70,
        height: 50,
      ),
      title: const Text("Ugradnja parketa"),
      // subtitle: const Text("Ugradnja parketa"),
      tileColor: Colors.grey.shade300,
      trailing: Container(
        margin: const EdgeInsets.only(right: 6),
        height: 30,
        width: 130,
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        child: const Center(
          child: Text(
            "APPLIED FOR THE JOB",
            style: TextStyle(
                color: AppColor.white,
                fontSize: 11,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          color: Colors.white,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Okey 🐣',
              time: '18.00',
            ),
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message: 'It has survived not only five centuries, 😀',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
              time: '18.00',
            ),
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
              time: '18.00',
            ),
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message: '😅 😂 🤣',
              time: '18.00',
            ),
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              // avatar: 'assets/image/5.jpg',
              chat: 1,
              message:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
          ],
        ),
      ),
    );
  }

  // 0 = Send
  // 1 = Recieved
  _itemChat({required int chat, required message, required time}) {
    return Row(
      mainAxisAlignment:
          chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 10.0),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 1, right: 1, top: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? AppColor.primary : Colors.indigo.shade50,
              borderRadius: chat == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Text(
              '$message',
              style: TextStyle(
                color: chat == 0 ? AppColor.white : Colors.black,
              ),
            ),
          ),
        ),
        chat == 1
            ? Text(
                '$time',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 10.0,
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // height: 120,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              suffixIcon: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.primary),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              filled: true,
              fillColor: Colors.blueGrey[50],
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade300),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade200),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Avatar extends StatelessWidget {
//   final double size;
//   final image;
//   final EdgeInsets margin;
//   Avatar({this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: margin,
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image:  DecorationImage(
//             image: AssetImage(image),
//           ),
//         ),
//       ),
//     );
//   }
// }
