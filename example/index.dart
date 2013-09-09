import 'package:controls_and_panels/controls_and_panels.dart';
import 'dart:html';
import 'dart:async';

void main() {

  var imgPath = 'resource/image/peace_dove_icon.svg';

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

  var comboList = new List<Base>()
      ..add(new Label('one')..html.attributes['data-value'] = 'one')
      ..add(new Label('two')..html.attributes['data-value'] = 'two')
      ..add(new Label('three')..html.attributes['data-value'] = 'three');

  var getItemList = (){
    var completer = new Completer();
    completer.complete(comboList);
    return completer.future;
  };

  var processSelection = (Base base){
    print('you selected ${base.html.dataset['value']}');
  };

  for(var stackPanel in stackPanels){
    //Future<List<Base>>
    var controls = new List<Base>();
    controls.add(new Image(imgPath, alt: 'Yomma!', width:95, height:95));
    controls.add(new TextBox('Please enter first name'));
    controls.add(new TextArea(rows: 4, cols: 20, placeholder:'Please enter first name'));
    controls.add(new Label("Yomma!"));
    controls.add(new Button.iconText(imgPath, 'Peace', iconWidth:25, iconHeight:25));
    for(var base in controls){
      stackPanel.add(
        new SizerPanel('200px','100px')
          ..horizontalAlignment = 'center'
          ..verticalAlignment = 'center'
          ..add(base));
    }
  }
}
