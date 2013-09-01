/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement sizerPanelStyleElement = new Element.html('''

<style>

  .$BASE.$PANEL.$SIZER_PANEL
  {
    display: table;
  }

  .$BASE.$PANEL.$SIZER_PANEL > .$SIZER_LAYOUT_ASSISTANT > .$BASE
  {
    float: none;
  }

  .$BASE.$PANEL.$SIZER_PANEL > .$SIZER_LAYOUT_ASSISTANT
  {
    display: table-cell;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$LEFT > .$SIZER_LAYOUT_ASSISTANT
  {
    text-align: left;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$RIGHT > .$SIZER_LAYOUT_ASSISTANT
  {
    text-align: right;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$H_CENTER > .$SIZER_LAYOUT_ASSISTANT
  {
    text-align: center;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$TOP > .$SIZER_LAYOUT_ASSISTANT
  {
    vertical-align: top;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$BOTTOM > .$SIZER_LAYOUT_ASSISTANT
  {
    vertical-align: bottom;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$V_CENTER > .$SIZER_LAYOUT_ASSISTANT
  {
    vertical-align: middle;
  }

</style>

''');


void _insertSizerPanelStyleElement(){

  if(sizerPanelStyleElement.parent != document.head){

    document.head.children.add(sizerPanelStyleElement);

  }

}