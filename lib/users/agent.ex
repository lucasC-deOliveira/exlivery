defmodule Exlivery.Users.Agent do
  alias Exlivery.Users.User

  use Agent

  # Agent é usado para manter um estado
  def start_link(_init) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, &2))

  defp update_state(state, %User{cpf: cpf} = user), do: Map.put(state, cpf, user)

  def get(cpf), do: Agent.get(__MODULE__, &get_user(&1, cpf))

  defp get_user(state, cpf) do
    case Map.get(state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
