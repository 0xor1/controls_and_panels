/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String SPLITTER = 'splitter';


class Splitter extends Control{


  Splitter._internal():
    super(){

    _insertStyle(_splitterStyle);

    html.classes.add(SPLITTER);

  }
  
  
  factory Splitter.vertical({String lineColor: '#000', String lineStyle: 'solid', int lineThickness: 1, int beforeMargin: 0, int afterMargin: 0}){
    
    var splitter = new Splitter._internal()
    ..html.classes.add(VERTICAL)
    ..html.style.borderRight = '${lineThickness}px $lineStyle $lineColor'
    ..html.style.marginLeft = '${beforeMargin}px'
    ..html.style.marginRight = '${afterMargin}px';
    
    return splitter;
  }


  factory Splitter.horizontal({String lineColor: '#000', String lineStyle: 'solid', int lineThickness: 1, int beforeMargin: 0, int afterMargin: 0}){
    
    var splitter = new Splitter._internal()
    ..html.classes.add(HORIZONTAL)
      ..html.style.borderBottom = '${lineThickness}px $lineStyle $lineColor'
      ..html.style.marginTop = '${beforeMargin}px'
      ..html.style.marginBottom = '${afterMargin}px';
      
      return splitter;
    
  }


}



final Style _splitterStyle = new Style('''

  .$SPLITTER
  {
    overflow: hidden;
  }

  .$SPLITTER.$HORIZONTAL
  {
    width: 100%;
  }

  .$SPLITTER.$VERTICAL
  {
    height: 100%;
  }

''');