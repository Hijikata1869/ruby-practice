point = 7
day = 1

if day == 1
  point * 7
end

# if文は修飾子として文の後ろに置くこともできる
# 上のif文とこの修飾子としてのif文は同じ意味
point *= 5 if day == 1

p point