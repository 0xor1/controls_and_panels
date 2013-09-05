/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String CONTEXT_MENU = 'context-menu';


class ContextMenu extends PopOver{


  ContextMenu(Base base):
    super(base){

    html.classes.add(CONTEXT_MENU);

  }


}