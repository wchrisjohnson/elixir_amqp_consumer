# elixir_amqp_consumer

A simple first effort at an Elixir based RabbitMQ consumer

### To start the server

Start iex shell and fire up the server

~~~~~elixir
iex -S mix
{ :ok, pid } = :gen_server.start_link(ElixirAmqpConsumer.Server, 100, [])
~~~~~

