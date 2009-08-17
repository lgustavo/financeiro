class ClientesController < ApplicationController

  before_filter :load_page, :only => :index
  before_filter :load_cliente, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @clientes = Cliente.paginate( :page => @page,
                                  :per_page => @per_page,
                                  :include => [] )

    respond_to do |format|
      format.html #index.html.haml
      format.json { render :json => { :metaData => { :totalProperty => 'total',
                                                     :root => 'results',
                                                     :id => 'id',
                                                     :fields => [
                                                       {:name => 'id', :mapping => 'id'},
                                                       {:name => 'nome', :mapping => 'nome'}
                                                     ]
                                                   },
                                      :results => @clientes,
                                      :total => @clientes.total_entries

                                    }.to_json(:include => [])
                  }
    end
  end

  def new; end
  def edit; end

  def create
    create_or_update
  end

  def update
    create_or_update
  end

  def destroy
    @cliente.destroy

    respond_to do |format|
      format.json  { head :ok }
    end
  end

  protected

  def load_cliente
    @cliente = params[:id].blank? ? Cliente.new : Cliente.find(params[:id])
  end

  def create_or_update
    if @cliente.update_attributes(params[:cliente])
      respond_to do |format|
        format.json  { render :json => @cliente,
                              :status => :created,
                              :location => @cliente }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @cliente.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json  { render :json => { :success => 'false',
                                         :errors => @errors
                                       },
                              :location => @cliente,
                              :status => :unprocessable_entity
                     }
      end
    end
  end
end

