/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class DesktopApp extends Control{

  static const String CLASS = 'cnp-example-desktop-app';

  final StackPanel _rootLayout = new StackPanel(Orientation.VERTICAL);
  _Header _header;
  _ActionBar _actionBar;
  _AppMenu _appMenu;
  _MainContainer _mainContainer;

  DesktopApp(Base branding, String title){
    _desktopAppStyle.insert();
    addClass(CLASS);
    _initialiseComponents(branding, title);
  }

  void _initialiseComponents(Base branding, String title){
    _header = new _Header(branding, title);
    _actionBar = new _ActionBar(showMenu);
    _mainContainer = new _MainContainer();
    _appMenu = new _AppMenu()
    ..html.onMouseLeave.listen((_){
      hideMenu();
    });
    _rootLayout.addAll([_header, _actionBar, _mainContainer]);
    html.append(_rootLayout.html);
  }

  void registerModule(String name, Base ribbon, Base mainContent){
    var _appMenuEntry = new _AppMenuEntry(name);
    _appMenuEntry.html.onClick.listen((_){
      loadModule(name, ribbon, mainContent);
    });
    _appMenu.add(_appMenuEntry);
  }

  void loadModule(String name, Base ribbon, Base mainContent){
    _actionBar.setRibbonBar(ribbon);
    _mainContainer.setMainContent(mainContent);
  }

  void showMenu(){
    _mainContainer.html.append(_appMenu.html);
  }

  void hideMenu(){
    if(_appMenu.html.parent == _mainContainer.html){
      _mainContainer.html.children.remove(_appMenu.html);
    }
  }

  static final Style _desktopAppStyle = new Style('''
    
    .$CLASS
    {
      width: 100%;
      min-width: 800px;
      height: 100%;
      min-height: 400px;
    }

    .$CLASS
      > .${StackPanel.CLASS}
    {
      width: 100%;
      height: 100%;
    }

  ''');
}