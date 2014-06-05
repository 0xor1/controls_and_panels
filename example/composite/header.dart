/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of cnp.example;

class Header extends Control{

  static const String CLASS = 'cnp-example-header';
  static const String TITLE = 'cnp-example-title';
  static const String BRANDING_PLACEHOLDER = 'cnp-example-branding-placeholder';

  final StackPanel rootLayout = new StackPanel(Orientation.HORIZONTAL);
  final StackPanel brandingPlaceholder = new StackPanel(Orientation.HORIZONTAL)
  ..addClass(BRANDING_PLACEHOLDER);

  Header(Base branding, String title){
    _headerStyle.insert();
    addClass(CLASS);
    rootLayout
    ..add(
      brandingPlaceholder
      ..add(
        branding))
    ..add(
      new Label(title)
      ..addClass(TITLE));
    html.append(rootLayout.html);
  }

  static Style _headerStyle = new Style('''
    
    .$CLASS
    {
      width: 100%;
      height: 60px;
      font-size: 20px;
      background: #a5d5f5;
    }

    .$CLASS
      > .${StackPanel.CLASS}
    {
      width: calc(100% - 70px);
      height: 50px;
      margin: 5px 35px;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .$BRANDING_PLACEHOLDER
    {
      width: 110px;
      height: 50px;
    }

    .$CLASS
      > .${StackPanel.CLASS}
        > .$TITLE
    {
      margin-left: 95px;
    }

  ''');
}