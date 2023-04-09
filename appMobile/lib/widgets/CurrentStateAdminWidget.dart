import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentStateAdminWidget extends StatefulWidget {
  CurrentStateAdminWidget({super.key, required this.currentState,required this.captorName});

  final String captorName;
  final String currentState;

  @override
  State<StatefulWidget> createState() => _CurrentStateAdmin();
}

class _CurrentStateAdmin extends State<CurrentStateAdminWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(widget.captorName),
            ),
            Expanded(
              flex: 4,
              child: Text(widget.currentState),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(

                onPressed: () {
                  Navigator.pushNamed(context, '/detailCaptorAdmin');

                },
                child: Icon(Icons.query_stats),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.blue)
                      )
                  )
                )
              ),
            ),
          ],
        ),
        Divider(
          height: 20,
          thickness: 1,
          indent: 5,
          endIndent: 5,
          color: Colors.grey,
        )
      ],
    );
  }
}
