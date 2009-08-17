class DuplicatasAReceberController < ApplicationController

  before_filter :load_page, :only => :index
  before_filter :load_duplicata, :only => [ :edit, :new, :create, :update, :destroy ]

  def index
    @duplicatas = DuplicataAReceber.paginate( :page => @page, :per_page => @per_page, :include => [] )

    respond_to do |format|
      format.html #index.html.haml
      format.json { render :json => { :metaData => { :totalProperty => 'total',
                                                     :root => 'results',
                                                     :id => 'id',
                                                     :fields => [
                                                          {:name => 'id', :mapping => 'id'},
                                                          {:name => 'data_de_emissao', :mapping => 'data_de_emissao'},
                                                          {:name => 'cliente_id', :mapping => 'cliente_id'},
                                                          {:name => 'data_de_vencimento', :mapping => 'data_de_vencimento'},
                                                          {:name => 'valor', :mapping => 'valor'}
                                                     ]
                                                   },
                                      :results => @duplicatas,
                                      :total => @duplicatas.total_entries

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
    @duplicata.destroy

    respond_to do |format|
      format.json  { head :ok }
    end
  end

  protected
  def load_duplicata
    @duplicata = params[:id].blank? ? DuplicataAReceber.new : DuplicataAReceber.find(params[:id])
  end

  def create_or_update
    if @duplicata.update_attributes(params[:duplicata_a_receber])
      respond_to do |format|
        format.json  { render :json => @duplicata,
                              :status => :created,
                              :location => @duplicata }
      end
    else
      respond_to do |format|
        @errors = Hash.new
        @duplicata.errors.each do |attr, msg|
          @errors[attr] = msg
        end

        format.json  { render :json => { :success => 'false',
                                         :errors => @errors
                                       },
                              :location => @duplicata,
                              :status => :unprocessable_entity
                     }
      end
    end
  end


end