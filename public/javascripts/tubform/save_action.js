TUBFORM.SaveAction = function(entity, entities) {
  return function() {
  Ext.Ajax.request({
    url:'/'+entities,
    form: 'new_'+entity,
    method:'POST',
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

