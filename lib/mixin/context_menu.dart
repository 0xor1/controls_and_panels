/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


class ContextMenu{


  static bool _initialised = false;


  static PopOver _current;


  static Control _target;


  static int _targetMouseOffsetX;


  static int _targetMouseOffsetY;

  
  static bool holdOpen = false;
  
  
  static final Func_List$List$Control$$_Control _simpleContainerCreator = (List<List<Control>> controlGroups){
    
    return new SimpleContextMenu(controlGroups);
    
  };
  
  
  static Func_List$List$Control$$_Control _containerCreator = _simpleContainerCreator;
  

  //for nested parent child controls to add creators to
  static List<List<Control>> _controlGroups = new List<List<Control>>();

  
  //for inherited parent child controls to add creators to
  final List<Func_Control_List$Control$> contextMenuControlCreators = new List<Func_Control_List$Control$>();

  
  static void close(){

    if(_current != null && !holdOpen){

      _current.hide();

      _current = null;

    }
    
    holdOpen = false;

  }
  

  void initialiseCustomContextMenu(Func_Control_List$Control$ itemCreators, Func_List$List$Control$$_Control containerCreator){

    _initialise();

    contextMenuControlCreators.add(itemCreators);
    
    //only add the event listener once
    if(contextMenuControlCreators.length == 1){

      if(containerCreator != null){
        
        _containerCreator = containerCreator;
        
      }
      
      (this as Control).html.onContextMenu.listen((MouseEvent event){

        if(_target == null){

          _target = this as Control;

          _targetMouseOffsetX = event.offsetX;

          _targetMouseOffsetY = event.offsetY;

        }
        
        for(var controlListCreator in contextMenuControlCreators){

          _controlGroups.add(controlListCreator(this));

        }

      });

    }

  }
  
  
  void initialiseSimpleContextMenu(Func_Control_List$Control$ itemCreators){

    _initialise();

    contextMenuControlCreators.add(itemCreators);

    //only add the event listener once
    if(contextMenuControlCreators.length == 1){

      _containerCreator = _simpleContainerCreator;
      
      (this as Control).html.onContextMenu.listen((MouseEvent event){

        if(_target == null){

          _target = this as Control;

          _targetMouseOffsetX = event.offsetX;

          _targetMouseOffsetY = event.offsetY;

        }
        
        for(var controlListCreator in contextMenuControlCreators){

          _controlGroups.add(controlListCreator(this));

        }

      });

    }

  }


  static void _initialise(){

    if(!_initialised){

      _initialised = true;

      window.onContextMenu.listen((MouseEvent event){

        close();

        if(_current == null && _controlGroups.length > 0){

          event.preventDefault();

          _current = new PopOver(content: _containerCreator(_controlGroups));
          
          _displayMenuOrientatedWithMostAvailableSpace(event);
          
          _target = null;

          _controlGroups.clear();

        }

      });

      window.onClick.listen((MouseEvent event){

        close();

      });

      window.onKeyDown.listen((KeyboardEvent event){

        close();

      });

    }

  }
  
  
  static void _displayMenuOrientatedWithMostAvailableSpace(MouseEvent event){
    
    int targetWidth = _target.html.clientWidth;
    
    int targetHeight = _target.html.clientHeight;
    
    if(xIsOnLeftHalfOfWindowViewport(event.screenX)){
      
      if(yIsOnTopHalfOfWindowViewport(event.screenY)){
        
        _current.show(_target, left: _targetMouseOffsetX, top: _targetMouseOffsetY );
        
      }else{
        
        _current.show(_target, left: _targetMouseOffsetX, bottom: targetHeight - _targetMouseOffsetY );
        
      }
      
    }else{
      
      if(yIsOnTopHalfOfWindowViewport(event.screenY)){
        
        _current.show(_target, right: targetWidth - _targetMouseOffsetX, top: _targetMouseOffsetY );
        
      }else{
        
        _current.show(_target, right: targetWidth - _targetMouseOffsetX, bottom: targetHeight - _targetMouseOffsetY );
        
      }
      
    }
    
  }

}