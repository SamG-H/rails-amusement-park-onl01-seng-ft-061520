class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end
  
  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    set_attraction
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def edit
    set_attraction
  end

  def update
    set_attraction
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def destroy
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets,
                                       :happiness_rating, :nausea_rating)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
  
end
