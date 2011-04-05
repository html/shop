# coding: utf-8

class Breadcrumbs
  @@breadcrumbs = []
  @@controller
  cattr_reader :breadcrumbs

  def self.reset_breadcrumbs
    @@breadcrumbs = nil
    @@breadcrumbs = []
  end

  def self.add_main
    @@breadcrumbs << { :link => '/', :title => "Главная" }
    self
  end

  def self.add_manufacturer(manufacturer)
    @@breadcrumbs << { :link => @@controller.by_manufacturer_path(manufacturer.name), :title => manufacturer.name }
    self
  end

  def self.add_product_by_manufacturer(manufacturer, product)
    @@breadcrumbs << { :link => @@controller.product_by_manufacturer_path(manufacturer.name), :title => product.name }
    self
  end

  def self.add_product_by_type(product_type, product)
    @@breadcrumbs << { :link => @@controller.product_by_type_path(product_type.name, product.id), :title => product.name }
    self
  end

  def self.add_product_by_type_and_manufacturer(manufacturer, product_type, product)
    @@breadcrumbs << { :link => @@controller.product_by_manufacturer_and_type_path(manufacturer.name, product_type.name, product.id), :title => product.name }
    self
  end

  def self.add_type_after_manufacturer(manufacturer, product_type)
    @@breadcrumbs << { :link => @@controller.by_manufacturer_and_type_path(manufacturer.name, product_type.name), :title => product_type.name }
    self
  end

  def self.add_type(product_type)
    @@breadcrumbs << { :link => @@controller.by_type_path(product_type.name), :title => product_type.name }
    self
  end

  def self.set_controller(controller)
    @@controller = controller
  end
end

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
      @products = @taxon.products
    else
      @products = @taxon.products.paginate(:page => params[:page], :per_page => 6)
    end
    Breadcrumbs.add_main.add_type(@taxon)
  end

  def production_by_manufacturer
    @taxon = Taxon.find_by_name params[:manufacturer]
    Breadcrumbs.add_main.add_manufacturer(@taxon)

    if params[:page] && params[:page] == 'all'
      @products = @taxon.products
    else
      @products = @taxon.products.paginate(:page => params[:page], :per_page => 6)
    end
  end

  def production_by_manufacturer_and_type
    @manufacturer = Taxon.find_by_name params[:manufacturer]
    @type = Taxon.find_by_name params[:slug]

    if params[:page] && params[:page] == 'all'
      @products = @manufacturer.products
    else
      @products = @manufacturer.products.paginate(:page => params[:page], :per_page => 6, :joins => :taxons)
    end

    Breadcrumbs.add_main.add_manufacturer(@manufacturer).add_type_after_manufacturer(@manufacturer, @type)
  end

  def product_by_type
    @taxon = Taxon.find_by_name params[:slug]
    @product = @taxon.products.find(params[:id])

    Breadcrumbs.add_main.add_type(@taxon).add_product_by_type(@taxon, @product)
  end

  def product_by_manufacturer
    @taxon = Taxon.find_by_name params[:manufacturer]
    @product = @taxon.products.find(params[:id])

    Breadcrumbs.add_main.add_manufacturer(@taxon).add_product_by_manufacturer(@taxon, @product)

    render :product_by_type
  end

  def product_by_manufacturer_and_type
    @manufacturer = Taxon.find_by_name params[:manufacturer]
    @product_type = Taxon.find_by_name params[:slug]
    @product = @manufacturer.products.find(params[:id])

    Breadcrumbs.add_main.add_manufacturer(@manufacturer).add_type_after_manufacturer(@manufacturer, @product_type).add_product_by_type_and_manufacturer(@manufacturer, @product_type, @product)

    render :product_by_type
  end
end
