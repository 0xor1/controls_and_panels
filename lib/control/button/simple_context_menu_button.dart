/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String SIMPLE_CONTEXT_MENU_BUTTON = 'simple-context-menu-button';


class SimpleContextMenuButton extends Button{


  Image icon;
  
  
  Label text;
  
  
  SimpleContextMenuButton(String iconPath, String label, Func_MouseEvent_void clickCallback):
  super(){

    _insertStyle(_simpleContextMenuButtonStyle);
    
    icon = new Image(iconPath, width: 20, height: 20);
    text = new Label(label);
    
    content = new StackPanel.horizontal([icon,text]);
    
    onClick.listen(clickCallback);
    
    html.classes.add(SIMPLE_CONTEXT_MENU_BUTTON);

  }


}



final Style _simpleContextMenuButtonStyle = new Style('''

  .$SIMPLE_CONTEXT_MENU_BUTTON
  {
    background: rgba(0,0,0,0);
    padding: 0;
    width: 100%;
    border-radius: 0;
  }

  .$SIMPLE_CONTEXT_MENU_BUTTON:hover
  {
    background: rgba(0,0,0,0.15);
  }

  .$SIMPLE_CONTEXT_MENU_BUTTON:active
  {
    background: rgba(0,0,0,0.3);
  }

  .$SIMPLE_CONTEXT_MENU_BUTTON
    > .$CONTROL_CONTENT_ELEMENT
      > .$STACK_PANEL
        > .$IMAGE
  {
    padding: 4px;
    border-right: 1px solid #eee;
  }

  .$SIMPLE_CONTEXT_MENU_BUTTON
    > .$CONTROL_CONTENT_ELEMENT
      > .$STACK_PANEL
        > .$LABEL
  {
    padding: 4px 10px;
  }

''');