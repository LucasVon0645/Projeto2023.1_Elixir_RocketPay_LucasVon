defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
      "#{filename}.csv"
      |> File.read()
      |> handle_file()
  end

  defp handle_file({:ok, file}) do
    result = String.split(file, ",")
    |> Stream.map(&(String.to_integer(&1)))
    |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _}), do: {:error, %{message: "Invalid File!"}}
end
