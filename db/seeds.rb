# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Note: this script is called from initializers/load_seed_data.rb on _every_ restart
# call importer to read configured banks directory and write to db, unless records already exist
FedachDir.import
