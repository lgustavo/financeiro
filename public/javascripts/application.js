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

                            ]
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
                       title: 'Home',
                       html: 'Página para apresentação da Empresa e outras informações importantes.'
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

