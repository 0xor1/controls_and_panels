/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;

class ResizerPanel<TBase extends Base> extends Panel<TBase> implements SizerPanel<TBase>{
  static const String CLASS = 'cnp-resizer-panel';
  static const int BAR_THICKNESS = 6;
  final SizerPanel<TBase> _sizer = new SizerPanel<TBase>('100%', '100%');
  final DivElement _topLeftResizer =
    new DivElement()
    ..classes.addAll([SizerPanel.TOP, SizerPanel.LEFT]);
  final DivElement _topResizer =
    new DivElement()
    ..classes.add(SizerPanel.TOP);
  final DivElement _topRightResizer =
    new DivElement()
    ..classes.addAll([SizerPanel.TOP, SizerPanel.RIGHT]);
  final DivElement _rightResizer =
    new DivElement()
    ..classes.add(SizerPanel.RIGHT);
  final DivElement _bottomRightResizer =
    new DivElement()
    ..classes.addAll([SizerPanel.BOTTOM, SizerPanel.RIGHT]);
  final DivElement _bottomResizer =
    new DivElement()
    ..classes.add(SizerPanel.BOTTOM);
  final DivElement _bottomLeftResizer =
    new DivElement()
    ..classes.addAll([SizerPanel.BOTTOM, SizerPanel.LEFT]);
  final DivElement _leftResizer =
    new DivElement()
    ..classes.add(SizerPanel.LEFT);

  ResizerPanel(int width, int height){
    _resizerPanelStyle.insert();
    html.classes.add(CLASS);
    html.style.border = '1px solid black'; //For dev testing, delete after
    html.style.width = '${width}px';
    html.style.height = '${height}px';
    html.children.addAll([
      _sizer.html,
      _topResizer,
      _rightResizer,
      _bottomResizer,
      _leftResizer,
      _topLeftResizer,
      _topRightResizer,
      _bottomRightResizer,
      _bottomLeftResizer]);
    
    //TODO attach event listeners to resize
  }
  
  String get verticalAlignment => _sizer.verticalAlignment;
  void set verticalAlignment(String align){ _sizer.verticalAlignment = align; }
  String get horizontalAlignment => _sizer.horizontalAlignment;
  void set horizontalAlignment(String align){ _sizer.horizontalAlignment = align; }
  void add(TBase item) => _sizer.add(item);
  void insert(int index, TBase item) => _sizer.insert(index, item);
  bool remove(TBase item) => _sizer.remove(item);
  TBase removeAt(int index) => _sizer.removeAt(index);
  

  static final Style _resizerPanelStyle = new Style('''

    .$CLASS
      > *
    {
      position: absolute;
      margin: 0;
      border: 0;
      padding: 0;
      width: 100%;
      height: 100%;
    }

    .$CLASS
      > .${SizerPanel.LEFT}
    {
      width: ${BAR_THICKNESS}px;
      left: 0;
      cursor: ew-resize;
    }

    .$CLASS
      > .${SizerPanel.TOP}
    {
      height: ${BAR_THICKNESS}px;
      top: 0;
      cursor: ns-resize;
    }

    .$CLASS
      > .${SizerPanel.RIGHT}
    {
      width: ${BAR_THICKNESS}px;
      right: 0;
      cursor: ew-resize;
    }

    .$CLASS
      > .${SizerPanel.BOTTOM}
    {
      height: ${BAR_THICKNESS}px;
      bottom: 0;
      cursor: ns-resize;
    }

    .$CLASS
      > .${SizerPanel.TOP}.${SizerPanel.LEFT},
    .$CLASS
      > .${SizerPanel.BOTTOM}.${SizerPanel.RIGHT}
    {
      cursor: nwse-resize;
    }

    .$CLASS
      > .${SizerPanel.TOP}.${SizerPanel.RIGHT},
    .$CLASS
      > .${SizerPanel.BOTTOM}.${SizerPanel.LEFT}
    {
      cursor: nesw-resize;
    }

  ''');
}



