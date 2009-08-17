Ext.BLANK_IMAGE_URL = 'javascripts/ext/resources/images/default/s.gif';
Ext.ns('TUBFORM');
Ext.Ajax.method = 'GET';

TUBFORM.App = function() {

  return {

    init: function(){

      var menuCadastros = new Ext.menu.Menu({
        items: [
          {
            text:'Clientes',
            url: 'clientes',
            handler: function() {
              centerPanel.add({
                closable: true,
                autoLoad: {
                            scripts:true,
                            disableCaching:true,
                            url:'/clientes'
                }
              }).show();
              centerPanel.getActiveTab().setTitle('Clientes');
              centerPanel.doLayout(true);
            }
          }
        ]
      });

      var menuFinanceiro = new Ext.menu.Menu({
        items: [
          {
            text:'Duplicatas a receber',
            handler: function() {
              centerPanel.add({
                id:'duplicatas_a_receber_path',
                closable: true,
                autoLoad: {
                            scripts:true,
                            disableCaching:true,
                            url:'/duplicatas_a_receber'
                }
              }).show();
              centerPanel.getActiveTab().setTitle('Duplicatas a Receber');
              centerPanel.doLayout(true);
            }
          }
        ]
      });

      var northBar = new Ext.Toolbar({
        items: [
          {
            xtype: 'splitbutton',
            text:'Cadastros',
            menu: menuCadastros
          },
          {
            xtype: 'splitbutton',
            text:'Financeiro',
            menu: menuFinanceiro
          }
        ]
      });

      var northPanel = new Ext.Panel({
        id: 'northPanel',
        region: 'north',
        title: 'ERP Tubform',
        height: 54,
        tbar: northBar
      });

      var centerPanel = new Ext.TabPanel({
        id: 'centerPanel',
        region: 'center',
        activeTab: 0,
        items:[{
          title: 'Principal',
          closable: false
        }]
      });

      var viewport = new Ext.Viewport ({
        layout: 'border',
        items:[
          northPanel,
          centerPanel
        ]
      });

    }
  }

}();

Ext.onReady(function(){

  Ext.QuickTips.init();
  TUBFORM.App.init();
});

