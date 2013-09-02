/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

final StyleElement stackPanelStyleElement = new Element.html('''

<style>

  .$BASE.$PANEL.$STACK_PANEL.$VERTICAL > .$BASE
  {
    clear: left;
    float: left;
  }

  
  .$BASE.$PANEL.$STACK_PANEL.$HORIZONTAL
  {
    white-space: nowrap;
    font-size: 0;
  }

  .$BASE.$PANEL.$STACK_PANEL.$HORIZONTAL > .$BASE
  {
    word-spacing: normal;
    vertical-align: middle;
    font-size: 16px;
  }

</style>

''');


void _insertStackPanelStyleElement(){

  if(stackPanelStyleElement.parent != document.head){

    document.head.children.add(stackPanelStyleElement);

  }

}