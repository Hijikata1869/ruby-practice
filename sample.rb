status = 2

case status
when 0 # todo
  'これからやります'
when 1 # doing
  '今やってます'
when 2 # done
  'もう終わりました'
end


status = :done

case status
when :todo
  'これからやります'
when :doing
  '今やってます'
when :done
  '終わりました'
end