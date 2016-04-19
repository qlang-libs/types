## types
Swap string, slice, map to qlang class for chained invoking.

If qlang is not familiar to you, have a look at this [introduction](https://github.com/qlang-libs/qlang#qlang).

### String 

### Slice

```go
// make sure that this projcet is in the $QLANG_PAH directory
import "types"

// Slice need a type
books = new types.Slice("string")
println(books.length(), books.empty()) // Outputs: 0 true

// use books like a stack
books.push("The Little Prince").push("Pi")
println(books.pop()) // Outputs: "Pi"

// use books like a queue
books.shift("Pi")
println(books.unshift()) // Outputs: "Pi"
```

### Map
