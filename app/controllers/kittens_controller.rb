class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash.now[:success] = "Meow! There's one more kitten!"
      redirect_to @kitten
    else
      flash.now[:error] = "Bark! Kitten details submitted incorrectly"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash.now[:success] = "Meow! You edited a kitten!"
      redirect_to @kitten
    else
      flash.now[:error] = "Bark! Kitten details submitted incorrectly"
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash.now[:success] = "You released a kitten into the wild!"
      redirect_to root_path, status: :see_other
    end
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
