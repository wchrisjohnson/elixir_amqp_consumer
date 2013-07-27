defmodule ElixirAmqpConsumer.Server do
  use GenServer.Behaviour

  # defrecord :amqp_msg,
  #           Record.extract(:amqp_msg, from: "./deps/amqp_client/include/amqp_client.hrl")

  # for now, must stub out any attribs that use fun in them
  # https://github.com/elixir-lang/elixir/issues/554
  # https://github.com/elixir-lang/elixir/issues/1242
  defrecord :ampq_params_network,
            Keyword.put(Record.extract(:amqp_params_network, from_lib: "amqp_client/include/amqp_client.hrl"),
                        :auth_mechanisms,
                        nil), as: :amqp_network_params

  defrecord :amqp_params_direct,
            Record.extract(:amqp_params_direct, from: "./deps/amqp_client/include/amqp_client.hrl")
            # , as: :amqp_params_direct

  defrecord :amqp_adapter_info,
            Record.extract(:amqp_adapter_info, from: "./deps/amqp_client/include/amqp_client.hrl"), as: :amqp_adapter_info

  def init(current_number) do

    try do

      IO.puts "PARAMS"
      params = :amqp_params_direct.new(password: 'guest')

      IO.puts "CONNECTION"
      { :ok, connection } = :amqp_connection.start(params)

      # IO.puts "CHANNEL"
      # { :ok, channel} = :amqp_connection.open_channel(connection)



#       # :amqp_channel.call(channel, #'queue.declare'{queue = <<"hello">>}),
#
#       # amqp_channel:cast(Channel,
#       #                   #'basic.publish'{
#       #                     exchange = <<"">>,
#       #                     routing_key = <<"hello">>},
#       #                   #amqp_msg{payload = <<"Hello World!">>}),
#       # io:format(" [x] Sent 'Hello World!'~n"),
#
#       { :ok } = :amqp_channel.close(channel)
#       { :ok } = :amqp_connection.close(connection)
#       { :ok }

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
