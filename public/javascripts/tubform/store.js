TUBFORM.Store = Ext.extend(Ext.data.Store, {
  constructor: function (config) {

    Ext.apply(this, config);

    Ext.apply(this, {
      url: '/' + this.entities + '.json',
      reader: new Ext.data.JsonReader()
    });

    TUBFORM.Store.superclass.constructor.call(this);
  }
});

Ext.reg('tstore', TUBFORM.Store);

