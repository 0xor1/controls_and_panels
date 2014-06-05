/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

const String PANEL = 'cnp-panel';

abstract class Panel<TBase extends Base> extends Base{

  List<TBase> items = new List<TBase>();

  Panel(){
    _panelStyle.insert();
    html.classes.add(PANEL);
  }

  void add(TBase base);

  void insert(int index, TBase base);

  bool remove(TBase base);

  Base removeAt(int index);

  void clear(){
    items.forEach((item){
      remove(item);
    });

  }

  static final Style _panelStyle = new Style('''

    .$PANEL
    {
    }

  ''');
}
