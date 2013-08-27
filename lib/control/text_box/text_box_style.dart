/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement textBoxStyleElement = new Element.html('''

<style>

  .$BASE.$CONTROL.$TEXT_BOX
  {
    border: 1px solid #888;
    padding: 5px;
  }

  .$BASE.$CONTROL.$TEXT_BOX.$WATERMARK
  {
    color: #999;
  }

</style>

''');


void _insertTextBoxStyleElement(){

  if(textBoxStyleElement.parent != document.head){

    document.head.children.add(textBoxStyleElement);

  }

}