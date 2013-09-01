/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

final StyleElement tooltipStyleElement = new Element.html('''

<style>

  .$BASE.$CONTROL.$POP_OVER
  {
    
  }

</style>

''');


void _insertPopOverStyleElement(){

  if(tooltipStyleElement.parent != document.head){

    document.head.children.add(tooltipStyleElement);

  }

}