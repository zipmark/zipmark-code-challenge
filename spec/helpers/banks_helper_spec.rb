require 'rails_helper'

RSpec.describe BanksHelper, type: :helper do
  describe "::extract_options" do
    it "extracts bank attributes" do 
      line = "011110756O0110000151050113000000000START COMMUNITY BANK                P O BOX 3110                        NEW HAVEN           CT065130000877687113311     "
      bank = extract_options(line)
      expect(bank[:name]).to eq("START COMMUNITY BANK")
      expect(bank[:routing_number]).to eq("011110756")
      expect(bank[:phone_number]).to eq("8776871133")

      address = bank[:address_attributes]
      expect(address[:line_1]).to eq("P O BOX 3110")
      expect(address[:line_2]).to eq(nil)
      expect(address[:city]).to eq("NEW HAVEN")
      expect(address[:state]).to eq("CT")
      expect(address[:zip_code]).to eq("06513")
    end

    it "handles long bank names" do 
      line = "107000929O1010000481072009000000000ROCKY MOUNTAIN BANK & TRUST FLORENCE755 CHEYENNE MEADOWS RD             COLORADO SPRINGS    CO809060000719579762811     "
      bank = extract_options(line)
      expect(bank[:name]).to eq("ROCKY MOUNTAIN BANK & TRUST FLORENCE")
      expect(bank[:routing_number]).to eq("107000929")
      expect(bank[:phone_number]).to eq("7195797628")

      address = bank[:address_attributes]
      expect(address[:line_1]).to eq("755 CHEYENNE MEADOWS RD")
      expect(address[:line_2]).to eq(nil)
      expect(address[:city]).to eq("COLORADO SPRINGS")
      expect(address[:state]).to eq("CO")
      expect(address[:zip_code]).to eq("80906")
    end

    it "handles addresses with two lines" do 
      line = "107007346O1010000481020108000000000AMG NATIONAL TRUST BANK             1155 CANYON BLVD., STE 310          BOULDER             CO803020000303473486111     "
      bank = extract_options(line)
      expect(bank[:name]).to eq("AMG NATIONAL TRUST BANK")
      expect(bank[:routing_number]).to eq("107007346")
      expect(bank[:phone_number]).to eq("3034734861")

      address = bank[:address_attributes]
      expect(address[:line_1]).to eq("1155 CANYON BLVD.")
      expect(address[:line_2]).to eq("STE 310")
      expect(address[:city]).to eq("BOULDER")
      expect(address[:state]).to eq("CO")
      expect(address[:zip_code]).to eq("80302")
    end

    it "handles long addresses" do 
      line = "096081729O0910000801011811000000000CATHOLIC UNITED FINANCIAL CU        3499 LEXINGTON AVENUE NORTH  STE 202ST PAUL             MN551268098651765413211     "
      bank = extract_options(line)
      expect(bank[:name]).to eq("CATHOLIC UNITED FINANCIAL CU")
      expect(bank[:routing_number]).to eq("096081729")
      expect(bank[:phone_number]).to eq("6517654132")

      address = bank[:address_attributes]
      expect(address[:line_1]).to eq("3499 LEXINGTON AVENUE NORTH  STE 202")
      expect(address[:line_2]).to eq(nil)
      expect(address[:city]).to eq("ST PAUL")
      expect(address[:state]).to eq("MN")
      expect(address[:zip_code]).to eq("55126")
    end

    it "handles long cities" do 
      line = "011701084O0110000151120814000000000MASCOMA SAVINGS BANK                243 SYKES MOUNTAIN AVE              WHITE RIVER JUNCTIONVT050010000603448365011     "
      bank = extract_options(line)
      expect(bank[:name]).to eq("MASCOMA SAVINGS BANK")
      expect(bank[:routing_number]).to eq("011701084")
      expect(bank[:phone_number]).to eq("6034483650")

      address = bank[:address_attributes]
      expect(address[:line_1]).to eq("243 SYKES MOUNTAIN AVE")
      expect(address[:line_2]).to eq(nil)
      expect(address[:city]).to eq("WHITE RIVER JUNCTION")
      expect(address[:state]).to eq("VT")
      expect(address[:zip_code]).to eq("05001")
    end
  end
end
