/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String SIMPLE_DROP_DOWN = 'simple-dropc-down';


class SimpleDropDown extends Control{

  
  SimpleDropDown(Base content):
  super(){

    _insertStyle(_simpleDropDownStyle);

    controlContentElement.children.add(content.html);

    html.classes.add(SIMPLE_DROP_DOWN);

  }


}



final Style _simpleDropDownStyle = new Style('''

  .$SIMPLE_DROP_DOWN
  {
    border: 1px solid #eee;
    background: #fff;
    box-shadow: 5px 5px 5px #888;
  }

  .$SIMPLE_DROP_DOWN > .$CONTROL_CONTENT_ELEMENT > .$BASE
  {
    display: block;
  }

''');