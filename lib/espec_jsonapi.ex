defmodule EspecJsonapi do
  alias EspecJsonapi.Assertions.HaveId
  alias EspecJsonapi.Assertions.HaveType

  def have_id(id), do: {HaveId, id}
  def have_type(id), do: {HaveType, id}
end
