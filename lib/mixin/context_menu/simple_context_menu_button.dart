/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String SIMPLE_CONTEXT_MENU_BUTTON = 'simple-context-menu-button';


class SimpleContextMenuButton extends Button{


  factory SimpleContextMenuButton(String iconPath, String label, Func_Control_void clickCallback){

    return new Button.iconText(iconPath, label, iconWidth: 20, iconHeight: 20)
    ..html.classes.add(SIMPLE_CONTEXT_MENU_BUTTON);

  }


}



final Style _simpleContextMenuButtonStyle = new Style('''

  .SIMPLE_CONTEXT_MENU_BUTTON
  {
    background: rgba(0,0,0,0);
    padding: 0;
    width: 100%;
    border-radius: 0;
  }

  .SIMPLE_CONTEXT_MENU_BUTTON:hover
  {
    background: rgba(0,0,0,0.15);
  }

  .SIMPLE_CONTEXT_MENU_BUTTON:active
  {
    background: rgba(0,0,0,0.3);
  }

  .SIMPLE_CONTEXT_MENU_BUTTON
    > .$CONTROL_CONTENT_ELEMENT
      > .$STACK_PANEL
        > .$IMAGE
  {
    padding: 4px;
    border-right: 1px solid #999;
  }

  .SIMPLE_CONTEXT_MENU_BUTTON
    > .$CONTROL_CONTENT_ELEMENT
      > .$STACK_PANEL
        > .$LABEL
  {
    padding: 4px 10px;
  }

''');