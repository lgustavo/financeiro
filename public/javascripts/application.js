// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var TUBFORM = {}

TUBFORM.Application = function() {

    var viewport;

    var init = function() {

        viewport = new Ext.Viewport({
            autoLoad:true,
            layout:'border',
            items: [
                {
                    region: 'north',
                    title: 'ERP Tubform',
                    height:54,
                    tbar: {
                        items: [
                        {
                            xtype:'splitbutton',
                            text:'Financeiro',
                            menu:[{
                                    text:'Duplicatas a receber',
                                    handler: function() {
                                        var center = viewport.getComponent('center');
                                        center.add({
                                            id:'duplicatas_a_receber',
                                            autoLoad: {
                                                scripts:true,
                                                disableCaching:true,
                                                url:'/duplicatas_a_receber'
                                            }
                                        }).show();
                                        center.getActiveTab().setTitle('Contas a Receber');
                                        center.doLayout(true);
                                    }
                                }]
                        }]
                    }
                },
                {
                     region: 'south',
                     title: 'Sul',
                     html: 'Precisa de informação aqui?',
                     split: true,
                     height: 100,
                     minHeight: 100,
                     collapsible:true,
                     collapsed:true
                },
                {
                     region: 'center',id:'center',
                     xtype: 'tabpanel',
                    activeTab:0,
                     items: {
                       title: 'Default tab',
                       html: 'aqui vai alguma coisa'
                     }
                }
            ]
        });
    };

    return {
        init: function() {
            init();
        }
    };
}();

Ext.onReady(TUBFORM.Application.init);