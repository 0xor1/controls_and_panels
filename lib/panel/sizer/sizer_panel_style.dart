/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement sizerPanelStyleElement = new Element.html('''

<style>

  .$BASE.$PANEL.$SIZER_PANEL
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
  {
    display: table;
    width: 100%;
    height: 100%;
    margin: 0;
    border: 0;
    padding: 0;
  }

  .$BASE.$PANEL.$SIZER_PANEL
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    display: table-cell;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$LEFT
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    text-align: left;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$RIGHT
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    text-align: right;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$H_CENTER
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    text-align: center;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$TOP
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    vertical-align: top;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$BOTTOM
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
  {
    vertical-align: bottom;
  }

  .$BASE.$PANEL.$SIZER_PANEL.$V_CENTER
    > .$SIZER_OUTER_LAYOUT_ASSISTANT
      > .$SIZER_INNER_LAYOUT_ASSISTANT
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