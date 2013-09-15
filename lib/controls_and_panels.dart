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
part 'control/splitter.dart';
part 'control/simple_context_menu.dart';
part 'control/button/simple_context_menu_button.dart';


part 'panel/sizer_panel.dart';
part 'panel/stack_panel.dart';


part 'mixin/context_menu/context_menu.dart';


typedef List<Control> Func_Control_List$Control$(Control control);


typedef Control Func_List$List$Control$$_Control(List<List<Control>> controlGroups);


typedef void Func_Control_void(Control control);


typedef void Func_MouseEvent_void(MouseEvent event);


const String CONTROLS_AND_PANELS_STYLE_ELEMENT_ID = 'controls-and-panels-style-element-id';


final StyleElement _controlsAndPanelsStyleElement = new StyleElement()..id = CONTROLS_AND_PANELS_STYLE_ELEMENT_ID;


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


bool xIsOnLeftHalfOfWindowViewport(int x){ 
  
  return x - window.screenX - window.pageXOffset <= window.innerWidth * 0.5;
  
}


bool yIsOnTopHalfOfWindowViewport(int y){
  
  return y - window.screenY - window.pageYOffset <= window.innerHeight * 0.5;
  
}