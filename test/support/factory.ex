defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Lucas",
      email: "lucas@gmail.com",
      cpf: "12345678900",
      age: 22,
      address: "Rua dos ipes, 10"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
