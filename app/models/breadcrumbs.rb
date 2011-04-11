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

  def self.add_articles
    @@breadcrumbs << { :link => @@controller.articles_path, :title => "Статьи" }
    self
  end

  def self.add_article(article)
    @@breadcrumbs << { :link => @@controller.url_for(article.link), :title => article.title}
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

  def self.add_search(search_param)
    @@breadcrumbs << { :link => @@controller.products_path(:keywords => search_param), :title => "Поиск по запросу \"#{search_param}\"" }
    self
  end

  def self.add_product_with_search(product, search_param)
    @@breadcrumbs << { :link => @@controller.product_path(product, :keywords => search_param), :title => product.name}
    self
  end

  def self.add_cart
    @@breadcrumbs << { :link => @@controller.cart_path, :title => "Моя корзина" }
  end
end

