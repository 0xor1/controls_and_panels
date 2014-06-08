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
    showMenu();
  }

  void _initialiseComponents(Base branding, String title){
    _header = new _Header(branding, title);
    _actionBar = new _ActionBar(showMenu);
    _mainContainer = new _MainContainer();
    _appMenu = new _AppMenu();
    _rootLayout.addAll([_header, _actionBar, _mainContainer]);
    html.append(_rootLayout.html);
  }

  void registerModule(Base menuEntry, Base ribbon, Base mainContent){
    //add menu entry to app menu and hook up event to insert ribbon to action bar and main content on click
  }

  void showMenu(){
    _mainContainer.html.children.insert(0, _appMenu.html);
  }

  void hideMenu(){
    if(_appMenu.html.parent == _mainContainer.html){
      _mainContainer.html.children.removeAt(0);
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