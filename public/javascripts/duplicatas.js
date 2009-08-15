Ext.override(Ext.PagingToolbar, {
   doLoad: function(start) {
       var o = {}, pn = this.paramNames;
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
        {header:'Data atualização', dataIndex:'update_at', width:80}
    ];
    var bbar = new Ext.PagingToolbar({
        pageSize:10,
        store:store,
        displayInfo:true,
        items: [
            {
                pressed:'true', enableToggle:true, text:'Adicionar',
                toggleHandler: function() {
                    window_duplicatas = new Ext.Window({
                        title:'Cadastrar Duplicata',
                        width: 300,
                        height:300,modal:true,
                        autoLoad: {
                            scripts:true,
                            url:'/duplicatas_a_receber/new'
                        }
                    });
                    window_duplicatas.show();
                }
            }
        ]
    });

    var init = function() {
        grid = new Ext.grid.GridPanel({
            border:true,
            sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
            renderTo:'grid',
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

Ext.onReady(TUBFORM.Duplicatas.init);