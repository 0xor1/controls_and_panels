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