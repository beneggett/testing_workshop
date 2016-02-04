class Giphy
  require 'blanket'
  def self.get(term)
    gif = giphy.gifs.translate.get(params: {s: term} )
    gif.data.images.original.url
  end

  def self.giphy
    Blanket.wrap "http://api.giphy.com/v1/", params: {api_key: ENV["GIPHY_API_KEY"]}
  end
end
