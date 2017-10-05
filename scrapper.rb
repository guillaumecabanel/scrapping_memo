require 'open-uri'
require 'nokogiri'

html_file = open("https://dribbble.com/search?q=wagon")
html_document = Nokogiri::HTML(html_file)

dribbbles = html_document.css('li.group')

dribbbles.each do |dribbble|
  #title
  title = dribbble.css('.dribbble .dribbble-shot .dribbble-img a.dribbble-over strong').text

  # skip if it's not a real Dribbble
  unless title.empty?
    # url
    relative_url = dribbble.css('.dribbble .dribbble-shot .dribbble-img a.dribbble-over').attr('href')
    absolute_url = "https://dribbble.com/#{relative_url}"
    # or
    # absolute_url = "https://dribbble.com/" + relative_url

    # image
    image_url = dribbble.css('.dribbble .dribbble-shot div.dribbble-img a.dribbble-link picture img').attr('src')

    # displaying info
    puts '####################'
    puts title
    puts "url:   #{absolute_url}"
    puts "image: #{image_url}"
    puts "\n"
  end
end
