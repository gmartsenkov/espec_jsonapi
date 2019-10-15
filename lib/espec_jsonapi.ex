defmodule EspecJsonapi do
  alias EspecJsonapi.Assertions.HaveId
  alias EspecJsonapi.Assertions.HaveType
  alias EspecJsonapi.Assertions.HaveAttribute

  def have_id(id), do: {HaveId, id}
  def have_type(id), do: {HaveType, id}
  def have_attribute(id), do: {HaveAttribute, id}
end
