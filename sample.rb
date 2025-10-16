module Example
  def example
    str = self.to_s
  end
end

String.include Example

p  'Hello, world!'.example