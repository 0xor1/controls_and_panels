/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String CONTEXT_MENU = 'context-menu';


class ContextMenu extends PopOver{

  ContextMenu(List<List<Button>> buttonGroups):
    super(content:new StackPanel<Button>.vertical(buttonGroups.first)){

    _insertStyle(_contextMenuStyle);

    html.classes.add(CONTEXT_MENU);

    html.onClick.listen((MouseEvent event){
      hide();
    });

  }


}



final Style _contextMenuStyle = new Style('''

  .$BASE.$CONTROL.$POP_OVER.$CONTEXT_MENU
  {
    border: 1px solid #999;
  }

''');