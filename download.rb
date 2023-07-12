require 'fileutils'
require 'json'
require 'net/http'

file = File.read('./emojis.json')
data = JSON.parse(file)
emojis = data.is_a?(Array) ? data : data.fetch('emoji')

FileUtils.mkdir_p('./emojis')

host = URI.parse(emojis.dig(0, 'url') || fail('no emojis or no url')).host

Net::HTTP.start(host, use_ssl: true) do |http|
  emojis.each do |emoji|
    path = URI.parse(emoji['url']).path
    extension = File.extname(path)
    output_path = "./emojis/#{emoji['name']}#{extension}"
    puts "Downloading #{path} into #{output_path}"
    response = http.get(path)
    File.write(output_path, response.body)
  end
end
