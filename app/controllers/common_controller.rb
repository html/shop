# coding: utf-8

class CommonController < Spree::BaseController
  #resource_controller
  helper :taxons
  #actions :production_by_type
  before_filter do|c|
    Breadcrumbs.reset_breadcrumbs
    Breadcrumbs.set_controller(c)
  end

  def main
    Breadcrumbs.add_main
  end

  def production_by_type
    @taxon = Taxon.find_by_name params[:slug]
    if params[:page] && params[:page] == 'all'
      @products = @taxon.products.available
    else
      @products = @taxon.products.available.paginate(:page => params[:page], :per_page => 6)
    end
    Breadcrumbs.add_main.add_type(@taxon)
  end

  def production_by_manufacturer
    @taxon = Taxon.find_by_name params[:manufacturer]
    Breadcrumbs.add_main.add_manufacturer(@taxon)

    if params[:page] && params[:page] == 'all'
      @products = @taxon.products.available
    else
      @products = @taxon.products.available.paginate(:page => params[:page], :per_page => 6)
    end
  end

  def production_by_manufacturer_and_type
    @manufacturer = Taxon.find_by_name params[:manufacturer]
    @type = Taxon.find_by_name params[:slug]

    if params[:page] && params[:page] == 'all'
      @products = @manufacturer.products.available
    else
      @products = @manufacturer.products.available.paginate(:page => params[:page], :per_page => 6, :joins => :taxons)
    end

    Breadcrumbs.add_main.add_manufacturer(@manufacturer).add_type_after_manufacturer(@manufacturer, @type)
  end

  def product_by_type
    @taxon = Taxon.find_by_name params[:slug]
    @product = @taxon.products.available.find(params[:id])

    Breadcrumbs.add_main.add_type(@taxon).add_product_by_type(@taxon, @product)
  end

  def product_by_manufacturer
    @taxon = Taxon.find_by_name params[:manufacturer]
    @product = @taxon.products.available.find(params[:id])

    Breadcrumbs.add_main.add_manufacturer(@taxon).add_product_by_manufacturer(@taxon, @product)

    render :product_by_type
  end

  def product_by_manufacturer_and_type
    @manufacturer = Taxon.find_by_name params[:manufacturer]
    @product_type = Taxon.find_by_name params[:slug]
    @product = @manufacturer.products.available.find(params[:id])

    Breadcrumbs.add_main.add_manufacturer(@manufacturer).add_type_after_manufacturer(@manufacturer, @product_type).add_product_by_type_and_manufacturer(@manufacturer, @product_type, @product)

    render :product_by_type
  end

  def articles
    Breadcrumbs.add_main.add_articles
  end
end
