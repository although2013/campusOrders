MessageBus.start();
MessageBus.callbackInterval = 1000


MessageBus.subscribe('/new_order', (user) ->
  if !($('#newest-order').length)
    $('.orders').prepend("<div id='newest-order'><a href='/orders'>查看最新的 1 个任务</a></div>")
  else
    s = $('#newest-order').text().match(/\d+/g).pop()
    n = parseInt(s) + 1
    $('#newest-order').html("<a href='/orders'>查看最新的 #{n} 个任务</a>")
)

MessageBus.subscribe('/order_gotten', (order_id) ->
  selector = '.order' + order_id
  if ($(selector).length)
    $((selector + ' .button_to .btn')).val('已被接单').prop('disabled', true);
)
