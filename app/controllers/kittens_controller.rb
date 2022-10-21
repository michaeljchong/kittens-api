class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def show

  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Meow! There's one more kitten!"
      redirect_to @kitten
    else
      flash.now[:error] = "Bark! Kitten details submitted incorrectly"
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Meow! You edited a kitten!"
      redirect_to @kitten
    else
      flash.now[:error] = "Bark! Kitten details submitted incorrectly"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "You released a kitten into the wild!"
    redirect_to root_path, status: :see_other
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end
end
