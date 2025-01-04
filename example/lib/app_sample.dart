import 'package:flutter/material.dart';
import 'package:virtual_mouse/virtual_mouse.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  var bgColor = Colors.blue.shade500;
  var checked = false;

  KeyHandler? keyHandler;
  Offset? position;
  Size? constrants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        foregroundColor: Colors.white,
        title: const Text("Vitual Mouse"),
      ),
      body: Row(
        children: [
          Container(
            width: 200,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                Text(keyHandler?.keyPressed.toString() ?? "KeyPressed:"),
                Text(position?.toString() ?? "Offset:"),
                Text(constrants?.toString() ?? "Size:"),
              ],
            ),
          ),
          Expanded(
            child: VirtualMouse(
              onKeyPressed: (key) {
                setState(() {
                  keyHandler = key;
                });
              },
              onMove: (offset, size) {
                setState(() {
                  position = offset;
                  constrants = size;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: [
                      _cardButton(Colors.deepOrange, 10),
                      _cardButton(Colors.purple, 20),
                      _cardButton(Colors.green, 50),
                      _cardButton(Colors.black, 100),
                      _cardButton(Colors.blue, 50),
                      _cardButton(Colors.amber, 20),
                      _cardButton(Colors.deepOrange, 10),
                    ],
                  ),
                  const Divider(),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: DropdownButton<String>(
                          value: "1",
                          isExpanded: true,
                          onChanged: (value) {},
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          items: List.generate(3, (i) {
                            return DropdownMenuItem(
                              value: "${i + 1}",
                              child: Text("ListItem ${i + 1}"),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: CheckboxListTile(
                          value: checked,
                          onChanged: (check) {
                            setState(() {
                              checked = check == true;
                            });
                          },
                          title: Text("Check ($checked)"),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    width: 300,
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: [
                              Tab(text: "Tab 1"),
                              Tab(text: "Tab 2"),
                              Tab(text: "Tab 3"),
                            ],
                          ),
                          SizedBox(
                            height: 150,
                            child: TabBarView(
                              children: [
                                ColoredBox(color: Colors.cyan),
                                ColoredBox(color: Colors.amber),
                                ColoredBox(color: Colors.red),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardButton(Color color, double dm) {
    var size = Size.square(dm);
    return InkWell(
      onTap: () {
        setState(() {
          bgColor = color;
        });
      },
      child: Container(
        color: color,
        width: size.width,
        height: size.height,
      ),
    );
  }
}
