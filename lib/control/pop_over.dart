/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String POP_OVER = 'pop-over';


class PopOver extends Control{


  PopOver({Base content: null}):
    super(){

    _insertStyle(_popOverStyle);

    if(content != null){

      controlContentElement.children.add(content.html);

    }

    html.classes.add(POP_OVER);

  }


  void hide(){

    if(html.parent != null){

      html.parent.children.remove(html);

    }

  }


  void show(Control owner, { int left: null, int top: null, int right: null, int bottom: null}){

    if(top != null){

      html.style.top = '${top}px';

      if(left != null){

        html.style.left = '${left}px';

        owner._topLeftPopOverLayoutAssistant.children.add(html);

      }else{

        html.style.right = '${right}px';

        owner._topRightPopOverLayoutAssistant.children.add(html);

      }
    }else{

      html.style.bottom = '${bottom}px';

      if(left != null){

        html.style.left = '${left}px';

        owner._bottomLeftPopOverLayoutAssistant.children.add(html);

      }else{

        html.style.right = '${right}px';

        owner._bottomRightPopOverLayoutAssistant.children.add(html);

      }

    }

  }


}



final Style _popOverStyle = new Style('''

  .$POP_OVER
  {
    position: absolute;
    background: transparent;
  }

''');