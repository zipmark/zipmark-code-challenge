require 'spec_helper'

describe FedachFileParser do
    let (:file_parser) { FedachFileParser.new("https://gist.github.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list") }

  it "should have a response body" do
    expect(file_parser.response_body).not_to be_nil
  end
end
