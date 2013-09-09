/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String BUTTON = 'button';
const String TEXT_BUTTON = 'text-button';
const String ICON_TEXT_BUTTON = 'icon-text-button';
const String CONTEXT_MENU_BUTTON = 'context-menu-button';


class Button extends Control with ContextMenuUsage{


  Stream<MouseEvent> get onClick => html.onClick;


  Base content;


  static final Func_Control_List_t_Button_t _createContextMenuButtons = (Control control){
    var lorem = LOREM_IPSUM.split(' ');
    var loremLength = lorem.length;
    return new List<Button>()
    ..add(new Button.contextMenu('resource/image/peace_dove_icon.svg', lorem[0], iconWidth: 20 , iconHeight: 20)
      ..onClick.listen((MouseEvent event){print(control.controlId);}))
    ..add(new Button.contextMenu('resource/image/peace_dove_icon.svg', lorem[1], iconWidth: 20 , iconHeight: 20)
      ..onClick.listen((MouseEvent event){window.alert(control.controlId.toString());}));
  };


  Button(Base base){

    _insertStyle(_buttonStyle);

    initialiseContextMenuUsage(_createContextMenuButtons);

    content = base;

    controlContentElement.children.add(base.html);

    html.classes.add(BUTTON);

  }


  factory Button.text(String text){

    return  new Button(new Label(text))
    ..html.classes.add(TEXT_BUTTON);

  }


  factory Button.icon(String iconPath, {int iconWidth: null, int iconHeight: null}){

    return  new Button(new Image(iconPath, width: iconWidth, height: iconHeight))
    ..html.classes.add(TEXT_BUTTON);

  }


  factory Button.iconText(String iconPath, String text, {int iconWidth: null, int iconHeight: null}){

    return new Button(new StackPanel.horizontal([
      new Image(iconPath, width: iconWidth, height: iconHeight),
      new Label(text)]))
      ..html.classes.add(ICON_TEXT_BUTTON);

  }

  //TODO - review - may want to extend button and create a ContextMenuButton type.
  factory Button.contextMenu(String iconPath, String text, {int iconWidth: null, int iconHeight: null}){

    return new Button.iconText(iconPath, text, iconWidth: iconWidth, iconHeight: iconHeight)
    ..html.classes.add(CONTEXT_MENU_BUTTON);

  }


}



final Style _buttonStyle = new Style('''

  .$BASE.$CONTROL.$BUTTON
  {
    white-space: nowrap;
    font-size: 0;
    transition: background 0.3s;
    background: #aaa;
    border-radius: 3px;
    padding: 2px 4px;
    cursor: pointer;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: -moz-none;
    -ms-user-select: none;
    user-select: none;
  }

  .$BASE.$CONTROL.$BUTTON:hover
  {
    background: #ddd;
  }

  .$BASE.$CONTROL.$BUTTON:active
  {
    background: #fff;
  }

  .$BASE.$CONTROL.$BUTTON > .$BASE
  {
    word-spacing: normal;
    font-size: 16px;
  }


  .$BASE.$CONTROL.$BUTTON.$CONTEXT_MENU_BUTTON
  {
    background: rgba(0,0,0,0);
    padding: 0;
  }

  .$BASE.$CONTROL.$BUTTON.$CONTEXT_MENU_BUTTON:hover
  {
    background: rgba(0,0,0,0.15);
  }

  .$BASE.$CONTROL.$BUTTON.$CONTEXT_MENU_BUTTON:active
  {
    background: rgba(0,0,0,0.3);
  }

  .$BASE.$CONTROL.$BUTTON.$CONTEXT_MENU_BUTTON
    > .$CONTROL_CONTENT_ELEMENT
      > .$BASE.$PANEL.$STACK_PANEL
        > .$BASE.$CONTROL.$IMAGE
  {
    padding: 4px;
    border-right: 1px solid #999;
  }

  .$BASE.$CONTROL.$BUTTON.$CONTEXT_MENU_BUTTON
    > .$CONTROL_CONTENT_ELEMENT
      > .$BASE.$PANEL.$STACK_PANEL
        > .$BASE.$CONTROL.$LABEL
  {
    padding: 4px 10px;
  }

''');