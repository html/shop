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
    image_tag product.images.first.attachment.url(:product_list)
  end
end
