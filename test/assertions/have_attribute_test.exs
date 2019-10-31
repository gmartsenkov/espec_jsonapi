defmodule EspecJsonapi.Assertions.HaveAttributeTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveAttribute

  test "match when subject is an empty map" do
    assert HaveAttribute.match(%{}, "user") == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveAttribute.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject id matches" do
    subject = %{ "attributes" => %{ "name" => "John", "age" => 17 } }
    assert HaveAttribute.match(subject, "name") == {true, "John"}
  end

  test "success_message when positive is true" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "`%{\"attributes\" => %{\"name\" => \"John\"}}` has attribute name."
    assert HaveAttribute.success_message(subject, "name", nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "`%{\"attributes\" => %{\"name\" => \"John\"}}` does not have attribute age."
    assert HaveAttribute.success_message(subject, "age", nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "Expected `%{\"attributes\" => %{\"name\" => \"John\"}}` to have attribute age."
    assert HaveAttribute.error_message(subject, "age", nil, true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "attributes" => %{ "name" => "John" } }
    expected = "Expected `%{\"attributes\" => %{\"name\" => \"John\"}}` not to have attribute name."
    assert HaveAttribute.error_message(subject, "name", nil, false) == expected
  end
end
