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
    word-spacing: -1em;
  }

</style>

''');


void _insertStackPanelStyleElement(){

  if(stackPanelStyleElement.parent != document.head){

    document.head.children.add(stackPanelStyleElement);

  }

}