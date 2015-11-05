full_list = 'https://www.frbservices.org/EPaymentsDirectory/FedACHdir.txt',
truncated_list = 'https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757'

Rails.application.config.bank_data_sources = {
  truncated: truncated_list,
  full: full_list
}
