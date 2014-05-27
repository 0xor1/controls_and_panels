/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class FlowPanel<TBase extends Base> extends Panel<TBase>{
  
  static const String CLASS = 'cnp-flow-panel';


  String _fromHorizontal;
  String get orientation => _orientation;

  FlowPanel._internal(String orientation, [List<TBase> items = null]){
    _stackPanelStyle.insert();
    if(items != null){
      this.items.addAll(items);
      html.children.addAll(items.map((o) => o.html));
    }
    html.classes.add(CLASS);
    _orientation = orientation;
    html.classes.add(orientation);
  }

  factory FlowPanel.vertical([List<TBase> bases]) => new FlowPanel._internal(VERTICAL, bases);
  factory FlowPanel.horizontal([List<TBase> bases]) => new FlowPanel._internal(HORIZONTAL, bases);

  Splitter addSplitter({String lineColor: '#000', String lineStyle: 'solid', int lineThickness: 1, int beforeMargin: 0, int afterMargin: 0}){
    Splitter splitter;
    if(_orientation == HORIZONTAL){
      splitter = new Splitter.vertical(lineColor: lineColor, lineStyle: lineStyle, lineThickness: lineThickness, beforeMargin: beforeMargin, afterMargin: afterMargin);
    }else{
      splitter = new Splitter.horizontal(lineColor: lineColor, lineStyle: lineStyle, lineThickness: lineThickness, beforeMargin: beforeMargin, afterMargin: afterMargin);
    }
    add(splitter);
    return splitter;
  }

  void add(TBase item){
    items.add(item);
    html.children.add(item.html);
  }

  void insert(int index, TBase item){
    items.insert(index, item);
    html.children.insert(index, item.html);
  }


  bool remove(TBase base){
    bool removed = items.remove(base);
    if(removed){
      html.children.remove(base.html);
    }
    return removed;
  }

  TBase removeAt(int index){
    TBase base = items.removeAt(index);
    if(base != null){
      html.children.remove(base.html);
    }
    return base;
  }

  static final Style _stackPanelStyle = new Style('''  
    
    .$CLASS.$HORIZONTAL
    {
      white-space: nowrap;
      font-size: 0;
    }
  
    .$CLASS.$HORIZONTAL > .${Base.CLASS}
    {
      word-spacing: normal;
      vertical-align: middle;
      font-size: 16px;
    }

    .$CLASS.$VERTICAL > .${Base.CLASS}
    {
      clear: left;
      float: left;
    }

    .$CLASS.$VERTICAL
    {
      white-space: normal;
    }

  ''');
}



