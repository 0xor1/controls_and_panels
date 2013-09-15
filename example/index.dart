import 'package:controls_and_panels/controls_and_panels.dart';
import 'dart:html';
import 'dart:async';

void main() {

  var peaceImgPath = 'resource/image/peace_dove_icon.svg';
  var arrowImgPath = 'resource/image/green_down_arrow_icon.png';

  var stackPanels = new List<StackPanel>();
  var stackPanel1 = new StackPanel.vertical();
  document.body.children.add(stackPanel1.html);
  stackPanels.add(stackPanel1);

  var stackPanel2 = new StackPanel.vertical();
  document.body.children.add(stackPanel2.html);
  stackPanels.add(stackPanel2);


  var stackPanel3 = new StackPanel.vertical();
  document.body.children.add(stackPanel3.html);
  stackPanels.add(stackPanel3);

  var comboList = new List<Control>()
      ..add(new Label('one')..html.attributes['data-value'] = 'one')
      ..add(new Label('two')..html.attributes['data-value'] = 'two')
      ..add(new Label('three')..html.attributes['data-value'] = 'three');

  var getItemList = (String str){
    var completer = new Completer();
    completer.complete(comboList);
    return completer.future;
  };

  var processSelection = (Base base){
    print('you selected ${base.html.dataset['value']}');
  };

  for(var stackPanel in stackPanels){
    //Future<List<Base>>
    var controls = new List<Base>()
    ..add(new Image(peaceImgPath, alt: 'Yomma!', width:95, height:95))
    ..add(new TextBox(placeholder:'Please enter first name'))
    ..add(new TextArea(rows: 4, cols: 20, placeholder:'Please enter first name'))
    ..add(new Label("Yomma!"))
    ..add(new Button.iconText(peaceImgPath, 'Peace', iconWidth:25, iconHeight:25))
    ..add(new ComboBox(getItemList, new Label('--please select one--'), new Image(arrowImgPath, width: 25, height: 25 )));
    
    for(var base in controls){
      stackPanel.add(
        new SizerPanel('200px','100px')
          ..horizontalAlignment = 'center'
          ..verticalAlignment = 'center'
          ..add(base));
    }
  }
}
