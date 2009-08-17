TUBFORM.CreateAction = function(entity, entities) {
  return function() {
    janela = new TUBFORM.Window({
      title: 'Novo ' + entity,
      autoLoad: {
        url: '/' + entities + '/new'
      },
      buttons:[{
        text: 'Salvar',
        handler: save
      }]
    });
    janela.show();
  }
};

