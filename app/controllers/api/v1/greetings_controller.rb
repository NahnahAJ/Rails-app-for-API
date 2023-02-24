class Api::V1::GreetingsController < ApplicationController
  def index
    @greetings = Greeting.order('RANDOM()').limit(1)
    render json: @greetings
  end

  def create
    @greeting = Greeting.create(greeting_params)
    if @greeting.save
      render json: @greeting
    else
      render json: { error: 'Error creating greeting' }
    end
  end

  def greeting_params
    params.require(:greeting).permit(:greeting)
  end
end
