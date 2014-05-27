/*
 * author:  Daniel Robinson http://github.com/0xor1
 */


part of controls_and_panels;

class AlignmentPanel<TBase extends Base> extends Panel<TBase>{
  
  static const String CLASS = 'cnp-alignment-panel';
  static const String LEFT = 'left';
  static const String RIGHT = 'right';
  static const String TOP = 'top';
  static const String BOTTOM = 'bottom';
  static const String H_CENTER = 'h-center';
  static const String V_CENTER = 'v-center';
  static const String CENTER = 'center';
  static const String ALIGNMENT_INNER_LAYOUT_ASSISTANT = 'alignment-inner-layout-assistant';
  static const String ALIGNMENT_OUTER_LAYOUT_ASSISTANT = 'alignment-outer-layout-assistant';
  
  DivElement _outerLayoutAssistant = new DivElement()
  ..classes.add(ALIGNMENT_OUTER_LAYOUT_ASSISTANT);
  DivElement _innerLayoutAssistant = new DivElement()
  ..classes.add(ALIGNMENT_INNER_LAYOUT_ASSISTANT);
  
  String _horizontalAlignment;
  String get horizontalAlignment => _horizontalAlignment != H_CENTER ? _horizontalAlignment : CENTER;
  void set horizontalAlignment(String alignment){
    html.classes.remove(_horizontalAlignment);
    switch(alignment){
      case LEFT:
        _horizontalAlignment = LEFT;
        break;
      case RIGHT:
        _horizontalAlignment = RIGHT;
        break;
      default:
        _horizontalAlignment = H_CENTER;
    }
    html.classes.add(_horizontalAlignment);
  }
  
  String _verticalAlignment;
  String get verticalAlignment => _verticalAlignment != V_CENTER ? _verticalAlignment : CENTER;
  void set verticalAlignment(String alignment){
    html.classes.remove(_verticalAlignment);
    switch(alignment){
      case TOP:
        _verticalAlignment = TOP;
        break;
      case BOTTOM:
        _verticalAlignment = BOTTOM;
        break;
      default:
        _verticalAlignment = V_CENTER;
    }
    html.classes.add(_verticalAlignment);
  }

  AlignmentPanel(){
    _sizerPanelStyle.insert();
    horizontalAlignment = CENTER;
    verticalAlignment = CENTER;
    html.children.add(
        _outerLayoutAssistant
          ..children.add(_innerLayoutAssistant));
    html.classes.add(CLASS);
  }

  void add(TBase item){
    if(items.length == 0){
      items.add(item);
      _innerLayoutAssistant.children.add(item.html);
      return;
    }
    throw 'sizer panel already has one child and cannot accept anymore';
  }

  void insert(int index, TBase item){
    if(index == 0){
      add(item);
      return;
    }
    throw 'can only insert at index 0 on a sizer panel as it only accepts one child';
  }

  bool remove(TBase item){
    _innerLayoutAssistant.children.remove(item.html);
    return items.remove(item);
  }

  TBase removeAt(int index){
    if(index == 0 && items.length == 1){
      var base = items.removeAt(0);
      _innerLayoutAssistant.children.remove(base.html);
      return base;
    }
    return null;
  }

  static final Style _sizerPanelStyle = new Style('''

    .$CLASS
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
    {
      display: table;
      width: 100%;
      height: 100%;
      margin: 0;
      border: 0;
      padding: 0;
    }

    .$CLASS
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      display: table-cell;
    }

    .$CLASS.$LEFT
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      text-align: left;
    }

    .$CLASS.$RIGHT
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      text-align: right;
    }

    .$CLASS.$H_CENTER
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      text-align: center;
    }

    .$CLASS.$H_CENTER
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
          > *
    {
      text-align: left; /*undo the style above*/
    }

    .$CLASS.$TOP
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: top;
    }

    .$CLASS.$BOTTOM
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: bottom;
    }

    .$CLASS.$V_CENTER
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: middle;
    }

  ''');
}



