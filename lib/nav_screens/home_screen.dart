import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> messages = [
    'Hello, how are you? (9955542462): I\'m doing well, thanks for asking!',
    'I am doing well, thank you. (0987654321): Great to hear!',
    'Did you finish that project? (1234567890): Not yet, still working on it.',
    'When do you think you\'ll be done? (0987654321): Hopefully by the end of the week.',
    'Can you send me the latest draft? (1234567890): Sure, I\'ll email it to you.',
    'Thanks, got it. (0987654321): No problem.',
    'Hey, have you seen the new movie? (1234567890): Not yet, planning to watch it this weekend.',
    'It was really good. (0987654321): Thanks for the recommendation!',
    'Are you coming to the party tonight? (1234567890): Yes, looking forward to it!',
    'Awesome, see you there! (0987654321): Sounds good.',
    'Did you hear about the new restaurant that opened? (1234567890): No, tell me more.',
    'It\'s supposed to be really good. (0987654321): We should try it out sometime.',
    'What time are we meeting tomorrow? (1234567890): 10am at the office.',
    'Got it. (0987654321): See you then.',
    'Can you remind me of the deadline for the report? (1234567890): It\'s next Friday.',
    'Thanks. (0987654321): No problem.',
    'How was your trip? (1234567890): It was amazing, thanks for asking!',
    'Glad to hear it. (0987654321): Any pictures you want to share?',
    'Sure, let me send them to you. (1234567890): Thanks!',
    'Wow, these look great! (0987654321): Thanks for sharing.',
  ];

  List<Color> colorList = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  List<Color> iconcolorList = [
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
    Colors.lightBlueAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Received SMS',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            String message = messages[index];
            String phoneNumber = message.substring(
                message.indexOf('(') + 1, message.indexOf(')'));
            String messageBody = message.substring(0, message.indexOf('('));

            // You can use a database or a contact list API to get the contact name
            String contactName = 'Unknown';

            return ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Is this message spam'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  colorList[index] = Colors.red;
                                  iconcolorList[index] = Colors.red;
                                });
                              },
                              child: const Text('Mark as Spam')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  colorList[index] = Colors.black;
                                  iconcolorList[index] = Colors.lightBlueAccent;
                                });
                              },
                              child: const Text('Mark as not Spam'))
                        ],
                      );
                    });
              },
              leading: CircleAvatar(
                backgroundColor: iconcolorList[index],
                child: Text(
                  contactName[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                contactName,
                style: TextStyle(color: colorList[index]),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(phoneNumber),
                  const SizedBox(height: 4),
                  Text(messageBody),
                ],
              ),
              trailing: Icon(Icons.message, color: iconcolorList[index]),
            );
          },
        ),
      ),
    );
  }
}
