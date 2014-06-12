/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Window extends Control {

  static const String CLASS = 'cnp-window';
  static const String RESIZER = 'cnp-window-resizer';
  static const String HEADER = 'cnp-window-header';
  static const int _resizer_thickness = 6;
  static const int _header_thickness = 32;
  static const int _movementBuffer = 50;
  static const int _minSize = 50;

  final DivElement _topResizer = new DivElement()..classes.addAll([RESIZER, VAlign.TOP.toString()]);
  final DivElement _leftResizer = new DivElement()..classes.addAll([RESIZER, HAlign.LEFT.toString()]);
  final DivElement _bottomResizer = new DivElement()..classes.addAll([RESIZER, VAlign.BOTTOM.toString()]);
  final DivElement _rightResizer = new DivElement()..classes.addAll([RESIZER, HAlign.RIGHT.toString()]);
  final DivElement _topLeftResizer = new DivElement()..classes.addAll([RESIZER, VAlign.TOP.toString(), HAlign.LEFT.toString()]);
  final DivElement _bottomRightResizer = new DivElement()..classes.addAll([RESIZER, VAlign.BOTTOM.toString(), HAlign.RIGHT.toString()]);
  final DivElement _topRightResizer = new DivElement()..classes.addAll([RESIZER, VAlign.TOP.toString(), HAlign.RIGHT.toString()]);
  final DivElement _bottomLeftResizer = new DivElement()..classes.addAll([RESIZER, VAlign.BOTTOM.toString(), HAlign.LEFT.toString()]);

  final DivElement _header = new DivElement()..classes.add(HEADER);

  final DivElement _contentHolder = new DivElement()..classes.add(PagePanel.CONTENT_HOLDER);

  final Base content;
  final Image icon;
  final String name;

  StreamSubscription _currentMouseMoveSub;

  int _top;
  int get top => _top;
  void set top(int t) {
    _top = t < 0? 0: t > window.innerHeight - _movementBuffer? window.innerHeight - _movementBuffer: t;
    html.style.top = '${_top}px';
  }

  int _left;
  int get left => _left;
  void set left(int l) {
    _left = l < 0? 0: l > window.innerWidth - _movementBuffer? window.innerWidth - _movementBuffer: l;
    html.style.left = '${_left}px';
  }

  int _width;
  int get width => _width;
  void set width(int w) {
    _width = w < _minSize? _minSize: w > window.innerWidth - _left? window.innerWidth - _left: w;
    html.style.width = '${_width}px';
  }

  int _height;
  int get height => _height;
  void set height(int h) {
    _height = h < _minSize? _minSize: h > window.innerHeight - _top? window.innerHeight - _top: h;
    html.style.height = '${_height}px';
  }

  Window(this.content, this.icon, this.name, this._width, this._height, this._top, this._left) {
    _windowStyle.insert();
    setWindowSize(_width, _height);
    setWindowPosition(_top, _left);
    addClass(CLASS);
    _arrangeHtml();
    _hookUpEvents();
  }

  void _arrangeHtml() {
    html.children.addAll([
      _contentHolder,
      _topResizer,
      _leftResizer,
      _bottomResizer,
      _rightResizer,
      _topLeftResizer,
      _bottomRightResizer,
      _topRightResizer,
      _bottomLeftResizer,
      _header]);
    _header.append((
      new StackPanel(Orientation.HORIZONTAL, [
        icon, new Label(name)])
      ..fill()).html);
    _contentHolder.append((content).html);
  }

  void _hookUpEvents(){
    _bottomResizer.onMouseDown.listen((_){
      _attachWindowMouseUpEvent();
      if(_currentMouseMoveSub != null){
        _currentMouseMoveSub.cancel();
      }
      _currentMouseMoveSub = window.onMouseMove.listen((MouseEvent event){

      });
    });
  }

  void _attachWindowMouseUpEvent(){
    window.onMouseUp.listen((_){
      if(_currentMouseMoveSub != null){
        _currentMouseMoveSub.cancel();
      }
    });
  }

  void setWindowPosition(int top, int left) {
    this.top = top;
    this.left = left;
  }

  void setWindowSize(int width, int height) {
    this.width = width;
    this.height = height;
  }

  static final Style _windowStyle = new Style('''  

    .$CLASS
    {
      position: absolute;
      background: #fff;
      border: 1px solid #aaaaaa;
    }

    .$CLASS
      > *
    {
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      background: rgba(0,0,0,0);
    }

    .$CLASS
      > .$RESIZER.${VAlign.TOP}
    {
      bottom: calc(100% - ${_resizer_thickness}px);
      cursor: ns-resize;
    }

    .$CLASS
      > .$RESIZER.${HAlign.LEFT}
    {
      right: calc(100% - ${_resizer_thickness}px);
      cursor: ew-resize;
    }

    .$CLASS
      > .$RESIZER.${VAlign.BOTTOM}
    {
      top: calc(100% - ${_resizer_thickness}px);
      cursor: ns-resize;
    }

    .$CLASS
      > .$RESIZER.${HAlign.RIGHT}
    {
      left: calc(100% - ${_resizer_thickness}px);
      cursor: ew-resize;
    }

    .$CLASS
      > .$RESIZER.${VAlign.TOP}.${HAlign.LEFT} ,
    .$CLASS
      > .$RESIZER.${VAlign.BOTTOM}.${HAlign.RIGHT}
    {
      cursor: nw-resize;
    }

    .$CLASS
      > .$RESIZER.${VAlign.TOP}.${HAlign.RIGHT} ,
    .$CLASS
      > .$RESIZER.${VAlign.BOTTOM}.${HAlign.LEFT}
    {
      cursor: ne-resize;
    }

    .$CLASS
      > .${PagePanel.CONTENT_HOLDER}
    {
      top: ${(_resizer_thickness * 2) + _header_thickness}px;
      left: ${_resizer_thickness}px;
      right: ${_resizer_thickness}px;
      bottom: ${_resizer_thickness}px;
      background: #fff;
      border: 1px solid #aaaaaa;
      overflow: auto;
    }

    .$CLASS
      > .$HEADER
    {
      top: ${_resizer_thickness}px;
      left: ${_resizer_thickness}px;
      right: ${_resizer_thickness}px;
      bottom: calc(100% - ${_resizer_thickness + _header_thickness}px);
      overflow: hidden;
      cursor: move;
      padding: 2px;
    }

    .$CLASS
      > .$HEADER
        > *
    {
      background: #fff;
      border: 1px solid #aaaaaa;
    }

  ''');
}


