import 'package:controls_and_panels/controls_and_panels.dart';
import 'dart:html';
import 'dart:async';

void main(){

  var peaceImgPath = 'resource/image/peace_dove_icon.svg';
  var arrowImgPath = 'resource/image/green_down_arrow_icon.png';

  var sizerPanel = new AlignmentPanel();
  var rootStack = new StackPanel.horizontal();
  sizerPanel.add(rootStack);
  document.body.append(sizerPanel.html);
  
  var stackPanels = new List<StackPanel>();
  var stackPanel1 = new StackPanel.vertical();
  rootStack.add(stackPanel1);
  stackPanels.add(stackPanel1);

  var stackPanel2 = new StackPanel.vertical();
  rootStack.add(stackPanel2);
  stackPanels.add(stackPanel2);

  var stackPanel3 = new StackPanel.vertical();
  rootStack.add(stackPanel3);
  stackPanels.add(stackPanel3);

  var stackPanel4 = new StackPanel.vertical();
  rootStack.add(stackPanel4);
  stackPanels.add(stackPanel4);

  for(var stackPanel in stackPanels){
    var controls = new List<Base>()
    ..add(new Image(peaceImgPath, alt: 'Yomma!', width:95, height:95))
    ..add(new TextBox(placeholder:'Please enter first name'))
    ..add(new TextArea(rows: 4, cols: 20, placeholder:'Please enter first name'))
    ..add(new Label("Yomma!"))
    ..add(new Button.iconText(peaceImgPath, 'Peace', iconWidth:25, iconHeight:25));

    for(var base in controls){
      stackPanel.add(
        new AlignmentPanel('250px','100px')
          ..horizontalAlignment = 'center'
          ..verticalAlignment = 'center'
          ..add(base));
    }
  }
}
