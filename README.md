## Welcome

If you are reading this, you probably have interviewed or chatted with someone on the team at Zipmark.  This is our standard "toy" project we normally like to work on together to see how you think about problems, model them, and make decisions.  If you stumbled upon this project randomly and want to give it a shot, please feel free to fork the project and hack away.  We would love to see what you come up with.

An initial version of this project should be doable in a short amount of time (we usually do coding sessions for less than half a day with interviewees), but has many facets that could be improved beyond that inital cut. 

## Objective

Build a small application that fetches and updates the Federal Reserve's current list of Banks and Routing numbers and then exposes a JSON API where users can lookup a Bank's details by routing number.

## Resources

* [Fedwire Directory File Format](https://www.frbservices.org/EPaymentsDirectory/fedwireFormat.html)
  * Provides the "rules" for how the bank routing number data file is formatted

* [Bank Data](https://www.frbservices.org/EPaymentsDirectory/FedACHdir.txt)
  * Provides a "fixed-width" data set of all banks registered with the Fed
  * Note: fixed-width semantics can be [found here](http://www.softinterface.com/Convert-XLS/Features/Fixed-Width-Text-File-Definition.htm). You'll want to keep this in mind when thinking of how to parse the data set file

* [Truncated Bank Data](https://gist.github.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list)
  * A subset of the full Bank Data file above
  * This is the first 100 lines of the file, much easier to deal with if you are requesting it a lot


## Getting Started

1. Fork this Repo
2. Code up your Version
3. Email us or send a PR so we can check it out

## Example Behavior

`curl http://hostname/banks/123456789`

Output: 

```json
{
  name: "First Bank of Zipmark",
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

## Niceties

* deployable to Heroku

## Ideas for Enhancements

* provide a web client that allows a user to enter a routing number into a form and see the results in a browser
* scheduling/backgrounding/resilience
* track updates and changes
* etc
