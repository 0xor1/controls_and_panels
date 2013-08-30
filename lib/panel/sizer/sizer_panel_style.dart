/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement sizerPanelStyleElement = new Element.html('''

<style>

  .$BASE.$PANEL.$SIZER_PANEL
  {
    /*Nothing required*/
  }

  .$BASE.$PANEL.$SIZER_PANEL > .$BASE
  {
    position: absolute;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$LEFT > .$BASE
  {
    left: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$RIGHT > .$BASE
  {
    right: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$TOP > .$BASE
  {
    top: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$BOTTOM > .$BASE
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