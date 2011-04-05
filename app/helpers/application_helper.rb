# coding: utf-8

module ApplicationHelper
  def paginate_items(items)
    content_for :pagination do
      will_paginate items
    end
  end

  def product_price(product)
    product.master.price.to_s + " грн."
  end

  def display_product_image_for_list(product)
    image = product.images.first
    image_tag image.attachment.url(:product_list), :title => image.alt, :alt => image.alt
  end

  def display_product_image_for_item(product)
    image = product.images.first
    image_tag image.attachment.url(:product_view), :title => image.alt, :alt => image.alt
  end
end
