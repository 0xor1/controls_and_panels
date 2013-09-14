/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String SIMPLE_CONTEXT_MENU = 'simple-context-menu';


class SimpleContextMenu extends Control{

  
  SimpleContextMenu(List<List<Control>> buttonGroups):
  super(){

    _insertStyle(_simpleContextMenuStyle);

    StackPanel contextStack = new StackPanel<Button>.vertical();
    
    Splitter lastSplitter;

    for(var buttonList in buttonGroups){

      for(var button in buttonList){

        contextStack.add(button as SimpleContextMenuButton);

      }

      lastSplitter = contextStack.addSplitter(lineColor: '#eee');

    }
    
    contextStack.remove(lastSplitter);

    controlContentElement.children.add(contextStack.html);

    html.classes.add(SIMPLE_CONTEXT_MENU);

  }


}



final Style _simpleContextMenuStyle = new Style('''

  .$SIMPLE_CONTEXT_MENU
  {
    border: 1px solid #eee;
    background: #fff;
    box-shadow: 5px 5px 5px #888;
  }

  .$SIMPLE_CONTEXT_MENU > .$CONTROL_CONTENT_ELEMENT > .$BASE
  {
    display: block;
  }

''');