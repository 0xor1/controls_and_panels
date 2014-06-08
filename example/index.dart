/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

import 'package:controls_and_panels/controls_and_panels.dart';
import 'example.dart';

void main(){

  var peaceImgPath = 'resource/image/peace_dove_icon.svg';

  document.body.append((
    new DesktopApp(
      new StackPanel(
        Orientation.HORIZONTAL, [
          new Image(peaceImgPath, width: 50, height: 50),
          new Label('Peace')]),
      'Controls & Panels')
    ..registerModule('cmdln', new StackPanel(Orientation.HORIZONTAL)..fill(),
        new CommandLine()..setSize('100%', '100%'))).html);

  /*document.body.append((
    new CommandLine()
    ..setSize('100%', '100%')).html);*/
}
