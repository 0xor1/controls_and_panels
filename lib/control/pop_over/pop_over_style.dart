/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String POP_OVER_STYLE_ELEMENT = 'pop-over-style-element';

final StyleElement popOverStyleElement = new Element.html('''

<style id='$POP_OVER_STYLE_ELEMENT'>

  .$BASE.$CONTROL.$POP_OVER
  {
    position: absolute;
  }

</style>

''');


void _insertPopOverStyleElement(){

  if(popOverStyleElement.parent != document.head){

    document.head.children.add(popOverStyleElement);

  }

}