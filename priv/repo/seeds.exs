# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MetademoMnesia.Repo.insert!(%MetademoMnesia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "webapp01.jaxex.com", description: "describe your host here", 
  cpu_count: 4, total_memory: 2048, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "webapp02.jaxex.com", description: "describe your host here", 
  cpu_count: 4, total_memory: 8192, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "chi-db-01.jaxex.com", description: "describe your host here", 
  cpu_count: 12, total_memory: 12048, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "chi-db-02.jaxex.com", description: "describe your host here", 
  cpu_count: 12, total_memory: 200048, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "chi-wls-01.jaxex.com", description: "Primary Weblogic Server", 
  cpu_count: 8, total_memory: 160800, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "chi-wls-02.jaxex.com", description: "Secondary Weblogic Server", 
  cpu_count: 6, total_memory: 2048, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "chi-wls-03.jaxex.com", description: "QA Weblogic Server", 
  cpu_count: 4, total_memory: 2048, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 0})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "ops-repo.aus.jaxex.com", description: "Gitlab Repo server for OPS", 
  cpu_count: 4, total_memory: 4096, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "mysql01.jaxex.com", description: "MySQL Server used for testing.", 
  cpu_count: 4, total_memory: 20480, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
MetademoMnesia.Repo.insert!(%MetademoMnesia.AssetMetadata.Host{
  hostname: "ops-xen.jaxex.com", description: "Xen Host (Dom0) for OPS", 
  cpu_count: 24, total_memory: 4096, total_disk: 240000, created_by: "MetaDemo", 
  updated_by: "MetaDemo", is_active: 1})
