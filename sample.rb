data = {
  name: "Alison",
  age: 22
}

def example(arg)
  case arg
  in {age:}
    puts age
  end
end

example(data)