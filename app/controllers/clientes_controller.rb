class ClientesController < ApplicationController
  before_filter :load_cliente, :only => [ :new, :edit, :update, :create, :destroy ]
  def index
    @per_page = params[:limit]
    params[:page]? @page = params[:page]: @page = 1
    @clientes = Cliente.paginate(
      :page => @page,
      :per_page => @per_page,
      :order => 'nome'
      )

    respond_to do |format|
      format.html
      format.json {
        render :json => {
          :metadata => {
            :totalProperty => 'total',
            :root => 'results',
            :id => 'id',
            :fields => [
              {:name => 'id', :mapping => 'id'},
              {:name => 'nome', :mapping => 'nome'},
              {:name => 'cpf', :mapping => 'cnpj'},
              {:name => 'cnpj', :mapping => 'cnpj'},
              {:name => 'saldo_devedor', :mapping => 'saldo_devedor'}
            ]
          },
          :results => @clientes, :total => @clientes.total_entries
        }.to_json(:include => [])

      }
    end
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  private

  def load_cliente
    @cliente = params[:id] ? Cliente.find( params[:id] ) : Cliente.new
  end

end

