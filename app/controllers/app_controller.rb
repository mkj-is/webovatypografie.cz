
require 'truty'

class AppController < ActionController::Base

  layout 'application'

  def index
    if params[:input] then
      @in = params[:input]
      escape = :none
      escape = :html if @in[:escape] == "1"
      language = @in[:language].downcase.to_s
      @fixed_text = Truty.convert(@in["text"], escape, language)
    end
  end
end
