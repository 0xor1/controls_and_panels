/*
 * 0xor1 http://github.com/0xor1
 */

part of controls_and_panels;


const String BASE = 'base';


abstract class Base{


  final Element html = new DivElement();


  void set width(String width){

    html.style.width = width;

  }


  void set maxWidth(String width){

    html.style.maxWidth = width;

  }


  void set minWidth(String width){

    html.style.minWidth = width;

  }


  void set height(String height){

    html.style.height = height;

  }


  void set maxHeight(String height){

    html.style.maxHeight = height;

  }


  void set minHeight(String height){

    html.style.minHeight = height;

  }


  void set overflow(String overflow){

    html.style.overflow = overflow;

  }


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