class HomeController < ApplicationController
  # index page method
  def index; end

  # breed from method
  def breed; end

  # fetch breed
  def fetch_breed
    @dog_service = DogApiService.new(breed)
    @image_url   = @dog_service.fetch_image

    if @dog_service.success
      @message = "Successfully fetched image for #{breed.join(' ')}."
    else
      @message = "No image found for #{breed.join(' ')}."
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def breed
    @breed ||= params[:breedInput].split(' ').uniq
  end
end
