/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

import 'package:controls_and_panels/controls_and_panels.dart';

const String stripeImg = 'resource/image/stripe.png';

void main(){

  document.body.append((
    new PagePanel(new CommandLine()..fill())
    ..float(
      new Button.text('hi'),
      new Image(stripeImg), 'window', 200, 200, 200, 200)).html);

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