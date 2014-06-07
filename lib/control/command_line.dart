/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class CommandLine extends Control{

  static const String CLASS = 'cnp-command-line';
  static const String USER_INPUT = 'cnp-user-input';
  static const String HISTORY_FEED = 'cnp-history-feed';
  static const String DISABLED = 'cnp-disabled';

  final StackPanel _rootLayout = new StackPanel(Orientation.VERTICAL);
  final StackPanel _historyFeed = new StackPanel(Orientation.VERTICAL)
  ..addClass(HISTORY_FEED);
  final TextArea _userInput = new TextArea(placeholder: 'enter commands here')
  ..addClass(USER_INPUT);

  final StreamController<String> _userEntryController = new StreamController<String>();
  Stream<String> _onUserEntry;
  Stream<String> get onUserEntry => _onUserEntry != null? _onUserEntry: _onUserEntry = _userEntryController.stream.asBroadcastStream();

  /**
   * The string that will be prefixed before each entry into the history feed,
   * the default value is '>'
   */
  String entryPrefix = '>';
  int _historyLength = 100;
  int get historyLength => _historyLength;
  /**
   * Sets how many entries the history feed will hold before deleting the oldest entries,
   * the default value is 100.
   *  * [length] must be greater than 0.
   */
  void set hisotyLength(int length){
    _historyLength = length > 0? length: _historyLength;
  }

  CommandLine(){
    _commandLineStyle.insert();
    addClass(CLASS);
    _arrangeHtml();
    _hookUpEvents();
  }

  void _arrangeHtml(){
    html.children.add((
      _rootLayout
      ..addAll([
        _historyFeed,
        _userInput])).html);
  }

  void _hookUpEvents(){
    _userInput.html.onKeyDown.listen((KeyboardEvent event){
      if(event.keyCode == KeyCode.ENTER){
        writeEntry(_userInput.value);
        _userEntryController.add(_userInput.value);
        _userInput.value = '';
      }
    });
    _userInput.html.onKeyUp.listen((KeyboardEvent event){
      if(event.keyCode == KeyCode.ENTER){
        _userInput.value = '';
      }
    });
  }

  void writeEntry(String entry) {
    Paragraph fullEntry = new Paragraph('$entryPrefix$entry');
    _historyFeed.add(fullEntry);
    fullEntry.html.scrollIntoView(ScrollAlignment.BOTTOM);
    if(_historyFeed.items.length > historyLength){
      _historyFeed.remove(_historyFeed.items.first);
    }
  }

  bool get userInputDisabled => _userInput.disabled;
  void set userInputDisabled(bool disabled){
    _userInput.disabled = disabled;
  }

  static final Style _commandLineStyle = new Style('''

    .$CLASS
      > .${StackPanel.CLASS}
    {
      width: 100%;
      height: 100%;
      background: #777;
    }

    .$CLASS
      > .${StackPanel.CLASS} *
    {
      width: 100%;
      background: #000;
      color: #3f3;
      font-family: "Lucida Console", Monaco, monospace;
      font-size: 12px;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .${HISTORY_FEED}
    {
      height: calc(100% - 52px);
      margin-bottom: 2px;
      overflow-y: scroll;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .${HISTORY_FEED}
          > .${Paragraph.CLASS}
    {
      word-wrap: break-word;
      margin-top: 0;
      margin-bottom: 5px;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .${USER_INPUT}
    {
      height: 50px;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .${USER_INPUT} > textarea
    {
      width: 100%;
      height: 100%;
      margin: 0;
      border: 0;
      outline: 0;
      padding: 0;
      overflow-y: scroll;
      resize: none;
    }

  ''');
}