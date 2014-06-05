/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

import 'package:controls_and_panels/controls_and_panels.dart';
import 'example.dart';

void main(){

  var peaceImgPath = 'resource/image/peace_dove_icon.svg';

  document.body.append(
    (new StackPanel(Orientation.VERTICAL, [
      new Header(
        new StackPanel(Orientation.HORIZONTAL, [
          new Image(peaceImgPath, width: 50, height: 50),
          new Label('Peace')]),
        'Controls & Panels'),
      new StackPanel(Orientation.HORIZONTAL)
      ..setSize('100%', '45px')
      ..style.background = '#e0e1dd'])
    ..fill()).html);

}
