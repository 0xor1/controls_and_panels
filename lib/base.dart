/*
 * 0xor1 http://github.com/0xor1
 */

part of controls_and_panels;

const String BASE = 'base';

abstract class Base{


  final Element _html = new DivElement();


  Element get html => _html;


  Base(){

    _insertBaseStyleElement();

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