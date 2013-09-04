/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String POP_OVER = 'pop-over';

class PopOver extends Control{

  PopOver(Base base):
    super(){

    _insertPopOverStyleElement();

    html.children.add(base.html);

    html.classes.add(POP_OVER);

  }

  void hide(){

    if(html.parent != null){

      html.parent.children.remove(html);

    }

  }

  void show(Base base, { int left: null, int top: null, int right: null, int bottom: null }){

    html.style.left = left != null? '${left}px' : '';
    html.style.top = top != null? '${top}px' : '';
    html.style.right = right != null? '${right}px' : '';
    html.style.bottom = bottom != null? '${bottom}px' : '';

    base.html.children.add(html);

  }

}