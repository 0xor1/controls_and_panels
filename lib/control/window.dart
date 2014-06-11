/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class Window extends Control {

  static const String CLASS = 'cnp-window';
  static const String RESIZER = 'cnp-window-resizer';
  static const String HEADER = 'cnp-window-header';
  static const int _resizer_thickness = 8;
  static const int _header_thickness = 24;

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

  Window(this.content, this.icon, this.name, int width, int height, int top, int left) {
    _windowStyle.insert();
    setWindowSize(width, height);
    setWindowPosition(top, left);
    addClass(CLASS);
    _arrangeHtml();
  }

  void _arrangeHtml() {
    html.children.addAll([
      _topResizer,
      _leftResizer,
      _bottomResizer,
      _rightResizer,
      _topLeftResizer,
      _bottomRightResizer,
      _topRightResizer,
      _bottomLeftResizer,
      _header,
      _contentHolder]);

    _header.append((
      new StackPanel(Orientation.HORIZONTAL, [
        icon, new Label(name)])
      ..fill()).html);

    _contentHolder.append((content).html);
  }

  void setWindowPosition(int top, int left) {
    html.style
        ..top = '${top}px'
        ..left = '${left}px';
  }

  void setWindowSize(int width, int height) {
    html.style
        ..width = '${width}px'
        ..height = '${height}px';
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


