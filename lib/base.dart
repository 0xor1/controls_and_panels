/*
 * 0xor1 http://github.com/0xor1
 */

part of controls_and_panels;


const String BASE = 'base';


abstract class Base{


  final Element html = new DivElement();


  Base(){

    _insertStyle(_baseStyle);

    html.classes.add(BASE);

  }


  bool isOnPage(){

    Element el = html;

    while(el.parent != null){

      el = el.parent;

      if(el == document.body){

        return true;

      }

    }

    return false;

  }


}



final Style _baseStyle = new Style('''

  .$BASE
  {
    display: inline-block;
    font-family: verdana, arial, sans-serif;
    margin: 0;
    border: 0;
    padding: 0;
    overflow: visible; /*for popups eg. tooltips and combobox drop downs*/
  }

''');