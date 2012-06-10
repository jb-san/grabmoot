require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'timeout'
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
  def self.down_thread(url, timeout_var = 120)
    begin
      puts "Hey Anon! Hope this helps."
      timeout(timeout_var) do
        doc = Nokogiri::HTML(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
        doc.xpath("//a[@class='fileThumb']").each do |link|
          img_url = "http:#{link.attributes['href'].to_s}"
          open(img_url) {|f|
            File.open("#{File.basename(img_url)}","wb") do |file|
              file.puts f.read
            end
          }
        end
      end
      puts "Finished!"
    rescue Timeout::Error
      puts "So an image timed out. Could be network, could be a dead thread.\n"
      puts "Try it again"
    rescue Exception => e
      puts "You probably forgot the URL from the thread you need.\n"
      puts "If you did, then check your internet connection\n"
      puts "If you did both, put a ticket in github\n"
      puts e.message
      puts e.backtrace
    end
  end
end