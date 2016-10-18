class Shortener::ShortenedUrlsController < ActionController::Base

  def show
    token = ::Shortener::ShortenedUrl.extract_token(params[:id])
    Rails.logger.warn token
    url   = ::Shortener::ShortenedUrl.fetch_with_token(token: token, additional_params: params)
    Rails.logger.warn url
    redirect_to url[:url], status: :moved_permanently
  end

end
