/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String LABEL = 'label';

const String TEXT = 'text';


class Label extends Control{

  final SpanElement _textElement = new SpanElement()
  ..classes.add(TEXT);


  static final Func_Control_PopOver _createContextMenu = (Control control){
    return new ContextMenu(
        control,
        new StackPanel.vertical([
          new Label('context-item-1'),
          new Label('context-item-2')]));
  };


  String get text => _textElement.text;


  void set text (String text){_textElement.text = text;}


  Label(String text):
    super(createContextMenu: Label._createContextMenu){

    //_insertStyle(_labelStyle);

    controlContentElement.children.add(_textElement);

    this.text = text;

    html.classes.add(LABEL);

  }


}



final Style _labelStyle = new Style('''

  .$BASE.$CONTROL.$LABEL 
  {
    white-space: nowrap;
  }

''');