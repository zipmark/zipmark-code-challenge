require 'rails_helper'

describe Bank do
  it 'has a name' do
    bank = Bank.create(name: 'Bank of America')
    expect(bank.name).to eq('Bank of America')
  end
end
