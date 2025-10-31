use context dcic2024
data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

fun count-streams(r :: River) -> Number:
  cases (River) r:
    | stream(flow) => 1
    | merge(width, left, right) =>
        count-streams(left) + count-streams(right)
  end
where:
  count-streams(stream(5)) is 1
  count-streams(merge(12, stream(5), stream(3))) is 2
end

fun max-width(r :: River) -> Number:
  cases (River) r:
    | stream(flow) => 0
    | merge(width, left, right) =>
        num-max(width, num-max(max-width(left), max-width(right)))
  end
where:
  max-width(stream(5)) is 0
  max-width(merge(12, stream(5), stream(3))) is 12
  max-width(merge(15, merge(12, stream(5), stream(3)), stream(8))) is 15
end

fun widen-river(r :: River, amount :: Number) -> River:
  cases (River) r:
    | stream(flow) => stream(flow)
    | merge(width, left, right) =>
        merge(width + amount,
              widen-river(left, amount),
              widen-river(right, amount))
  end
where:
  widen-river(stream(5), 2) is stream(5)
  widen-river(merge(12, stream(5), stream(3)), 3)
    is merge(15, stream(5), stream(3))
end

fun cap-flow(r :: River, cap :: Number) -> River:
  cases (River) r:
    | stream(flow) =>
      stream(if flow > cap : cap else: flow end)
    | merge(width, left, right) =>
        merge(width, cap-flow(left, cap), cap-flow(right, cap))
  end
where:
  cap-flow(stream(8), 5) is stream(5)
  cap-flow(merge(12, stream(8), stream(3)), 5)
    is merge(12, stream(5), stream(3))
end

fun has-large-stream(r :: River) -> Boolean:
  cases (River) r:
    | stream(flow) => flow > 5
    | merge(width, left, right) =>
        has-large-stream(left) or has-large-stream(right)
  end
where:
  has-large-stream(stream(3)) is false
  has-large-stream(stream(8)) is true
  has-large-stream(merge(12, stream(8), stream(3))) is true
end
