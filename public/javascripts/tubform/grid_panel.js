TUBFORM.GridPanel = Ext.extend(Ext.grid.GridPanel, {

  constructor: function (config) {
    Ext.apply(this, config);

    Ext.apply(this, {
      viewConfig: {
        forceFit: true
      },
      sm: new Ext.grid.RowSelectionModel({singleSelect:true}),
      iconCls: 'icon-grid',
      height: 300,
      autoShow: true
    });

    this.loadStore();
    this.loadBar();

    TUBFORM.GridPanel.superclass.constructor.call(this);
  },

  loadStore: function(){
    this.store = new TUBFORM.Store({
      entities: this.entities
    });
    this.store.load({params:{start: 0, limit: 5, page:1}});
  },

  loadBar: function() {
    this.bbar = new TUBFORM.PagingToolbar({
      store: this.store,
      entity: this.entity,
      entities: this.entities
    });
  },

  onRender: function() {
    TUBFORM.GridPanel.superclass.onRender.apply(this, arguments);
  }

});

Ext.reg('tgrid', TUBFORM.GridPanel);