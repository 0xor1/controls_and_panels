/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String SIMPLE_CONTEXT_MENU = 'simple-context-menu';


class SimpleContextMenu extends Control{

  SimpleContextMenu(List<List<Button>> buttonGroups):
  super(){

    _insertStyle(_simpleContextMenuStyle);

    var contextStack = new StackPanel<Button>.vertical();

    for(var buttonList in buttonGroups){

      for(var button in buttonList){

        contextStack.add(button);

      }

      //add in a region splitter here

    }

    controlContentElement.children.add(contextStack.html);

    html.classes.add(SIMPLE_CONTEXT_MENU);

  }


}



final Style _simpleContextMenuStyle = new Style('''

  .$SIMPLE_CONTEXT_MENU
  {
    border: 1px solid #999;
    background: #fff;
    box-shadow: 5px 5px 5px #888;
  }

  .$SIMPLE_CONTEXT_MENU > .$CONTROL_CONTENT_ELEMENT > .$BASE
  {
    display: block;
  }

''');