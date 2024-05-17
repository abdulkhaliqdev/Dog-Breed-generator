class DogApiService
  attr_reader   :breeds, :url
  attr_accessor :success

  def initialize(breeds)
    @breeds  = breeds
    @url     = "https://dog.ceo/api/breed/#{generate_breed_uri}/images/random"
    @success = false
  end

  def fetch_image
    response = HTTParty.get(url)

    if response.success?
      data = JSON.parse(response.body)
      if data['status'] == 'success'
        @success = true
        data['message']
      else
        "No image found for #{breeds.join(' ')}."
      end
    else
      "Failed to fetch data for #{breeds.join(' ')} Dog."
    end
  end

  private

  def generate_breed_uri
    @generate_breed_uri ||= breeds.join('/')
  end
end
