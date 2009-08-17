var grid;

var create  = TUBFORM.CreateAction('cliente', 'clientes');
var edit    = TUBFORM.EditAction('cliente', 'clientes');
var save    = TUBFORM.SaveAction('cliente', 'clientes');
var update  = TUBFORM.UpdateAction('cliente', 'clientes');
var destroy = TUBFORM.DestroyAction('clientes');

grid = new TUBFORM.GridPanel({
  columns: [
      {id:'id', header:'Cód.', width:15, sortable:true, dataIndex:'id'},
      {id:'nome', header:'nome', width:15, sortable:true, dataIndex:'nome'},
    ],
  title:'Listagem de clientes',
  renderTo: 'grid-clientes',
  entities: 'clientes'
});

