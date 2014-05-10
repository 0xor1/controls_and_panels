/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;

class Splitter extends Control{

  static const String CLASS = 'cnp-splitter';
  Splitter._internal():
    super(){
    _splitterStyle.insert();
    html.classes.add(CLASS);
  }


  factory Splitter.vertical({String lineColor: '#000', String lineStyle: 'solid', int lineThickness: 1, int beforeMargin: 0, int afterMargin: 0}){
    var splitter = new Splitter._internal()
    ..html.classes.add(StackPanel.VERTICAL)
    ..html.style.borderRight = '${lineThickness}px $lineStyle $lineColor'
    ..html.style.marginLeft = '${beforeMargin}px'
    ..html.style.marginRight = '${afterMargin}px';
    return splitter;
  }

  factory Splitter.horizontal({String lineColor: '#000', String lineStyle: 'solid', int lineThickness: 1, int beforeMargin: 0, int afterMargin: 0}){
    var splitter = new Splitter._internal()
    ..html.classes.add(StackPanel.HORIZONTAL)
    ..html.style.borderBottom = '${lineThickness}px $lineStyle $lineColor'
    ..html.style.marginTop = '${beforeMargin}px'
    ..html.style.marginBottom = '${afterMargin}px';
    return splitter;
  }

  static final Style _splitterStyle = new Style('''

    .$CLASS
    {
      overflow: hidden;
    }
  
    .$CLASS.${StackPanel.HORIZONTAL}
    {
      width: 100%;
    }
  
    .$CLASS.${StackPanel.VERTICAL}
    {
      height: 100%;
    }

  ''');
}