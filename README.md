# Stocksy

Portfolio App

## Setup

### Ruby

Install ruby or

```
brew install ruby
```

use rbenv to manage rubies

```
brew install rbenv
rbenv install
```

then install bundler

```
gem install bundler
```

### Server

```
export STOCKSY_KEY=<API-KEY>
bundle install
rake db:setup
rails s
```

## Use

Vist `http://localhost:3000/stocks`
