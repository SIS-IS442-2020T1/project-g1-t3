<div id="paypal-button"></div>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>

$cost = '5';

  paypal.Button.render({
    // Configure environment
    env: 'sandbox',
    client: {
      sandbox: 'AUeZaD56BGfH4-z8TGcUA2H6Bqgg80VIowCG5WM3qSZAEGBkacCgoMUq5TCPa6BoS0VTqNzTCl6IlEze',
      production: 'demo_production_client_id'
    },
    // Customize button (optional)
    locale: 'en_US',
    style: {
      size: 'small',
      color: 'gold',
      shape: 'pill',
    },

    // Enable Pay Now checkout flow (optional)
    commit: true,

    // Set up a payment
    payment: function(data, actions) {
      return actions.payment.create({
        transactions: [{
          amount: {
            total: $cost,
            currency: 'SGD'
          }
        }]
      });
    },

    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // Show a confirmation message to the buyer
        window.alert('Thank you for your patronage!');
      });
    }
  }, '#paypal-button');
</script>