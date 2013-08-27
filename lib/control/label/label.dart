/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String label = 'label';

class Label extends Control{

  String get text => _span.text;

  void set text (String text){_span.text = text;}

  SpanElement _span = new SpanElement();

  Label(String text):
    super(){

    this.text = text;

    html.children.add(_span);

    html.classes.add(label);

  }

}