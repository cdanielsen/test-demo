# test-demo

A demonstration of using Ruby libraries to create API and UI level tests

## Setup

A recently installed version of Firefox

Configured to use selenium / geckodriver. On OS X, easy install via

```
brew install geckodriver
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

## Run UI Tests (with browser)
```
cucumber
```
