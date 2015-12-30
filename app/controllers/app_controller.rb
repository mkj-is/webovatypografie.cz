
require 'truty'

class AppController < ActionController::Base

  layout 'application'

  @@features = [:hyphens, :quotes, :ellipsis, :dashes, :abbreviations, :prepositions, :numbers, :dates, :characters, :brackets, :multiplication, :units, :widows]

  def index
    if params[:input] then
      @in = params[:input]
      escape = :none
      escape = :html if @in[:escape] == "1"
      language = @in[:language].downcase.to_s
      @fixed_text = Truty.convert(@in["text"], escape, language)
      @input = OpenStruct.new(params[:input])
    else
      defaults = {}
      @@features.each do |feature|
        defaults[feature] = 1
      end
      defaults[:language] = :czech
      @input = OpenStruct.new(defaults)
    end
  end

  def about
  end
  
end
