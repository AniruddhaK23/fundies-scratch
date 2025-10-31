use context dcic2024
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

fun count-streams(r:: River) -> Number:
  cases (River) r:
    |stream(flow) => 1
    |merge(width,left,right)=> 
      count-streams(left) + count-streams(right)
  end
where: 
  count-streams(stream(5)) is 1
  count-streams(merge(12,stream(5),stream(3))) is 2
end

fun max-width(r:: River)-> Number: 
  cases(River) r:
    |stream(flow) => 0
    |