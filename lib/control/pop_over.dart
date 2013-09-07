/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String POP_OVER = 'pop-over';

class PopOver extends Control{

  PopOver(Base base):
    super(){

    _insertStyle(_popOverStyle);

    html.children.add(base.html);

    html.classes.add(POP_OVER);

  }

  void hide(){

    if(html.parent != null){

      html.parent.children.remove(html);

    }

  }

  void show(Control owner, { int left: null, int top: null}){

    html.style.top = '${top}px';

    html.style.left = '${left}px';

    owner._popOverLayoutAssistant.children.add(html);

  }

}



final Style _popOverStyle = new Style('''

  .$BASE.$CONTROL.$POP_OVER
  {
    position: absolute;
    background: #fff;
    border: 1px solid #00f;
  }

''');