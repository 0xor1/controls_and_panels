/*
 * author:  Daniel Robinson http://github.com/0xor1
 */


part of controls_and_panels;

class AlignmentPanel<TBase extends Base> extends Panel<TBase>{
  
  static const String CLASS = 'cnp-alignment-panel';
  static const String ALIGNMENT_INNER_LAYOUT_ASSISTANT = 'alignment-inner-layout-assistant';
  static const String ALIGNMENT_OUTER_LAYOUT_ASSISTANT = 'alignment-outer-layout-assistant';
  
  DivElement _outerLayoutAssistant = new DivElement()
  ..classes.add(ALIGNMENT_OUTER_LAYOUT_ASSISTANT);
  DivElement _innerLayoutAssistant = new DivElement()
  ..classes.add(ALIGNMENT_INNER_LAYOUT_ASSISTANT);
  
  Alignment _horizontal;
  Alignment get horizontal => _horizontal == Alignment._H_CENTER? Alignment.CENTER: _horizontal;
  void set horizontal(Alignment ali){
    removeClass(_horizontal);
    if(ali != Alignment.LEFT && ali != Alignment.RIGHT){
      ali = Alignment._H_CENTER;
    }
    _horizontal = ali;
    addClass(_horizontal);
  }
  
  Alignment _vertical;
  Alignment get vertical => _vertical == Alignment._V_CENTER? Alignment.CENTER: _vertical;
  void set vertical(Alignment ali){
    removeClass(_vertical);
    if(ali != Alignment.TOP && ali != Alignment.BOTTOM){
      ali = Alignment._V_CENTER;
    }
    _vertical = ali;
    addClass(_vertical);
  }

  AlignmentPanel({Alignment horizontal: Alignment.CENTER, Alignment vertical: Alignment.CENTER}){
    _sizerPanelStyle.insert();
    this.horizontal = horizontal;
    this.vertical = vertical;
    html.children.add(
      _outerLayoutAssistant
      ..children.add(_innerLayoutAssistant));
    addClass(CLASS);
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
      width: 100%;
      height: 100%;
      display: table-cell;
    }

    .$CLASS.${Alignment.LEFT}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      text-align: left;
    }

    .$CLASS.${Alignment.RIGHT}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      text-align: right;
    }

    .$CLASS.${Alignment._H_CENTER}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      text-align: center;
    }

    .$CLASS.${Alignment._H_CENTER}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
          > *
    {
      text-align: left; /*undo the style above*/
    }

    .$CLASS.${Alignment.TOP}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: top;
    }

    .$CLASS.${Alignment.BOTTOM}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: bottom;
    }

    .$CLASS.${Alignment._V_CENTER}
      > .$ALIGNMENT_OUTER_LAYOUT_ASSISTANT
        > .$ALIGNMENT_INNER_LAYOUT_ASSISTANT
    {
      vertical-align: middle;
    }

  ''');
}



