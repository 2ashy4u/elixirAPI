defmodule Project.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        email: "some email",
        hashed_password: "some hashed_password"
      })
      |> Project.Accounts.create_account()

    account
  end
end
