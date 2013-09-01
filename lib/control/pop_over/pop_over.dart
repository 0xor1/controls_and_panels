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

}