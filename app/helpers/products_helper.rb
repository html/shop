# coding: utf-8

module ProductsHelper
  def product_price(product_or_variant, options={})
    options.assert_valid_keys(:format_as_currency, :show_vat_text)
    options.reverse_merge! :format_as_currency => true, :show_vat_text => Spree::Config[:show_price_inc_vat]

    amount = product_or_variant.price
    amount += Calculator::Vat.calculate_tax_on(product_or_variant) if Spree::Config[:show_price_inc_vat]
    options.delete(:format_as_currency) ? format_price(amount, options) : amount
  end

  def format_price(price, options={})
    options.assert_valid_keys(:show_vat_text)
    options.reverse_merge! :show_vat_text => Spree::Config[:show_price_inc_vat]
    formatted_price = number_to_currency(price)
    if options[:show_vat_text]
      I18n.t(:price_with_vat_included, :price => formatted_price)
    else
      formatted_price
    end
  end
end
