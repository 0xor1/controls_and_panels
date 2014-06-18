/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

import 'package:controls_and_panels/controls_and_panels.dart';

const String stripeImg = 'resource/image/stripe.png';
const String peaceImg = 'resource/image/peace.png';

void main(){

  var cmdLn = new CommandLine()..fill();
  var cmdLnInputBinder = new CommandLineInputBinder(cmdLn);

  cmdLnInputBinder.addAll([
    new CommandLineBinding(
      'echo',
      'repeats its first positional argument and will ingore any further arguments',
      (CommandLine cmdLn, List<String> posArgs, Map<String, String> namArgs){
        cmdLn.writeEntry(posArgs[0]);
      }),
    new CommandLineBinding(
      'src',
      'prints the url of where the source code for this package can be found',
      (CommandLine cmdLn, List<String> posArgs, Map<String, String> namArgs){
        cmdLn.writeEntry('http://github.com/0xor1/controls_and_panels"');
      })]);

  document.body.append(new PagePanel(cmdLn).html);

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