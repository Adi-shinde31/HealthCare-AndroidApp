import 'package:flutter/material.dart';
import 'AppointmentPage.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Near You'),
        backgroundColor: Colors.teal,

      ),
      body:  Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/maps.jpg"),
            fit: BoxFit.cover),
        ),
        // child:const Text("Maps"),
      ),
    );
  }
}

//
//
// import 'dart:async';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
//
// import 'chatmessage.dart';
// // import 'threedots.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [];
//
//
//   StreamSubscription? _subscription;
//
//   bool _isTyping = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
//   OpenAI chatGPT = OpenAI as OpenAI;
//
//   void _sendMessage() async {
//     if (_controller.text.isEmpty) return;
//     ChatMessage message = ChatMessage(
//       text: _controller.text,
//       sender: "User",
//     );
//
//     setState(() {
//       _messages.insert(0, message);
//       _isTyping = true;
//     });
//
//     _controller.clear();
//
//     final request = CompleteReq(
//         prompt: "Hello, How are you ?", model: Model.textDavinci3, maxTokens: 200);
//
//     _subscription = chatGPT!
//         .build(token: "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")
//         .onCompletionStream(request: request)
//         .listen((response){
//       // Vx.log(response!.choices[0].text);
//       print(response!.choices[0].text);
//       ChatMessage botMessage = ChatMessage(
//         text: response!.choices[0].text, sender:"bot");
//
//       setState(() {
//         _isTyping = false;
//         _messages.insert(0, botMessage);
//       });
//
//     });
//
//   }
//
//   Widget _buildTextComposer() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: _controller,
//             onSubmitted: (value) => _sendMessage(),
//             decoration: const InputDecoration.collapsed(
//                 hintText: "Ask your query here.."),
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.send),
//           onPressed: () {
//             _sendMessage();
//           },
//         ),
//       ],
//     ).px16();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Talk to your E-Doctor'),
//           backgroundColor: Colors.teal,
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Flexible(
//                   child: ListView.builder(
//                     reverse: true,
//                     padding: Vx.m8,
//                     itemCount: _messages.length,
//                     itemBuilder: (context, index) {
//                       return _messages[index];
//                     },
//                   )),
//               // if (_isTyping) const ThreeDots(),
//               const Divider(
//                 height: 1.0,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: context.cardColor,
//                 ),
//                 child: _buildTextComposer(),
//               )
//             ],
//           ),
//         ));
//   }
// }
//











































// import 'dart:async';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// import 'chatmessage.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [];
//
//   StreamSubscription? _subscription;
//
//   bool _isTyping = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _subscription!.cancel();
//     super.dispose();
//   }
//
//   final OpenAI chatGPT = OpenAI as OpenAI;
//
//   void _sendMessage() async {
//     if (_controller.text.isEmpty) return;
//     ChatMessage message = ChatMessage(
//       text: _controller.text,
//       sender: "User",
//     );
//
//     setState(() {
//       _messages.insert(0, message);
//       _isTyping = true;
//     });
//
//     _controller.clear();
//
//     final request = CompletionRequest(
//         prompt: "Hello, How are you ?",
//         model: Model.textDavinci3,
//         maxTokens: 200);
//
//     _subscription = chatGPT
//         .completion(
//       request,
//       apiKey: "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",
//     )
//         .listen((response) {
//       // Vx.log(response.choices[0].text);
//       print(response.choices[0].text);
//       ChatMessage botMessage = ChatMessage(
//         text: response.choices[0].text,
//         sender: "bot",
//       );
//
//       setState(() {
//         _isTyping = false;
//         _messages.insert(0, botMessage);
//       });
//     });
//   }
//
//   Widget _buildTextComposer() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: _controller,
//             onSubmitted: (value) => _sendMessage(),
//             decoration: const InputDecoration.collapsed(
//               hintText: "Ask your query here..",
//             ),
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.send),
//           onPressed: () {
//             _sendMessage();
//           },
//         ),
//       ],
//     ).px16();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Talk to your E-Doctor'),
//         backgroundColor: Colors.teal,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               child: ListView.builder(
//                 reverse: true,
//                 padding: Vx.m8,
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   return _messages[index];
//                 },
//               ),
//             ),
//             // if (_isTyping) const ThreeDots(),
//             const Divider(
//               height: 1.0,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: context.cardColor,
//               ),
//               child: _buildTextComposer(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//


