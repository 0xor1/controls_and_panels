/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class DesktopApp extends Control{

  static const String CLASS = 'cnp-example-desktop-app';

  final StackPanel rootLayout = new StackPanel(Orientation.VERTICAL);

  DesktopApp(Base branding, String title){
    _desktopAppStyle.insert();
    addClass(CLASS);
    rootLayout.add(new _Header(branding, title));
    html.append(rootLayout.html);
  }

  void registerModule(Base menuEntry, Base ribbon, Base mainContent){
    //add menu entry to app menu and hook up event to insert ribbon to action bar and main content on click
  }

  static Style _desktopAppStyle = new Style('''
    
    .$CLASS
    {
      width: 100%;
      height: 100%;
    }

    .$CLASS
      > .${StackPanel.CLASS}
    {
      width: 100%;
      height: 100%;
    }

  ''');
}