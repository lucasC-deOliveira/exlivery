defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "when all parameters are valid, returns the user" do
      response =
        User.build(
          "Rua dos ipes",
          "Lucas",
          "lucasdosipes@gmail.com",
          "1234518877",
          22
        )

      expected_response =
        {:ok,
         %User{
           address: "Rua dos ipes",
           age: 22,
           cpf: "1234518877",
           email: "lucasdosipes@gmail.com",
           name: "Lucas"
         }}

      assert response == expected_response
    end

    test "when there are invalid parameters, returns an error" do
      response =
        User.build(
          "Rua dos ipes",
          "Luquinhas",
          "lucasdosipes@gmail.com",
          "1234518877",
          16
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
