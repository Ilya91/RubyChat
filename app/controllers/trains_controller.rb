class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.all
  end
  def show; end
  def edit; end
  def new
    @train = Train.new
  end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to @train
    else
      render :new
    end

  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Railway station was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Train was successfully destroyed.' }
    end
  end

  private
  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :current_station_id)
  end
end
