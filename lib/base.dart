/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

abstract class Base{
  
  static const String CLASS = 'cnp-base';
  static const String FILL = 'fill';
  static const String CNP_STAGING_ELEMENT_ID = 'cnp-staging-element-id';
  
  static final DivElement _controlsAndPanelsStagingElement = new DivElement()
  ..id = CNP_STAGING_ELEMENT_ID
  ..style.position = 'absolute'
  ..style.width = '0'
  ..style.height = '0'
  ..style.margin = '0'
  ..style.border = '0'
  ..style.padding = '0'
  ..style.overflow = 'hidden';
  
  static bool _fillByDefault = false;
  
  static void setFillByDefault(){
    _fillByDefault = true;
  }
  
  static void setUnfillByDefault(){
    _fillByDefault = false;
  }

  final DivElement html = new DivElement()
  ..classes.add(CLASS);
  CssStyleDeclaration get style => html.style;

  Base(){
    _baseStyle.insert();
    stage();
    if(_fillByDefault){
      fill();
    }
  }

  void fill(){
    html.classes.add(FILL);
  }
  
  void unfill(){
    html.classes.remove(FILL);
  }
  
  void setSize(String width, String minWidth, String maxWidth, String height, String minHeight, String maxHeight){
    html.style
    ..width = width
    ..minWidth = minWidth
    ..maxWidth = maxWidth
    ..height = height
    ..minHeight = minHeight
    ..maxHeight = maxHeight;
  }

  bool get isOnPage{
    if(isStaged){
      return false;
    }
    Element el = html;
    while(el.parent != null){
      el = el.parent;
      if(el == document.body){
        return true;
      }
    }
    return false;
  }

  bool get isStaged => html.parent == _controlsAndPanelsStagingElement;

  void stage(){
    if(_controlsAndPanelsStagingElement.parent != document.body){
      document.body.children.add(_controlsAndPanelsStagingElement);
    }
    _controlsAndPanelsStagingElement.children.add(html);
  }

  static final Style _baseStyle = new Style('''

    .$CLASS
    {
      position: relative;
      display: inline-block;
      font-family: verdana, arial, sans-serif;
      margin: 0;
      border: 0;
      padding: 0;
      overflow: hidden;
    }

    .$CLASS.$FILL
    {
      width: 100%;
      height: 100%;
    }

  ''');
}

