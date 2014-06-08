/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class _MainContainer extends Control{

  static const String CLASS = 'cnp-example-main-container';

  final StackPanel _rootLayout = new StackPanel(Orientation.VERTICAL)
  ..fill();

  _MainContainer(){
    _mainContainerStyle.insert();
    addClass(CLASS);
    html.append(_rootLayout.html);
  }

  void setMainContent(Base content){
    _rootLayout..clear()..add(content);
  }

  static final Style _mainContainerStyle = new Style('''
    
    .$CLASS
    {
      width: 100%;
      height: calc(100% - ${_Header.height + _ActionBar.height}px);
    }

  ''');
}