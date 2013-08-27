/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement comboBoxStyleElement = new Element.html('''

<style>

  .$BASE.$CONTROL.$COMBO_BOX
  {
    
  }

</style>

''');


void _insertComboBoxStyleElement(){

  if(comboBoxStyleElement.parent != document.head){

    document.head.children.add(comboBoxStyleElement);

  }

}