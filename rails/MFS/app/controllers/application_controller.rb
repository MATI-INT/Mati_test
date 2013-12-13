#encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :set_locale

  protect_from_forgery
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    #flash[:error] = 'Доступ закрыт.'
    #redirect_to root_url
    redirect_to '/404'
  end

  def is_authenticated
    unless current_user
      flash[:error] = 'You are not authorized to do that!'
      redirect_to root_url
    end
  end

  def set_locale
    if cookies[:mfs_locale]
      locale = cookies[:mfs_locale]
      locale = :en unless %w(ru en).include?(locale.to_s)
      I18n.locale = locale.to_sym
    end
  end
end
