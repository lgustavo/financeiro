Ext.override(Ext.PagingToolbar, {
  doLoad: function(start) {
    var o = {};
    var pn = this.paramNames;
    o[pn.start] = start;
    o[pn.limit] = this.pageSize;
    o['page'] = Math.ceil((start+this.pageSize)/this.pageSize);
    if(this.fireEvent('beforechange', this, o) !== false) {
      this.store.load({params:o});
    }
  }
});

Tubform.Clientes = function() {
  var grid;
  var store = new Ext.data.Store({
    url:'/clientes.json',
    reader: new Ext.data.JsonReader()
  });

  var window_clientes;

  var columns = [
    {id:'id', header:'Cód.', width:15, sortable:true, dataIndex:'id'},
    {id:'nome', header:'Nome.', width:150, sortable:true, dataIndex:'nome'}
  ];

  var bbar = new Ext.PagingToolbar({
    pageSize:10,
    setStore:store,
    displayInfo:true,
    items: [
      {
        pressed:'true', enableToggle:true, text:'Adicionar',
        toggleHandler: function() {
          window_clientes = new Ext.Window({
            title:'Novo Cliente',
            width: 300,
            height:300,
            modal:true,
            autoLoad: { scripts:true, url:'/cliente/new' }
          });
        window_clientes.show();
        }
      }
    ]
  });

  var init = function() {
    grid = new Ext.grid.GridPanel({
      border:true,
      sm: new Ext.grid.RowSelectionModel({ singleSelect:true }),
      renderTo:'grid',
      viewConfig: { forceFit: true },
      height:300,
      store:store,
      columns:columns,
      bbar:bbar
    });
    store.load({params:{start:0, limit:10, page:1}});
  };

  return {
    init:init
  };
}();

Ext.onReady(Tubform.Clientes.init);

