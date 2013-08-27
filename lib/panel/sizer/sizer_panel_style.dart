/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement sizerPanelStyleElement = new Element.html('''

<style>

  .$BASE.$PANEL.$SIZER_PANEL > *
  {
    position: absolute;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$LEFT > *
  {
    left: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$RIGHT > *
  {
    right: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$TOP > *
  {
    top: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$BOTTOM > *
  {
    bottom: 0;
  }

</style>

''');


void _insertSizerPanelStyleElement(){

  if(sizerPanelStyleElement.parent != document.head){

    document.head.children.add(sizerPanelStyleElement);

  }

}