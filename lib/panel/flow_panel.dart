/*
 * author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class FlowPanel<TBase extends Base> extends Panel<TBase>{
  
  static const String CLASS = 'cnp-flow-panel';

  Direction _to;
  Direction get to => _to;
  void set to(Direction dir){
    removeClass(_to);
    if(dir != Direction.RIGHT){
      dir = Direction.LEFT;
    }
    _to = dir;
    addClass(_to);
  }

  FlowPanel(Direction toDir, [List<TBase> items = null]){
    _flowPanelStyle.insert();
    if(items != null){
      this.items.addAll(items);
      html.children.addAll(items.map((o) => o.html));
    }
    addClass(CLASS);
    to = toDir;
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

  static final Style _flowPanelStyle = new Style('''  

    .$CLASS.${Direction.LEFT} > .${Base.CLASS}
    {
      float: right;
    }

    .$CLASS.${Direction.RIGHT} > .${Base.CLASS}
    {
      float: left;
    }

  ''');
}



