# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

 ActiveSupport::Inflector.inflections do |inflect|
   inflect.irregular 'duplicata_a_receber', 'duplicatas_a_receber'
   inflect.irregular 'grupo_de_despesas', 'grupos_de_despesas'
   inflect.irregular 'vendedor', 'vendedores'
   inflect.uncountable 'plano_de_contas'
 end