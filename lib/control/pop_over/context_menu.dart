/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String CONTEXT_MENU = 'context-menu';


class ContextMenu extends PopOver{


  Control control;


  ContextMenu(Control owner, Base content):
    super(content){

    control = owner;

    html.classes.add(CONTEXT_MENU);

    html.onMouseLeave.listen((MouseEvent event){
      if(event.target == html){
        hide();
      }/*else if(
          event.offsetX > html.clientWidth ||
          event.offsetY > html.clientHeight ||
          event.offsetX < 0 ||
          event.offsetY < 0 ){
        hide();
      }*/
    });

  }


}