# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found

  def after_sign_in_path_for(_resource)
    events_path # your path
  end

  def require_user
    # depending on your auth, something like...
    redirect_to root_path unless current_user
  end

  private

  def catch_not_found(e)
    if current_user
      Rails.logger.debug('We had a not found exception.')
      flash.alert = e.to_s
      redirect_to blazer.root_path
    else
      Rails.logger.debug('We had a not found exception.')
      flash.alert = e.to_s
      redirect_to pages_about
    end
  end
end
