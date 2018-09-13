# README



## Reset DB (when needed)

  ```
  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
  ```



## Postgres

  ```
  alias MetademoMnesia.Repo
  alias MetademoMnesia.AssetMetadata.Host
  alias MetademoMnesia.AssetMetadata.HostAttr

  host = %Host{hostname: "simplehost.nurny.com", total_memory: 2400456, total_disk: 1234561234, is_active: 1, description: "just a simple host."}

  host = Repo.insert!(host)

  Repo.all(Host)

  host_attr = Ecto.build_assoc(host, :host_attrs, %{name: "peo-cma-version", value: "2.2.5", is_active: 1})
  host_attr = Repo.insert!(host_attr)

  Repo.all(Host)
  Repo.all(HostAttr)

  Repo.get(Host, host.id) |> Repo.preload(:host_attrs)

  host_attr = Ecto.build_assoc(host, :host_attrs, %{name: "peo-jc-version", value: "1.2.5", is_active: 1})
  host_attr = Repo.insert!(host_attr)

  Repo.get(Host, host.id) |> Repo.preload(:host_attrs)
  ```


## Mnesia

  ```
  alias MetademoMnesia.Repo
  alias MetademoMnesia.AssetMetadata.Host
  alias MetademoMnesia.AssetMetadata.HostAttr

  host = %Host{hostname: "simplehost.nurny.com", total_memory: 2400456, total_disk: 1234561234, is_active: 1, description: "just a simple host."}

  host = Repo.insert!(host)

  Repo.all(Host)

  host_attr = Ecto.build_assoc(host, :host_attrs, %{name: "peo-cma-version", value: "2.2.5", is_active: 1})
  host_attr = Repo.insert!(host_attr)

  Repo.all(Host)
  Repo.all(HostAttr)

  Repo.get(Host, host.id) |> Repo.preload(:host_attrs)


  **NOTE** see what happens when we have more than one host_attr record for a given host ****

  host_attr = Ecto.build_assoc(host, :host_attrs, %{name: "peo-jc-version", value: "1.2.5", is_active: 1})
  host_attr = Repo.insert!(host_attr)
  ```


Hmmm, we seem to have a problem.  But wait, there is more!


**WORK AROUND**

  ```
  import Ecto.Query

  first_host = Repo.get(Host, 1)
  host_attr_qry = from ha in "host_attrs", where: [host_id: ^first_host.id], select: [ha.name, ha.value, ha.created_by, ha.is_active]

  Repo.all(host_attr_qry)
  ```

**BETTER WORK AROUND**

  ```
  qry = from HostAttr, where: [host_id: ^first_host.id]
  Repo.all(qry)
  ```

