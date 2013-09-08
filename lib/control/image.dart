/*
 * 0xor1  http://github.com/0xor1
 */

part of controls_and_panels;

const String IMAGE = 'image';

class Image extends Control{

  ImageElement _imageElement = new ImageElement();
  String get src => _imageElement.src;
  void set src (String src){ _imageElement.src = src; }
  String get alt => _imageElement.alt;
  void set alt (String alt){ _imageElement.alt = alt; }
  int get height => _imageElement.height;
  void set height (int height){ _imageElement.height = height; }
  int get width => _imageElement.width;
  void set width (int width){ _imageElement.width = width; }

  Image(String src, {String alt:'', int width: null, int height: null}):
    super(){

    _insertStyle(_imageStyle);

    _imageElement
      ..src = src
      ..alt = alt;

    if(width != null){

      this.width = width;

    }

    if(height != null){

      this.height = height;

    }

    controlContentElement.children.add(_imageElement);

    html.classes.add(IMAGE);

  }

}



final Style _imageStyle = new Style('''

  .$BASE.$CONTROL.$IMAGE > .$CONTROL_CONTENT_ELEMENT > img
  {
    display: block;
  }

''');