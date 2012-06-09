require 'nokogiri'
require 'open-uri'
require 'openssl'
# The main GrabMoot Class
class GrabMoot
  # GrabMoot will be able to download all images from any thread passed in
  #
  # Example:
  #   >> GrabMoot.down_thread('http://boards.4chan.org/b/res/404803253')
  #   => image...
  #
  # Arguments:
  #   url: (String)
  def self.down_thread(url)
    begin
      puts "Hey Anon! Hope this helps."
      doc = Nokogiri::HTML(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
      doc.xpath("//a[@class='fileThumb']").each do |link|
        img_url = "http:#{link.attributes['href'].to_s}"
        open(img_url) {|f|
          File.open("#{File.basename(img_url)}","wb") do |file|
            file.puts f.read
          end
        }
      end
      puts "Finished!"
    rescue Exception => e
      puts "You probably forgot the URL from the thread you need.\n"
      puts "If you did, then check your internet connection\n"
      puts "If you did both, email this to me\n"
      puts e.message
      puts e.backtrace
    end
  end
end