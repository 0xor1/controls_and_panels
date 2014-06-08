/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class _AppMenu extends Control{

  static const String CLASS = 'cnp-example-app-menu';
  static const int width = 220;
  static const String background = '#444';

  final StackPanel _rootLayout = new StackPanel(Orientation.HORIZONTAL);

  _AppMenu(){
    _appMenuStyle.insert();
    addClass(CLASS);
    html.append(_rootLayout.html);
  }

  static final Style _appMenuStyle = new Style('''
    
    .$CLASS
    {
      position: absolute;
      width: ${width}px;
      height: 100%;
      background: $background;
      overflow-y: auto;
    }

  ''');
}