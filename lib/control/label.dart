/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String LABEL = 'label';


class Label extends Control{


  static final Func_Control_PopOver _getContextMenu = (Control control){
    return new ContextMenu(
        control,
        new StackPanel.vertical([
          new Label('context-item-1'),
          new Label('context-item-2')]));
  };


  String get text => html.text;


  void set text (String text){html.text = text;}


  Label(String text):
    super(){

    _insertStyle(_labelStyle);

    createContextMenu = Label._getContextMenu;

    this.text = text;

    html.classes.add(LABEL);

  }


}



final Style _labelStyle = new Style('''

  .$BASE.$LABEL
  {
    white-space: nowrap;
  }

''');