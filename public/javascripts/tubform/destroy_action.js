TUBFORM.DestroyAction = function(entities) {
  return function() {
    try {
      var id = grid.getSelectionModel().getSelected().get('id');
      Ext.Ajax.request({
        url: '/' + entities + '/'+id+'.json',
        method:'DELETE',
        callback: function(options, success, response) {
          if(success) {
            grid.store.reload();
          } else {
            Ext.Msg.show({
              icon: Ext.MessageBox.WARNING,
              buttons: Ext.Msg.OK,
              title:'Atenção',
              msg: response.responseText
            });
          };
        }
      });
    } catch(e) {
      Ext.Msg.show({
        icon: Ext.MessageBox.WARNING,
        buttons: Ext.Msg.OK,
        title:'Atenção',
        msg:'Selecione um registro para exclusão!'
      });
    };
  }
};

