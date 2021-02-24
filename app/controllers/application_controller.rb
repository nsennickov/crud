# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include FastGettext::Translation
  FastGettext.add_text_domain('app', path: 'locale', type: :po)

  before_action :set_locale

  def set_locale
    FastGettext.available_locales = ['de', 'en', 'ru']
    FastGettext.default_text_domain = 'app'
    FastGettext.set_locale(params[:locale] || session[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'])
    session[:locale] = I18n.locale = FastGettext.locale
  end
end
