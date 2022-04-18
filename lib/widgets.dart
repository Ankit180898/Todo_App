import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;

  const TaskCardWidget({Key? key, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Unnamed Task)",
            style: TextStyle(
                fontSize: 22.0,
                color: Color(0xFF211551),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            desc ?? "No description added",
            style:
                TextStyle(height: 1.3, fontSize: 16.0, color: Colors.blueGrey),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String? text;
  final bool isDone;

  const TodoWidget({Key? key, this.text, required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12.0),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isDone ? Colors.lightBlue : Colors.transparent,
                border: isDone
                    ? null
                    : Border.all(color: Colors.blueGrey, width: 1.5)),
            child: Image(
              image: AssetImage("assets/check_icon.png"),
            ),
          ),
          Text(
            text ?? "(Unnamed Todo)",
            style: TextStyle(fontSize: 16.0, fontWeight:isDone? FontWeight.bold:FontWeight.w500,
            color: isDone?Color(0xFF211551):Color(0xFF868290)),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    // TODO: implement buildViewportChrome
    return child;
  }
}
