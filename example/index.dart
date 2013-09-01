import 'package:controls_and_panels/controls_and_panels.dart';
import 'dart:html';
import 'dart:async';

void main() {

  var stackPanels = new List<StackPanel>();
  var stackPanel1 = new StackPanel.horizontal();
  document.body.children.add(stackPanel1.html);
  stackPanels.add(stackPanel1);

  var stackPanel2 = new StackPanel.horizontal();
  document.body.children.add(stackPanel2.html);
  stackPanels.add(stackPanel2);


  var stackPanel3 = new StackPanel.horizontal();
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
    print('you selected ${base.html.attributes['data-value']}');
  };

  for(var stackPanel in stackPanels){
    //Future<List<Base>>
    var controls = new List<Base>();
    controls.add(new Image('resource/image/peace_dove_icon.svg', alt: 'Yomma!', width:100, height:100));
    controls.add(new TextBox('Please enter first name'));
    controls.add(new Label("Yomma!"));
    controls.add(new Button(
        new StackPanel.horizontal(
          [
           new Image('resource/image/peace_dove_icon.svg', alt: 'Yomma!', width:50, height:50),
           new Label('Peace')
          ]
        )
    ));
    for(var base in controls){
      stackPanel.add(base);
      /*stackPanel.add(
          new SizerPanel('200px','100px')
          ..add(base));*/
    }
  }
}