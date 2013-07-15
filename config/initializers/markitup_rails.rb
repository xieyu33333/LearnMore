Markitup::Rails.configure do |config|
  config.layout = "markitup"  # default is `markitup`
  config.formatter = -> markup { BBCodeParser.parse(markup) }
end