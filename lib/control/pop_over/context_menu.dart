/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String CONTEXT_MENU = 'context-menu';


class ContextMenu extends PopOver{

  ContextMenu(List<List<Button>> buttonGroups):
  super(){

    _insertStyle(_contextMenuStyle);

    var contextStack = new StackPanel<Button>.vertical();

    for(var buttonList in buttonGroups){

      for(var button in buttonList){

        contextStack.add(button);

      }

      //add in a region splitter here

    }

    controlContentElement.children.add(contextStack.html);

    html.classes.add(CONTEXT_MENU);

    html.onClick.listen((MouseEvent event){

      hide();

    });

  }


}



final Style _contextMenuStyle = new Style('''

  .$CONTEXT_MENU
  {
    border: 1px solid #999;
  }

  .$CONTEXT_MENU > .$CONTROL_CONTENT_ELEMENT > .$BASE
  {
    display: block;
  }

''');