import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  bool isCloseable = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(kYaruPagePadding),
        child: Column(
          children: [
            YaruTile(
              title: const Text('YaruDialogTitle'),
              trailing: OutlinedButton(
                onPressed: () => showDialog(
                  barrierDismissible: isCloseable,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        if (!isCloseable)
                          OutlinedButton(
                            onPressed: () => Navigator.maybePop(context),
                            child: Text(
                              'Evil Force-Close',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                              ),
                            ),
                          )
                      ],
                      titlePadding: EdgeInsets.zero,
                      title: YaruDialogTitle(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('The Title'),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 25,
                              child: YaruCircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            )
                          ],
                        ),
                        isCloseable: isCloseable,
                      ),
                      content: SizedBox(
                        height: 100,
                        child: YaruBanner(
                          surfaceTintColor: Colors.pink,
                          name: Text(
                            isCloseable
                                ? 'You can close me'
                                : 'You cannot close me',
                          ),
                          subtitle: Text(
                            isCloseable ? 'Please' : 'No way',
                          ),
                          icon: Text(
                            isCloseable ? '🪟' : '💅',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                child: const Text('Open dialog'),
              ),
            ),
            YaruTile(
              title: const Text('isCloseable'),
              trailing: Switch(
                value: isCloseable,
                onChanged: (value) => setState(() => isCloseable = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}