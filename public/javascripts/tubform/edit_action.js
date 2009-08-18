TUBFORM.EditAction = function(entity, entities) {
  return function() {
    try {
      var id = grid.getSelectionModel().getSelected().get('id');
        janela = new TUBFORM.Window({
        title:'Alterar '+entity,
        autoLoad:{
          url: '/' + entities + '/edit/' + id
        },
        buttons:[{
          text: 'Salvar',
          handler: update
        }]
      });
      janela.show();
    } catch(e) {
      Ext.Msg.show({
      icon: Ext.MessageBox.WARNING,
      buttons: Ext.Msg.OK,
      title:'Atenção',
      msg:'Selecione um registro para alteração!'
    });
  };
 }
};