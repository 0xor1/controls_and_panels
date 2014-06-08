/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class _AppMenuEntry extends Control{

  static const String CLASS = 'cnp-example-app-menu-entry';
  static const int width = 220;
  static const String background = '#444';
  static const String backgroundHover = '#888';
  static const String color = '#fff';

  final AlignPanel _rootLayout = new AlignPanel()
  ..fill();

  _AppMenuEntry(String name){
    _appMenuEntryStyle.insert();
    addClass(CLASS);
    _rootLayout.add(new Label(name));
    html.append(_rootLayout.html);
  }

  static final Style _appMenuEntryStyle = new Style('''
    
    .$CLASS
    {
      position: absolute;
      width: ${width}px;
      height: ${_ActionBar.height};
      background: $background;
      color: $color;
    }

    .$CLASS:hover
      > *
    {
      background: $backgroundHover;
    }

  ''');
}