function updateStocksOrder() {
    var order = [];
    document.querySelectorAll('#stocks-table-body tr').forEach(function(row) {
      order.push(row.getAttribute('data-id'));
    });
  
    fetch('/stocks/update_order', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ order: order })
    }).then(response => {
      if (response.ok) {
        console.log('Order updated successfully');
      } else {
        console.error('Failed to update order');
      }
    });
  }
  