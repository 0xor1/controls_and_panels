/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

class FloatContainerPanel<TBase extends Base> extends Panel<TBase>{
  static const String CLASS = 'cnp-float-container-panel';
  static const string FLOAT_ANCHOR = 'cnp-float-anchor';
  final SizerPanel<TBase> _sizer = new SizerPanel<TBase>('100%', '100%');
  final DivElement _floatAnchor = new DivElement()..classes.add(FLOAT_ANCHOR);
  
  FloatContainerPanel(){
    _floatContanerPanelStyle.insert();
    html.classes.add(CLASS);
    html.style.width = '${width}px';
    html.style.height = '${height}px';
    html.children.addAll([
      _sizer.html,
      _floatAnchor]);
    
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
  

  static final Style _floatContanerPanelStyle = new Style('''

    .$CLASS
    {
      width: 100%;
      height: 100%;
    }

    .$CLASS
      > .${FLOAT_ANCHOR}
    {
      position: absolute;
      top: 0;
      left: 0;
      width: 0;
      height: 0;
      overflow: visible;
    }

  ''');
}



