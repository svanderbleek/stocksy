App.prices = App.cable.subscriptions.create "PricesChannel",
  received: (data) ->
    document.getElementById('stocks-table').innerHTML = data
