# Datakick

Ruby client for [Datakick](https://www.datakick.org/) - the open product database

## Get Started

Add this line to your application’s Gemfile:

```ruby
gem 'datakick'
```

Create a client

```ruby
datakick = Datakick.new
```

Get an item

```ruby
item = datakick.item("013562610020") # or nil if not found
item.gtin14
item.brand_name
item.name
item.size
```

List items

```ruby
datakick.items
```

Returns the first 100 items.

To get all items, use:

```ruby
datakick.paginated_items do |item|
  item.gtin14
end
```

Search items

```ruby
datakick.items(query: "peanut butter")
```

Update item

```ruby
datakick.update_item("000000000000", {name: "Test"})
```

Add photo

```ruby
image = Faraday::UploadIO.new("ice_cream.jpg", "image/jpeg")
image_type = "scan" # or "photo"
datakick.add_image("000000000000", image, image_type)
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/datakick/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/datakick/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
