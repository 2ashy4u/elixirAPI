defmodule Project.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bcrypt

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field(:email, :string)
    field(:hashed_password, :string)
    has_one(:user, Project.Users.User)
    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :hashed_password])
    |> validate_required([:email, :hashed_password])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "Must be a valid email format!")
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{hashed_password: _}} ->
        put_change(
          changeset,
          :hashed_password,
          Bcrypt.hash_pwd_salt(changeset.changes.hashed_password)
        )

      _ ->
        changeset
    end
  end
end
