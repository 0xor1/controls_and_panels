/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String CONTEXT_MENU = 'context-menu';


class ContextMenu extends PopOver{


  Control target;

  ContextMenu(Control target, Base content):
    super(content){

    _insertStyle(_contextMenuStyle);

    this.target = target;

    html.classes.add(CONTEXT_MENU);

    html.onMouseLeave.listen((MouseEvent event){
      hide();
    });

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