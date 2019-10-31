defmodule EspecJsonapi.Assertions.HaveLinkTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveLink

  test "match when subject is an empty map" do
    assert HaveLink.match(%{}, "user") == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveLink.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject id matches" do
    subject = %{ "links" => %{ "name" => "John", "age" => 17 } }
    assert HaveLink.match(subject, "name") == {true, "John"}
  end

  test "success_message when positive is true" do
    subject = %{ "links" => %{ "name" => "John" } }
    expected = "`%{\"links\" => %{\"name\" => \"John\"}}` has link name."
    assert HaveLink.success_message(subject, "name", nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "links" => %{ "name" => "John" } }
    expected = "`%{\"links\" => %{\"name\" => \"John\"}}` does not have link age."
    assert HaveLink.success_message(subject, "age", nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "links" => %{ "name" => "John" } }
    expected = "Expected `%{\"links\" => %{\"name\" => \"John\"}}` to have link age."
    assert HaveLink.error_message(subject, "age", nil, true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "links" => %{ "name" => "John" } }
    expected = "Expected `%{\"links\" => %{\"name\" => \"John\"}}` not to have link name."
    assert HaveLink.error_message(subject, "name", nil, false) == expected
  end
end
