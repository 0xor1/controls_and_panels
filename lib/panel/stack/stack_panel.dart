/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String STACK_PANEL = 'stack-panel';
const String STACK_SLOT = 'stack-slot';
const String HORIZONTAL = 'horizontal';
const String VERTICAL = 'vertical';

class StackPanel extends Panel{


  String _orientation;
  String get orientation => _orientation;
  void set orientation (String ori){

    if(ori != orientation){

      html.classes.remove(_orientation);

      switch(ori){

        case HORIZONTAL:
          _orientation = HORIZONTAL;
          break;
        default:
          _orientation = VERTICAL;
          break;
      }

      html.classes.add(_orientation);

    }

  }


  StackPanel._internal(String orientation, List<Base> bases){

    _insertStackPanelStyleElement();

    if(bases != null){

      children.addAll(bases);

      html.children.addAll(bases.map((o) => o.html));

    }

    this.orientation = orientation;

    html.classes.add(STACK_PANEL);

  }


  factory StackPanel.vertical([List<Base> bases]){

    return new StackPanel._internal(VERTICAL, bases);

  }


  factory StackPanel.horizontal([List<Base> bases]){

    return new StackPanel._internal(HORIZONTAL, bases);

  }


  void add(Base base){

    children.add(base);

    html.children.add(base.html);

  }


  void insert(int index, Base base){

    children.insert(index, base);

    html.children.insert(index, base.html);

  }


  bool remove(Base base){

    bool removed = children.remove(base);

    if(removed){

      html.children.remove(base.html);

    }

    return removed;

  }


  Base removeAt(int index){

    Base base = children.removeAt(index);

    if(base != null){

      html.children.remove(base.html);

    }

    return base;

  }


}