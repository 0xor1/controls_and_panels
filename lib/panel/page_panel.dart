/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class PagePanel extends Panel<Window>{

  static const String CLASS = 'cnp-page-panel';
  static const String FLOAT_ANCHOR = 'cnp-float-anchor';
  static const String CONTENT_HOLDER = 'cnp-content-holder';

  final DivElement _floatAnchor = new DivElement()
  ..classes.add(FLOAT_ANCHOR);
  final DivElement _contentHolder = new DivElement()
  ..classes.add(CONTENT_HOLDER);
  Base _content;

  PagePanel(this._content){
    _pagePanelStyle.insert();
    addClass(CLASS);
    _arrangeHtml();
  }

  void _arrangeHtml(){
    html
    ..append(_contentHolder)
    ..append(_floatAnchor);
    if(_content != null){
      setContent(_content);
    }
  }

  void add(Window item){
    items.add(item);
    _floatAnchor.children.add(item.html);
  }

  void insert(int index, Window item){
    items.insert(index, item);
    _floatAnchor.children.insert(index, item.html);
  }

  bool remove(Window base){
    bool removed = items.remove(base);
    if(removed){
      _floatAnchor.children.remove(base.html);
    }
    return removed;
  }

  Window removeAt(int index){
    Window base = items.removeAt(index);
    if(base != null){
      _floatAnchor.children.remove(base.html);
    }
    return base;
  }

  void float(Base content, Image icon, String name, int width, int height, int top, int left){
    add(new Window(content, icon, name, width, height, top, left));
  }

  void setContent(Base content){
    _contentHolder.children.clear();
    _contentHolder.children.add(content.html);
  }

  static final Style _pagePanelStyle = new Style('''  

    .$CLASS
    {
      width: 100%;
      height: 100%;
    }

    .$CLASS
      > .$FLOAT_ANCHOR
    {
      position: absolute;
      width: 0;
      height: 0;
      top: 0;
      left: 0;
      overflow: visible;
    }

    .$CLASS
      > .$CONTENT_HOLDER
    {
      width: 100%;
      height: 100%;
    }

  ''');
}



