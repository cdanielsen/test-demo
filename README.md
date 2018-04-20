# test-demo

A demonstration of using Ruby libraries to create API and UI level tests

## Setup

Configured to use chromedriver. On OS X, easy install via

```
brew cask install chromedriver
```

```
gem install bundle
bundle install
```

Add a valid [Zillow Web Services key](https://www.zillow.com/howto/api/APIOverview.htm) and Redfin credentials in the `.env.example` file. Then rename it to just `.env`

## Run API tests
```
rspec
```

## Run UI Tests
```
cucumber
```