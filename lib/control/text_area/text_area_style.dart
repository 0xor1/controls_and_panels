/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement textAreaStyleElement = new Element.html('''

<style>

  .$BASE.$CONTROL.$TEXT_AREA > textarea
  {
    margin: 0;
    border: 1px solid #888;
    padding: 5px;
  }

</style>

''');


void _insertTextAreaStyleElement(){

  if(textAreaStyleElement.parent != document.head){

    document.head.children.add(textAreaStyleElement);

  }

}