
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
      if @in["text"].length == 0 then
        @in["text"] = "Nebyl vložen žádný text pro konverzi."
      end

      features = []
      for key, value in params[:input].keys
        features << key.to_sym if value == 1
      end

      @fixed_text = ERB::Util.html_escape(Truty.convert(@in["text"], escape, language, features))
      @fixed_text.gsub!(/\n+/, '</p><p>')
      @fixed_text.gsub!('&amp;#13;&amp;#10;', '</p><p>')
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
