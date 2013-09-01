/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;


final StyleElement baseStyleElement = new Element.html('''

<style>

  .$BASE
  {
    display: inline-block;
    position: relative;
    float: left;
    font-family: verdana, arial, sans-serif;
    margin: 0;
    border: 0;
    padding: 0;
    overflow: visible; /*for popups eg. tooltips and combobox drop downs*/
  }

</style>

''');


void _insertBaseStyleElement(){

  if(baseStyleElement.parent != document.head){

    document.head.children.add(baseStyleElement);

  }

}