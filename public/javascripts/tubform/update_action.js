TUBFORM.UpdateAction = function(entity, entities) {
  return function() {
    var id = grid.getSelectionModel().getSelected().get('id');
    Ext.Ajax.request({
      url:'/'+entities+'/'+id,
      form: 'edit_'+entity+'_'+id,
      method:'PUT',
      callback: function(options, success, response) {
        if(success) {
          grid.store.reload();
          janela.close();
        } else {
          var errorData = Ext.util.JSON.decode(response.responseText);

          var errors = '';

          for ( key in errorData.errors)
            errors = errors + key + ' - ' + errorData.errors[key] + '<br />';

          Ext.Msg.show({
            minWidth: 300,
            icon: Ext.MessageBox.WARNING,
            buttons: Ext.Msg.OK,
            title:'Atenção',
            msg: errors
          });
        };
      }
    });
  };
};

