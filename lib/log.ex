defmodule Bside.Log do
  @moduledoc """
  Logger module
  """
  require Logger

  def error(msg, data) do
    Logger.error("#{msg} with #{inspect(data)}")
  end

  def info(msg, data) do
    Logger.info("#{msg} with #{inspect(data)}")
  end
end
