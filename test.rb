require 'lastfm'
require 'httparty'
require 'pry-byebug'
require 'launchy'
require 'dotenv/load'


puts "Hello World"
key = ENV["LASTFM_KEY"]
api_secret = ENV["LASTFM_SECRET"]

lastfm = Lastfm.new(key, api_secret)

html_content = <<~HTML
  <html>
    <body>
      <form action="submit_form" method="get">
        <label for="user_input">Enter something:</label>
        <input type="text" id="user_input" name="user_input">
        <br>
        <input type="submit" value="Submit">
      </form>
    </body>
  </html>
HTML

temp_html_file = File.join(Dir.tmpdir, 'user_input_form.html')
File.write(temp_html_file, html_content)

Launchy.open(temp_html_file)

puts 'Waiting for user input. Close the browser window.'

# token = lastfm.auth.get_token
# print "Hit return to open browser and authenticate..."
# STDIN.gets 
# system(%Q[open "http://www.last.fm/api/auth/?api_key=#{key}&token=#{token}"]) 
# sleep(10)
# lastfm.session = lastfm.auth.get_session(token: token)['key']
# puts lastfm.session

top_tracks = lastfm.user.get_top_tracks(user: 'Centroids')

# # loop through tracks data for album art for each; .each_with_index for array indexation

#top_tracks.each_with_index do |track, idx|
#
# begin
#    puts "Getting info for track #{idx + 1}"
#    info = lastfm.track.get_info(track: track["name"], artist: track['artist']['name'])
#    url = info["album"]["image"].last['content'] rescue 'about:blank'
#    track['url'] = url
#  rescue Lastfm::ApiError => e
#    puts "GetInfo returned exception: #{e.message}"
#  end
#end


#File.open("top_tracks.html", "w") do |f|
#  f.puts "<table>"
#  top_tracks.each do |track|
#    puts "Writing record for track: #{track}"
#    puts
#    f.puts "<tr>"
#    f.puts "<td>#{track['rank']}</td><td>#{track['name']}</td><td><img src='#{track['url']}'></td>"
#    f.puts "</tr>"
#  end
#  f.puts "</table>"
#end

# https://lastfm.freetls.fastly.net/i/u/64s/8ee296bc1ea8dfcc004f9749da12b48b.jpg
# https://lastfm.freetls.fastly.net/i/u/34s/2a96cbd8b46e442fc41c2b86b821562f.png


# lastfm.track.love(artist: 'Hujiko Pro', track: 'acid acid 7riddim')
# lastfm.track.scrobble(artist: 'Hujiko Pro', track: 'acid acid 7riddim')
# lastfm.track.update_now_playing(artist: 'Hujiko Pro', track: 'acid acid 7riddim')

