/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


class ContextMenuUsage{


  static bool _initialised = false;


  static ContextMenu _currentContextMenu;


  static Control _currentTarget;


  static int _targetMouseOffsetX;


  static int _targetMouseOffsetY;


  //for nested parent child controls to add creators to
  static List<List<Button>> _buttonGroups = new List<List<Button>>();

  //for inherited parent child controls to add creators to
  final List<Func_Control_List_t_Button_t> contextMenuButtonCreators = new List<Func_Control_List_t_Button_t>();


  void initialiseContextMenuUsage(Func_Control_List_t_Button_t itemCreators){

    _initialise();

    contextMenuButtonCreators.add(itemCreators);

    //only add the event listener once
    if(contextMenuButtonCreators.length == 1){

      (this as Control).html.onContextMenu.listen((MouseEvent event){

        if(_currentTarget == null){

          _currentTarget = this as Control;

          _targetMouseOffsetX = event.offsetX;

          _targetMouseOffsetY = event.offsetY;

        }

        for(var buttonListCreator in contextMenuButtonCreators){

          _buttonGroups.add(buttonListCreator(this));

        }

      });

    }

  }


  static void _initialise(){

    if(!_initialised){

      _initialised = true;

      var closeCurrentContextMenu = (){

        if(_currentContextMenu != null){

          _currentContextMenu.hide();

          _currentContextMenu = null;

        }

      };

      window.onContextMenu.listen((MouseEvent event){

        closeCurrentContextMenu();

        if(_buttonGroups.length > 0){

          event.preventDefault();

          _currentContextMenu = new ContextMenu(_buttonGroups)
          ..show(_currentTarget, left:_targetMouseOffsetX, top: _targetMouseOffsetY );

          _currentTarget = null;

          _buttonGroups.clear();

        }

      });

      window.onClick.listen((MouseEvent event){

        closeCurrentContextMenu();

      });

      window.onKeyDown.listen((KeyboardEvent event){

        closeCurrentContextMenu();

      });

    }

  }

}