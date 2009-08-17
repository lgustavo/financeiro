var TUBFORM = {}
TUBFORM.Application = function() {
    var viewport;
    var init = function() {
        viewport = new Ext.Viewport({
            autoLoad:true,
            layout:'border',
            items: [
                { region: 'north', title: 'ERP Tubform', height:54, tbar: { items: [
                        {
                            xtype:'splitbutton',
                            text:'Cadastros',
                            menu:[
                                {
                                    text:'Clientes', handler: function() {
                                        var center = viewport.getComponent('center');
                                        center.add({ id:'clientes', autoLoad: {
                                                scripts:true,
                                                disableCaching:true,
                                                url:'/clientes'
                                            }}).show();
                                        center.getActiveTab().setTitle('Cadastro de Clientes');
                                        center.doLayout(true);
                                    }
                                }]
                        },
                        {
                            xtype:'splitbutton',
                            text:'Financeiro',
                            menu:[
                                {
                                    text:'Duplicatas a receber', handler: function() {
                                        var center = viewport.getComponent('center');
                                        center.add({ id:'duplicatas_a_receber', autoLoad: {
                                                scripts:true,
                                                disableCaching:true,
                                                url:'/duplicatas_a_receber'
                                            }}).show();
                                        center.getActiveTab().setTitle('Duplicatas a Receber');
                                        center.doLayout(true);
                                    }, iconCls: 'feed-icon'
                                },
                                {
                                    text:'Duplicatas a Pagar', handler: function() {
                                        var center = viewport.getComponent('center');
                                        center.add({ id:'duplicatas_a_pagar', autoLoad: {
                                                scripts:true,
                                                disableCaching:true,
                                                url:'breve.html'
                                            }}).show();
                                        center.getActiveTab().setTitle('Duplicatas a Pagar');
                                        center.doLayout(true);
                                    }
                                }
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

