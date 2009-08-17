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
Ext.Ajax.method = 'GET';

if(!TUBFORM) {
    var TUBFORM = {};
}

TUBFORM.Duplicatas = function() {
    var grid;
    var store = new Ext.data.Store({
        url:'/duplicatas_a_receber.json',
        reader: new Ext.data.JsonReader()
    });
    var window_duplicatas;
    var columns = [
        {header:'Código', dataIndex:'id', width:80},
        {header:'Emissão', width:80,
            renderer: function(value) {
                return Date.parseDate(value, 'Y-m-d').format('d/m/Y');},
            dataIndex:'data_de_emissao' },
        {header:'Cliente', dataIndex:'cliente_id', width:300},
        {header:'Vencimento', width:80,
            renderer: function(value) {
                return Date.parseDate(value, 'Y-m-d').format('d/m/Y');},
          dataIndex:'data_de_vencimento'},
        {header:'Valor', renderer: 'usMoney', dataIndex:'valor', width:100 }
    ];
    var bbar = new Ext.PagingToolbar({
        pageSize:10,
        setStore:store,
        displayInfo:true,
        items: [
            {
                pressed:'true', enableToggle:true, text:'Adicionar',
                toggleHandler: function() {
                    window_duplicatas = new Ext.Window({
                        title:'Nova Duplicata', width: 300, height:300,modal:true,
                        autoLoad: { scripts:true, url:'/duplicatas_a_receber/new' }
                    });
                    window_duplicatas.show();
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
              bbar:bbar });
            store.load({params:{start:0, limit:10, page:1}});
     };

    return {
      init:init
    };
}();

Ext.onReady(TUBFORM.Duplicatas.init);