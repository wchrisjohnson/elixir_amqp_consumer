defmodule ElixirAmqpConsumer.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_amqp_consumer,
      version: "0.0.1",
      elixir: "~> 0.9.4-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    []
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [ {:rabbit_common, "3.1.3", path: "deps/rabbit_common-3.1.3"},
      {:amqp_client, "3.1.3", path: "deps/amqp_client-3.1.3"} ]
  end
end
