defmodule AmqpConsumerEl.Server do
  use GenServer.Behaviour
  use AmqpClient
  # use "../../deps/amqp_client-3.1.3/include/amqp_client.hrl", __DIR__
  # use "amqp_client.hrl"


  #  { :ok, pid } = :gen_server.start_link(AmqpConsumerEl.Server, 100, [])
  def init(current_number) do

    try do

      IO.puts "INIT"

      IO.puts "PARAMS"
      inspect :amqp_params_network.new(), raw: true

      { :ok, connection } = :amqp_connection.start(:amqp_params_network)

      IO.puts "CONNECTION"

      { :ok, channel} = :amqp_connection.open_channel(connection)

      IO.puts "CHANNEL"

      # :amqp_channel.call(channel, #'queue.declare'{queue = <<"hello">>}),

      # amqp_channel:cast(Channel,
      #                   #'basic.publish'{
      #                     exchange = <<"">>,
      #                     routing_key = <<"hello">>},
      #                   #amqp_msg{payload = <<"Hello World!">>}),
      # io:format(" [x] Sent 'Hello World!'~n"),

      { :ok } = :amqp_channel.close(channel)
      { :ok } = :amqp_connection.close(connection)
      { :ok }

    rescue
      [ RuntimeError ] ->
        IO.puts "Runtime error"
      other_errors ->
        IO.puts "Disaster! #{other_errors.message}"
    after
      IO.puts "DONE!"
    end

  end

end
