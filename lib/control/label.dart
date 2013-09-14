/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String LABEL = 'label';


const String TEXT = 'text';


class Label extends Control with ContextMenu{


  final SpanElement _textElement = new SpanElement()
  ..classes.add(TEXT);


  static final Func_Control_List$Control$ _createContextMenuButtons = (Control control){

    return new List<SimpleContextMenuButton>()
    ..add(new SimpleContextMenuButton('resource/image/peace_dove_icon.svg', 'lorem', (MouseEvent event){
      window.alert('Label - lorem - ${control.controlId.toString()}');
    }))
    ..add(new SimpleContextMenuButton('resource/image/peace_dove_icon.svg', 'ipsum', (MouseEvent event){
      window.alert('Label - ipsum - ${control.controlId.toString()}');
    }));
  };


  String get text => _textElement.text;


  void set text (String text){_textElement.text = text;}


  Label(String text):
  super(){

    _insertStyle(_labelStyle);

    initialiseSimpleContextMenu(_createContextMenuButtons);

    controlContentElement.children.add(_textElement);

    this.text = text;

    html.classes.add(LABEL);

  }


}



final Style _labelStyle = new Style('''

  $LABEL 
  {
    white-space: nowrap; /* I think this is unnecessary */
  }

''');