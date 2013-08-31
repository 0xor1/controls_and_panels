/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

final StyleElement imageStyleElement = new Element.html('''

<style>

  .$IMAGE > img
  {
    display: block;
  }

</style>

''');


void _insertImageStyleElement(){

  if(imageStyleElement.parent != document.head){

    document.head.children.add(imageStyleElement);

  }

}