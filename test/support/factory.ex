defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Lucas",
      email: "lucas@gmail.com",
      cpf: "12345678900",
      age: 22,
      address: "Rua dos ipes, 10"
    }
  end
end
