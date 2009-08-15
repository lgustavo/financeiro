require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Dado /^que existe\(m\) (\d+) registro\(s\) de (.+)$/ do |n, model_str|
  model_str = model_str.gsub(/\s/, '_')
  model_sym = model_str.to_sym
  classe = model_str.camelize.constantize
  classe.transaction do
    classe.destroy_all
    n.to_i.times do
      Factory(model_sym)
    end
  end
end

Dado /^que existem os seguintes registros de (.+):$/ do |model_str,tabela|
  model_str = model_str.gsub(/\s/, '_')
  model_sym = model_str.to_sym
  klass = model_str.camelize.constantize
  klass.transaction do
    klass.destroy_all
    tabela.hashes.each do |hash|
      Factory(model_sym, hash)
    end
  end
end

Dado /^que estou em (.+)$/ do |nome_da_pagina|
  visit path_to(nome_da_pagina)
end

Dado /^defino (.+) como "([^\"]*)"$/ do |campo, valor|
  fill_in(campo, :with => valor)
end

Quando /^eu estiver em (.+)$/ do |nome_da_pagina|
  visit path_to(nome_da_pagina)
end

Quando /^peço para (.+)$/ do |acao|
  click_button acao.capitalize
end

Quando /^seleciono "([^\"]*)" como data e hora$/ do |time|
  select_datetime(time)
end

Então /^preciso ver "([^\"]*)"$/ do |texto|
  response.should contain(texto)
end

Então /^preciso ver os seguintes registros:$/ do |tabela|
  tabela.hashes.each do |hash|
    hash.each_value do |valor|
      response.should contain(valor)
    end
  end
end

Então /^não devo ver os seguintes registros:$/ do |tabela|
  tabela.hashes.each do |hash|
    hash.each_value do |valor|
      response.should_not contain(valor)
    end
  end
end