defmodule EspecJsonapi.Assertions.WithDataTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.WithData
  alias EspecJsonapi.Assertions.HaveAttribute

  def matcher, do: { HaveAttribute, "name" }
  def subject, do: %{ "attributes" => %{ "name" => "Jon" } }

  test "match when subject is an empty map" do
    assert WithData.match(%{}, { matcher(), "Jon" }) == {false, {false, %{}}}
  end

  test "match when subject is another type" do
    assert WithData.match("invalid", { matcher(), "Jon" }) == {false, {false, "invalid"}}
  end

  test "match when the name matches Jon" do
    assert WithData.match(subject(), { matcher(), "Jon" }) == {true, {true, "Jon"}}
  end

  test "match when the name does not matches Jon" do
    assert WithData.match(subject(), { matcher(), "Mark" }) == {false, {true, "Jon"}}
  end

  test "success_message when the name matches Jon" do
    expected = "`%{\"attributes\" => %{\"name\" => \"Jon\"}}` has attribute name with data Jon."
    assert WithData.success_message(subject(), { matcher(), "name" }, {true, "Jon"}, true) == expected
  end

  test "error_message when attribute exist but data does not match" do
    expected = "Expected `%{\"attributes\" => %{\"name\" => \"Jon\"}}` to have attribute name with data Mark but is Jon."
    assert WithData.error_message(subject(), {matcher(), "Mark"}, {true, "Jon"}, true) == expected
  end

  test "error_message when attribute does not exist" do
        expected = "Expected `%{\"attributes\" => %{\"name\" => \"Jon\"}}` to have attribute name."
    assert WithData.error_message(subject(), {matcher(), "Mark"}, {false, "Jon"}, true) == expected
  end
end
