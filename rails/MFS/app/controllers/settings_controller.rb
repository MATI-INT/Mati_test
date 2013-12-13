class SettingsController < ApplicationController
  def change_locale
    locale = params[:locale]
    locale = :en unless %w(ru en).include?(locale.to_s)
    I18n.locale = locale.to_sym
    cookies.permanent[:mfs_locale] = locale.to_sym
    redirect_to root_url
  end
end