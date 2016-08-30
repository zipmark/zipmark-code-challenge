require 'http'

class BankDataFetcher
  def self.fetch
    HTTP.get("https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list").to_s
  end
end
