require_relative "test_helper"

class TestDatakick < Minitest::Test

  def test_item
    item = datakick.item("000000000000")
    assert_equal "00000000000000", item.gtin14
  end

  def test_item_not_found
    assert_nil datakick.item("000000000001")
  end

  def test_update_item
    name = "Test #{rand(100)}"
    item = datakick.update_item("000000000000", {name: name})
    assert_equal name, item.name
  end

  def test_add_image
    image = Faraday::UploadIO.new("/Users/andrew/Desktop/ice_cream.jpg", "image/jpeg")
    assert datakick.add_image("000000000000", image, "photo")
  end

  def test_items
    assert_kind_of Array, datakick.items
  end

  def test_items_query
    assert_kind_of Array, datakick.items(query: "test")
  end

  def test_paginated_items
    items = []
    datakick.paginated_items(per_page: 1000) do |item|
      # p item
      items << item
    end
    # p items.size
    assert_kind_of Array, items
  end

  protected

  def datakick
    Datakick.new(host: "http://0.0.0.0:5000")
  end

end
