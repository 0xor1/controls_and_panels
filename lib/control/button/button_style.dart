/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

final StyleElement buttonStyleElement = new Element.html('''

<style>

  .$BASE.$CONTROL.$BUTTON
  {
    transition: background 0.3s;
    background: #999;
    border-radius: 3px;
    padding: 2px 4px;
    cursor: pointer;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: -moz-none;
    -ms-user-select: none;
    user-select: none;
  }

  .$BASE.$CONTROL.$BUTTON:hover
  {
    background: #ccc;
  }

  .$BASE.$CONTROL.$BUTTON:active
  {
    background: #eee;
  }

</style>

''');


void _insertButtonStyleElement(){

  if(buttonStyleElement.parent != document.head){

    document.head.children.add(buttonStyleElement);

  }

}