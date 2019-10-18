# EspecJsonapi
[![Hex.pm](https://img.shields.io/hexpm/v/espec_jsonapi.svg)](https://hex.pm/packages/espec_jsonapi)
[![CircleCI](https://circleci.com/gh/gmartsenkov/espec_jsonapi.svg?style=svg)](https://circleci.com/gh/gmartsenkov/espec_jsonapi)

**Collection of matchers to help with testing JSONAPI responses with ESpec**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `espec_jsonapi` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:espec_jsonapi, "~> 0.1.0"}
  ]
end
```

## Example

``` elixir
defmodule SomeSpec do
  use ESpec
  import EspecJsonapi
  
  it "has the correct type" do
	response = %{ "data" => %{ "type" => "user" } }
	expect(response["data"]) |> to have_type("user")
  end
end
```

## Matchers

* `expect(response["data"]) |> to have_id("1")`
* `expect(response["data"]) |> to have_type("user")`
* `expect(response["data"]) |> to have_attribute("name")`
* `expect(response["data"]) |> to have_attribute(["age", "name", "gender"])`


