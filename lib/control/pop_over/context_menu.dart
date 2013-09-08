/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String CONTEXT_MENU = 'context-menu';


class ContextMenu extends PopOver{


  Control target;

  ContextMenu(Control target, Base content):
    super(content){

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