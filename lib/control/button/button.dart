/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String BUTTON = 'button';

class Button extends Control{


  Stream<MouseEvent> get onClick => html.onClick;


  Base content;


  Button(Base base){

    _insertButtonStyleElement();

    content = base;

    html.children.add(base.html);

    html.classes.add(BUTTON);

  }


}