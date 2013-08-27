/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement baseStyleElement = new Element.html('''

<style>

  .$BASE
  {
    display: inline-block;
    position: relative;
    float: left;
    margin: 0;
    border: 0;
    padding: 0;
    overfow: visible; /*for popups eg. combobox*/
  }

</style>

''');


void _insertBaseStyleElement(){

  if(baseStyleElement.parent != document.head){

    document.head.children.add(baseStyleElement);

  }

}