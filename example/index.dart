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
      'printArgs',
      'prints all the arguments passed to it',
      (CommandLine cmdLn, List<String> posArgs, Map<String, String> namArgs){
        cmdLn.enterText('posArgs=$posArgs');
        cmdLn.enterText('namArgs=$namArgs');
      }),
    new CommandLineBinding(
      'src',
      'prints a link to where the source code for this package can be found',
      (CommandLine cmdLn, List<String> posArgs, Map<String, String> namArgs){
        cmdLn.enterElement(new AnchorElement()..href='http://github.com/0xor1/controls_and_panels'..text='github repository');
      }),
    new CommandLineBinding(
      'embed',
      'embeds a valid HTML string into the command line history feed. the HTML must have a single root element.',
      (CommandLine cmdLn, List<String> posArgs, Map<String, String> namArgs){
        if(posArgs.length > 0){
          cmdLn.enterHtml(posArgs[0]);
        }
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