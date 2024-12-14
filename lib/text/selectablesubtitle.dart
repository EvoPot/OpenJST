import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'selectabletext.dart';
import 'package:mecab_dart/mecab_dart.dart';

//god bless japanese devs making all the characters fit in an equal amount of space :sob:

class SelectableSubtitle extends StatefulWidget {
  final String text;
  final int rowLength;
  final Function(String) textOutputFunction;
  const SelectableSubtitle(
      {super.key,
      required this.text,
      required this.rowLength,
      required this.textOutputFunction});

  @override
  State<SelectableSubtitle> createState() => _SelectableSubtitleState();
}

class _SelectableSubtitleState extends State<SelectableSubtitle> {
  String _platformVersion = 'Unknown';
  String outputtext = '';
  var tagger = new Mecab();
  List<TokenNode> tokens = [];

  String removeSpaces(String textInput) {
    return (textInput.replaceAll(' ', '').replaceAll('　', ''));
  }

  String getListItemFromIndex(List<TokenNode> inputList, int index) {
    int flex2 = 0;
    int flex = 0;

    for (TokenNode i in inputList) {
      flex2 += i.surface.length;
      if ((index + 1) <= flex2 && (index + 1) >= flex) {
        return (i.surface);
      } else {
        flex += i.surface.length;
      }
    }

    return ('index error');
  }

  void returnSelectedText(int index) {
    print(getListItemFromIndex(tagger.parse(widget.text), index));
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Mecab.platformVersion;

      // Initialize mecab tagger here
      //   + 1st parameter : dictionary asset folder
      //   + 2nd parameter : additional mecab options
      await tagger.init("assets/mecab-dictionary/ipadic", true);

      tokens = tagger.parse(widget.text);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      ;
      print(platformVersion);

      for (var token in tagger.parse(widget.text)) {
        print(token.surface);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String pureText = removeSpaces(widget.text);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        height: 300,
        child: GridView.builder(
            itemCount: pureText.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.rowLength),
            itemBuilder: (context, index) {
              return SelectableTextTile(
                  tileText: pureText[index],
                  expectedValue: index,
                  onTapFunction: (int index) {
                    widget.textOutputFunction(
                        getListItemFromIndex(tagger.parse(widget.text), index));
                  });
            }),
      ),
    );
  }
}
