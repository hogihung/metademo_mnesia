defmodule MetademoMnesia.AssetMetadata do
  @moduledoc """
  The AssetMetadata context.
  """

  import Ecto.Query, warn: false
  alias MetademoMnesia.Repo

  alias MetademoMnesia.AssetMetadata.Host

  @doc """
  Returns the list of hosts.

  ## Examples

      iex> list_hosts()
      [%Host{}, ...]

  """
  def list_hosts do
    Repo.all(Host)
  end

  @doc """
  Gets a single host.

  Raises `Ecto.NoResultsError` if the Host does not exist.

  ## Examples

      iex> get_host!(123)
      %Host{}

      iex> get_host!(456)
      ** (Ecto.NoResultsError)

  """
  def get_host!(id), do: Repo.get!(Host, id)

  @doc """
  Creates a host.

  ## Examples

      iex> create_host(%{field: value})
      {:ok, %Host{}}

      iex> create_host(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_host(attrs \\ %{}) do
    %Host{}
    |> Host.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a host.

  ## Examples

      iex> update_host(host, %{field: new_value})
      {:ok, %Host{}}

      iex> update_host(host, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_host(%Host{} = host, attrs) do
    host
    |> Host.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Host.

  ## Examples

      iex> delete_host(host)
      {:ok, %Host{}}

      iex> delete_host(host)
      {:error, %Ecto.Changeset{}}

  """
  def delete_host(%Host{} = host) do
    Repo.delete(host)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking host changes.

  ## Examples

      iex> change_host(host)
      %Ecto.Changeset{source: %Host{}}

  """
  def change_host(%Host{} = host) do
    Host.changeset(host, %{})
  end

  alias MetademoMnesia.AssetMetadata.HostAttr

  @doc """
  Returns the list of host_attrs.

  ## Examples

      iex> list_host_attrs()
      [%HostAttr{}, ...]

  """
  def list_host_attrs do
    Repo.all(HostAttr)
  end

  @doc """
  Gets a single host_attr.

  Raises `Ecto.NoResultsError` if the Host attr does not exist.

  ## Examples

      iex> get_host_attr!(123)
      %HostAttr{}

      iex> get_host_attr!(456)
      ** (Ecto.NoResultsError)

  """
  def get_host_attr!(id), do: Repo.get!(HostAttr, id)

  @doc """
  Creates a host_attr.

  ## Examples

      iex> create_host_attr(%{field: value})
      {:ok, %HostAttr{}}

      iex> create_host_attr(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_host_attr(attrs \\ %{}) do
    %HostAttr{}
    |> HostAttr.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a host_attr.

  ## Examples

      iex> update_host_attr(host_attr, %{field: new_value})
      {:ok, %HostAttr{}}

      iex> update_host_attr(host_attr, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_host_attr(%HostAttr{} = host_attr, attrs) do
    host_attr
    |> HostAttr.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a HostAttr.

  ## Examples

      iex> delete_host_attr(host_attr)
      {:ok, %HostAttr{}}

      iex> delete_host_attr(host_attr)
      {:error, %Ecto.Changeset{}}

  """
  def delete_host_attr(%HostAttr{} = host_attr) do
    Repo.delete(host_attr)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking host_attr changes.

  ## Examples

      iex> change_host_attr(host_attr)
      %Ecto.Changeset{source: %HostAttr{}}

  """
  def change_host_attr(%HostAttr{} = host_attr) do
    HostAttr.changeset(host_attr, %{})
  end
end
