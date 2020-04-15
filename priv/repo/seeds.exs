# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bside.Repo.insert!(%Bside.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import Bside.CatalogFactory

insert_list(5, :category)
insert_list(3, :product_option)
insert_list(3, :vendor)
insert_list(2, :product)
