/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String TOOLTIP = 'tooltip';

class Tooltip extends Control{

  Tooltip(Base base):
    super(){

    _insertTooltipStyleElement();

    html.children.add(base.html);

    html.classes.add(TOOLTIP);

  }

}