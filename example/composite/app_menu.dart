/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class _AppMenu extends Control{

  static const String CLASS = 'cnp-example-app-menu';

  final StackPanel _rootLayout = new StackPanel(Orientation.VERTICAL);

  _AppMenu(){
    _appMenuStyle.insert();
    addClass(CLASS);
    html.append(_rootLayout.html);
  }

  void add(_AppMenuEntry entry){
    _rootLayout.add(entry);
  }

  static final Style _appMenuStyle = new Style('''
    
    .$CLASS
    {
      position: absolute;
      max-height: 100%;
      overflow-y: auto;
    }

  ''');
}