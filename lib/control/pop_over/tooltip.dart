/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String TOOLTIP = 'tooltip';


class Tooltip extends PopOver{


  Control target;


  Tooltip(Control target, Base content):
    super(content){

    _insertStyle(_tooltipStyle);

    this.target = target;

    html.classes.add(TOOLTIP);

    html.onMouseLeave.listen((MouseEvent event){
      hide();
    });

    target.html.onMouseMove.listen((MouseEvent event){
      hide();
    });

  }


}



final Style _tooltipStyle = new Style('''

  .$BASE.$CONTROL.$POP_OVER.$TOOLTIP
  {
    border: 1px solid #99f;
    border-radius: 3px;
    background: #eef;
    color: #99f;
    padding: 3px;
  }

''');