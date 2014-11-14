require 'open-uri'
class BanksReader

  def self.ach_dir(url= "http://www.fededirectory.frb.org/FedACHdir.txt")
    text = URI.parse(url).read.split("\n")
  end

end