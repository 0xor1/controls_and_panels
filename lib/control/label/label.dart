/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String label = 'label';

class Label extends Control{

  String get text => html.text;

  void set text (String text){html.text = text;}

  Label(String text):
    super(){

    this.text = text;

    html.classes.add(label);

  }

}