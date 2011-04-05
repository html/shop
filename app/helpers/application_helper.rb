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
end
