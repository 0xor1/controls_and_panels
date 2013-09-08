/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String BUTTON = 'button';

class Button extends Control{


  Stream<MouseEvent> get onClick => html.onClick;


  Base content;


  Button(Base base){

    _insertStyle(_buttonStyle);

    content = base;

    controlContentElement.children.add(base.html);

    html.classes.add(BUTTON);

  }


}



final Style _buttonStyle = new Style('''

  .$BASE.$CONTROL.$BUTTON
  {
    white-space: nowrap;
    font-size: 0;
    transition: background 0.3s;
    background: #999;
    border-radius: 3px;
    padding: 2px 4px;
    cursor: pointer;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: -moz-none;
    -ms-user-select: none;
    user-select: none;
  }

  .$BASE.$CONTROL.$BUTTON:hover
  {
    background: #ccc;
  }

  .$BASE.$CONTROL.$BUTTON:active
  {
    background: #eee;
  }

  .$BASE.$CONTROL.$BUTTON > .$BASE
  {
    word-spacing: normal;
    font-size: 16px;
  }

''');