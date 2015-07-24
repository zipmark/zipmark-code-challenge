#ZipAPI


configure:

```bash
cd zip_api
bundle
rake db:setup
./script/all.bash 
```

output:
```json
{
    "address": {
        "city": "LYNN",
        "state": "MA",
        "street": "195 MARKET STREET",
        "street_2": "",
        "zip": "01901"
    },
    "name": "EASTERN BANK",
    "phone_number": "800-327-8376",
    "record_type": "Record Type",
    "routing_number": "011301604"
}
{
    "address": {
        "city": "RICHMOND",
        "state": "VA",
        "street": "PO BOX 27025",
        "street_2": "",
        "zip": "23261"
    },
    "name": "BANK OF AMERICA N.A.",
    "phone_number": "800-446-0135",
    "record_type": "Record Type",
    "routing_number": "011301646"
}
```


###notes I made while solving this problem

```
"011175319O0110000151062712000000000ROCKVILLE BANK                      1645 ELLINGTON RD                   SOUTH WINDSOR       CT060740000860291379711"
```
so now lets take this and transform it into:

```json
{
  name: "ROCKVILLE BANK",
  routing_number: "123456789",
  record_type: "Record Type",
  phone_number: "212-555-1212",
  address: {
    street: "56 W 22nd St",
    street_2: "9th Floor",
    city: "New York",
    state: "NY",
    zip_code: "10010"
  }
}
```

gonna stick with: https://github.com/rails-api/rails-api


```
-format phone number
-determine if there's a street_2 ....  
```


aside from those details upon import ... 
the larger picture:

1. install rails api

2. build schema

```bash
    rails g model bank routing_number:integer record:type_string name:string phone_number:string
    rails g model address bank_id:interger street:string street_2:string city:string state:string zip:string
    rails db:migrate
```

3. setup seed file with code you just built to import the data provided 100 line works the other is shaky at best

    wip with some tests  MEAT

-models are created
-full import process is now ready to test
-using this command to test one: bash-3.2$ 

and two objects as such:

```ruby
{:name=>"CENTURY BANK & TRUST CO", :routing_number=>"011301390", :record_type=>"Record Type", :phone_number=>"781-393-4090"}
{:street=>"400 MYSTIC AVE", :street_2=>"", :city=>"MEDFORD", :state=>"MA", :zip=>"02155"}
```

to verify that the schema is sound and this can now be a seed file to use rake db:setup from a pull ... no downloads just one pull
then follow that with routes and controller which should be like two more lines of code
along with the curl test ... then this is a wrap :D

```bash
bash-3.2$ rails c --sandbox
```


4. setup routes ... GET treating bank as a resource using routing # as the parameter passed

    now just add a route and controller and __violla!!!__

5. test like crazy look for anything off

    tests:
  
  rake db:migrate
  rakd db:seed  #import the 100 line file ( the other wasn't downloading)


 Bank.all.map(&:routing_number)


bugs:

routing number is now 8 characters? 
was setup as *integer* rolled back to use *string*

6. send PR with instructions on how to run and TEST

see above. 

