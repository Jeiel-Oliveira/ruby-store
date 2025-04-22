class ApplicationController < ActionController::Base
  include Authentication

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :switch_locale
  before_action :cart_items_count

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  private

  def cart_items_count
    @cart_items_count = LineItem.where(cart_id: session[:cart_id])
      .sum(:quantity)
  end
end
