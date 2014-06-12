/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

import 'package:controls_and_panels/controls_and_panels.dart';

const String stripeImg = 'resource/image/stripe.png';
const String peaceImg = 'resource/image/peace.png';

void main(){

  document.body.append((
    new PagePanel(new CommandLine()..fill())
    ..float(
      new Button.text('hi'),
      new Image(peaceImg)..style.marginRight = '5px', 'a_window', 300, 300, 200, 200)).html);

  _insertCustomStyles();
}

void _insertCustomStyles(){
  document.head.appendHtml('''
    <style id='cnp-example-custom-styles'>
      .${Window.CLASS}
      {
        background: url($stripeImg);
      }
    </style>
  ''');
}