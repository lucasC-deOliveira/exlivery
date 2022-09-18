defmodule Exlivery.Users.UserAgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "save the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "751187522478")
      |> UserAgent.save()

      response = UserAgent.get("751187522478")

      expected_response =
        {:ok,
         %User{
           address: "Rua dos ipes, 10",
           age: 22,
           cpf: "751187522478",
           email: "lucas@gmail.com",
           name: "Lucas"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("000000000")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
