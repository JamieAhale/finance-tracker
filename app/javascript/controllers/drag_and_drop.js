document.addEventListener('turbolinks:load', function() {
    var el = document.getElementById('stocks-table-body');
    var sortable = Sortable.create(el, {
      onEnd: function(evt) {
        var itemEl = evt.item;  // the current dragged HTMLElement
        updateStocksOrder();
      }
    });
  
    function updateStocksOrder() {
      var order = [];
      document.querySelectorAll('#stocks-table-body tr').forEach(function(row) {
        order.push(row.getAttribute('data-id'));
      });
  
      // TODO: Send `order` to the server to update the user.tickers array
      console.log(order); // For testing, see the order in the browser console
    }
  });
  