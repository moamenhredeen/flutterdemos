import 'package:flutter/material.dart';

class NewIssue extends StatelessWidget {
  const NewIssue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        spacing: 25,
        children: [
          SizedBox(height: 50,),
          Text("Create New Issue", style: Theme.of(context).textTheme.titleLarge,),
          // SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: "Title",
            ),
          ),
          // SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: "Description",
            ),
          ),
          // SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status"),
              DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "todo", label: "Todo"),
                    DropdownMenuEntry(value: "doing", label: "Doing"),
                    DropdownMenuEntry(value: "done", label: "Done"),
              ], onSelected: (v){}, hintText: "Status",),
            ],
          ),
          Spacer(),
          FilledButton(onPressed: (){}, child: Text("Create"),)
        ],
      ),
    );
  }
}
