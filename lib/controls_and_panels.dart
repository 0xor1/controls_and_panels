/*
 * 0xor1  http://github.com/0xor1
 */

library controls_and_panels;

import 'dart:html';
import 'dart:async';

part 'base.dart';
part 'base_style.dart';

part 'control/control.dart';
part 'control/label/label.dart';
part 'control/button/button.dart';
part 'control/button/button_style.dart';
part 'control/combo_box/combo_box.dart';
part 'control/combo_box/combo_box_style.dart';
part 'control/text_box/text_box.dart';
part 'control/text_box/text_box_style.dart';

part 'panel/panel.dart';
part 'panel/sizer/sizer_panel.dart';
part 'panel/sizer/sizer_panel_style.dart';
part 'panel/stack/stack_panel.dart';
part 'panel/stack/stack_panel_style.dart';

typedef void FuncStringVoid(String str);