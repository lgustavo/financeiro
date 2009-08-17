grid = new TUBFORM.GridPanel({
  columns: [
      {id:'id', header:'Cód.', width:15, sortable:true, dataIndex:'id'},
      {id:'nome', header:'nome', width:15, sortable:true, dataIndex:'nome'},
    ],
  title:'Listagem de clientes',
  renderTo: 'grid-clientes',
  entities: 'clientes'
});

