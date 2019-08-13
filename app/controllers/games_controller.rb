require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    array = ('A'..'Z').to_a
    @a = 10.times.map { array.sample }
  end

  def score
    new
    @p = @a
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    input = open(url).read
    user = JSON.parse(input)
    @score = 0
    attempt_array = @word.upcase.split("").sort
    a_modi = []
    attempt_array.each { |e| a_modi << e && @a.delete_at(@a.index(e)) if @a.include? e }
    if user["found"] == true && a_modi == attempt_array
      @score = @word.length * 10
      @message = "Well done!"
    elsif user["found"] == false
      @message = "not an english word"
    elsif user["found"] == true
      @message = "Your word is not in the grid."
    else
      @message = "Your word is not in the grid, because of the overuse of letters."
    end
  end
end
