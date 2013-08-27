/*
 * 0xor1  http://github.com/0xor1
 */


part of controls_and_panels;


const String COMBO_BOX = 'combo-box';


typedef Future<List<Base>> GetItemList();


typedef void ProcessSelectedItem(Base base);


class ComboBox extends Control{


  GetItemList getItemList;


  ProcessSelectedItem processSelection;


  ComboBox(GetItemList getItems, ProcessSelectedItem selectionProcessor){

    _insertComboBoxStyleElement();

    getItemList = getItems;

    processSelection = selectionProcessor;

    html.classes.add(COMBO_BOX);

    var stackPanel = new StackPanel.horizontal(
      [
        new StackPanel.vertical(
          [

          ]
        ),
      ]
    );

  }


}