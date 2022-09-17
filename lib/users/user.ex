defmodule Exlivery.Users.User do
  # structs é um mapa com nome
  @keys [:address, :name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  def build(address, name, email, cpf, age) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       address: address,
       cpf: cpf,
       age: age
     }}
  end

  def build(_address, _name, _email, _cpf, _age), do: {:error, "Invalid parameters"}
end
