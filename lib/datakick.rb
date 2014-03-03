require "json"
require "faraday"
require "hashie"
require "datakick/version"
require "datakick/item"

class Datakick

  def initialize(options = {})
    @host = options[:host] || "https://www.datakick.org"
    @version = options[:version] || 1
  end

  def item(gtin)
    response = http_client.get("/api/items/#{gtin}?version=#{@version}")
    if response.success?
      Item.new(JSON.parse(response.body))
    end
  end

  def update_item(gtin, attributes)
    response = http_client.put("/api/items/#{gtin}?version=#{@version}", attributes)
    if response.success?
      Item.new(JSON.parse(response.body))
    end
  end

  def add_image(gtin, image, image_type)
    params = {
      gtin: gtin,
      image: image,
      perspective: image_type
    }
    response = http_client.post("/api/items/#{gtin}/images?version=#{@version}", params)
    if response.success?
      JSON.parse(response.body)
    end
  end

  def items(params = {})
    response = http_client.get("/api/items?version=#{@version}", params)
    if response.success?
      JSON.parse(response.body).map do |item|
        Item.new(item)
      end
    end
  end

  def paginated_items(params, &block)
    response = http_client.get("/api/items?version=#{@version}", params)
    begin
      links = {}
      if response.success?
        JSON.parse(response.body).map do |item|
          yield Item.new(item)
        end

        # https://gist.github.com/davidcelis/5896686
        response.headers['Link'].to_s.split(',').each do |link|
          link.strip!
          parts = link.match(/<(.+)>; *rel="(.+)"/)
          links[parts[2]] = parts[1]
        end
      end
      # p links
    end while links["next"] and (response = http_client.get(links["next"]))
  end

  protected

  def http_client
    Faraday.new(url: @host) do |conn|
      conn.request :multipart
      conn.request :url_encoded
      conn.adapter :net_http
    end
  end

end
