defmodule EspecJsonapi.Assertions.HaveLinksTest do
  use ExUnit.Case
  alias EspecJsonapi.Assertions.HaveLink

  test "match when subject is an empty map" do
    assert HaveLink.match(%{}, "user") == {false, %{}}
  end

  test "match when subject is another type" do
    assert HaveLink.match("invalid", "user") == {false, "invalid"}
  end

  test "match when the subject id matches" do
    subject = %{ "links" => %{ "self" => "api.com/users/1", "age" => 17 } }
    assert HaveLink.match(subject, "self") == {true, "api.com/users/1"}
  end

  test "success_message when positive is true" do
    subject = %{ "links" => %{ "self" => "api.com/users/1" } }
    expected = "`%{\"links\" => %{\"self\" => \"api.com/users/1\"}}` has link self."
    assert HaveLink.success_message(subject, "self", nil, true) == expected
  end

  test "success_message when positive is false" do
    subject = %{ "links" => %{ "self" => "api.com/users/1" } }
    expected = "`%{\"links\" => %{\"self\" => \"api.com/users/1\"}}` does not have link age."
    assert HaveLink.success_message(subject, "age", nil, false) == expected
  end

  test "error_message when positive is true" do
    subject = %{ "links" => %{ "self" => "api.com/users/1" } }
    expected = "Expected `%{\"links\" => %{\"self\" => \"api.com/users/1\"}}` to have link age."
    assert HaveLink.error_message(subject, "age", nil, true) == expected
  end

  test "error_message when positive is false" do
    subject = %{ "links" => %{ "self" => "api.com/users/1" } }
    expected = "Expected `%{\"links\" => %{\"self\" => \"api.com/users/1\"}}` not to have link self."
    assert HaveLink.error_message(subject, "self", nil, false) == expected
  end
end
