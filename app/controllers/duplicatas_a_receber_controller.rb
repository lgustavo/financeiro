
class DuplicatasAReceberController < ApplicationController

  before_filter :load_duplicata, :only => [ :new, :edit, :update, :create, :destroy ]

  def index

    @per_page = params[:limit]
    params[:page]? @page = params[:page]: @page = 1

    @duplicatas = DuplicataAReceber.paginate(
      :page => @page,
      :per_page => @per_page,
      :order => 'updated_at DESC'
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
              {:name => 'data_de_emissao', :mapping => 'data_de_emissao'},
              {:name => 'cliente_id', :mapping => 'cliente_id'},
              {:name => 'data_de_vencimento', :mapping => 'data_de_vencimento'}
            ]
          },
          :results => @duplicatas,
          :total => @duplicatas.total_entries
        }.to_json(:include => [])

      }
    end

  end

  def new
    edit
  end

  def edit
    render :edit
  end

  private

  def load_duplicata
    @duplicata = params[:id] ? DuplicataAReceber.find( params[:id] ) : DuplicataAReceber.new
  end

end