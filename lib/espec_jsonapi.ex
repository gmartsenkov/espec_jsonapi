defmodule EspecJsonapi do
  alias EspecJsonapi.Assertions.HaveId
  alias EspecJsonapi.Assertions.HaveType
  alias EspecJsonapi.Assertions.HaveAttribute
  alias EspecJsonapi.Assertions.HaveAttributes
  alias EspecJsonapi.Assertions.WithData

  def have_id(id), do: {HaveId, id}
  def have_type(type), do: {HaveType, type}
  def have_attribute(attribute), do: {HaveAttribute, attribute}
  def have_attributes(attributes), do: {HaveAttributes, attributes}
  def with_data(matcher, data), do: {WithData, {matcher, data}}
end
