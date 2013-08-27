/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String SIZER_PANEL = 'sizer-panel';
const String LEFT = 'left';
const String RIGHT = 'right';
const String TOP = 'top';
const String BOTTOM = 'bottom';
const String H_CENTER = 'h-center';
const String V_CENTER = 'v-center';
const String CENTER = 'center';


class SizerPanel extends Panel{


  SizerPanel(String widthStyle, String heightStyle){

    _insertSizerPanelStyleElement();

    html.style.width = widthStyle;

    html.style.height = heightStyle;

    html.classes.add(SIZER_PANEL);

  }


  String _horizontalAlignment;


  String get horizontalAlignment => _horizontalAlignment != H_CENTER ? _horizontalAlignment : CENTER;


  void set horizontalAlignment(String alignment){

    html.classes.remove(_horizontalAlignment);

    _horizontalAlignment = alignment == CENTER ? H_CENTER : alignment;

    html.classes.add(_horizontalAlignment);

      if(_horizontalAlignment == H_CENTER){

      //TODO IMPLEMENT manual rect calculation to position child in center
      //NB this only makes sense for sizers which are of constant absolute size

    }

  }


  String _verticalAlignment;


  String get verticalAlignment => _verticalAlignment != V_CENTER ? _verticalAlignment : CENTER;


  void set verticalAlignment(String alignment){

    html.classes.remove(_verticalAlignment);

    _verticalAlignment = alignment == CENTER ? V_CENTER : alignment;

    html.classes.add(_verticalAlignment);

    if(_verticalAlignment == V_CENTER){

      //TODO IMPLEMENT manual rect calculation to position child in center
      //NB this only makes sense for sizers which are of constant absolute size

    }

  }


  void add(Base base){

    if(children.length == 0){

      children.add(base);

      html.children.add(base.html);

    }

  }


  void insert(int index, Base base){

    if(index == 0){

      add(base);

    }

  }


  bool remove(Base base){

    html.children.remove(base.html);

    children.remove(base);

  }


  Base removeAt(int index){

    if(index == 0 && children.length == 1){

      var base = children.removeAt(0);

      html.children.remove(base.html);

      return base;

    }

    return null;

  }


}