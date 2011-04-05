# coding: utf-8
class CommonController < Spree::BaseController
  #resource_controller
  helper :taxons
  #actions :production_by_type

  def production_by_type
    @taxon = Taxon.find_by_name params[:slug]
    @products = @taxon.products.paginate(:page => params[:page], :per_page => 6)
  end

  def product_by_type
    @taxon = Taxon.find_by_name params[:slug]
    @product = @taxon.products.find(params[:id])
  end

  private
    def collection
      @products = @taxon.products.find(params[:id])
    end
end
