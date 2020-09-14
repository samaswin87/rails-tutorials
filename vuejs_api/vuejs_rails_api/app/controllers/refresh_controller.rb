class RefreshController < ApplicationController

  before_action :authorize_refresh_request!

  def create
    session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
    tokens = session.refresh_by_access_allowed do
      raise JWTSession::Errors::Unauthorized, 'Something went wrong'
    end

    response.set_cookie(JWTSession.access_cookie,
                        value: token[:access],
                        httponly: true,
                        secure: Rails.env.production?)

    render json: { csrf: tokens[:csrf] }
  end

end
