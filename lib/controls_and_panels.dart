/*
 * 0xor1  http://github.com/0xor1
 */


library controls_and_panels;


import 'dart:html';
import 'dart:async';


part 'base.dart';
part 'control.dart';
part 'panel.dart';

part 'control/label.dart';
part 'control/image.dart';
part 'control/button.dart';
part 'control/combo_box.dart';
part 'control/text_box.dart';
part 'control/text_area.dart';
part 'control/pop_over.dart';
part 'control/pop_over/context_menu.dart';


part 'panel/sizer_panel.dart';
part 'panel/stack_panel.dart';


typedef PopOver Func_Control_PopOver(Control control);


const String CONTROLS_AND_PANELS_STYLE_ELEMENT_ID = 'controls-and-panels-style-element-id';


class Style{
  bool hasBeenInserted = false;
  String text;
  Style(String this.text);
}


void _insertStyle(Style style){

  if(_controlsAndPanelsStyleElement.parent != document.head){

    document.head.children.add(_controlsAndPanelsStyleElement);

  }

  if(!style.hasBeenInserted){

    _controlsAndPanelsStyleElement.text += style.text;

    style.hasBeenInserted = true;

  }

}


final StyleElement _controlsAndPanelsStyleElement = new StyleElement()..id = CONTROLS_AND_PANELS_STYLE_ELEMENT_ID;