/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class _ActionBar extends Control{

  static const String CLASS = 'cnp-example-action-bar';
  static const String APP_MENU_ACCESS_BUTTON = 'cnp-example-app-menu-access-button';
  static const String RIBBON_BAR_CONTAINER = 'cnp-example-ribbon-bar-container';
  static const int height = 45;

  final StackPanel _rootLayout = new StackPanel(Orientation.HORIZONTAL)
  ..fill();
  final StackPanel _ribbonBarContainer = new StackPanel(Orientation.HORIZONTAL)
  ..addClass(RIBBON_BAR_CONTAINER);
  final AlignPanel _appMenuAccessButton = new AlignPanel()
  ..addClass(APP_MENU_ACCESS_BUTTON);

  _ActionBar(void showAppMenu()){
    _actionBarStyle.insert();
    addClass(CLASS);
    _arrangeHtml();
    _hookUpEvents(showAppMenu);
  }

  void _arrangeHtml(){
    _rootLayout.addAll([_appMenuAccessButton, _ribbonBarContainer]);
    html.append(_rootLayout.html);
  }

  void _hookUpEvents(void showAppMenu()){
    _appMenuAccessButton.html.onClick.listen((MouseEvent event){
      showAppMenu();
    });
  }

  void setMenuAccessButtonText(String text){
    _appMenuAccessButton..clear()..add(new Label(text));
  }

  void setRibbonBar(Base ribbon){
    _ribbonBarContainer..clear()..add(ribbon);
  }

  static final Style _actionBarStyle = new Style('''
    
    .$CLASS
    {
      width: 100%;
      height: ${height}px;
      background: #eee;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .$APP_MENU_ACCESS_BUTTON
    {
      width: ${_AppMenuEntry.width}px;
      height: 100%;
      background: ${_AppMenuEntry.background};
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .$RIBBON_BAR_CONTAINER
    {
      width: calc(100% - ${_AppMenuEntry.width}px);
      height: 100%;
    }

  ''');
}