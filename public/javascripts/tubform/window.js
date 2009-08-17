TUBFORM.Window = Ext.extend(Ext.Window, {
  constructor: function (config) {

    Ext.apply(this, config);

    Ext.apply(this, {
      height:400,
      width:500,
      autoScroll:true,
      modal:true
    });

    TUBFORM.Window.superclass.constructor.call(this);
  }
});

Ext.reg('twindow', TUBFORM.Window);

