import "expectations" as expect
// Slice contains a slice and defines methods to manipulation.
Slice = class {
	// Slice need a string to specify the type of elements.
	// Example:
	//   slice = new("int")
	fn _init(t) {
		this.sType = t
		this.items = slice(t, 0, 0)
	}	

	// fetch gets the element with the given index and returns it.
	// It will panic if index out of slice range.
	fn fetch(index) {
		return this.items[index]	
	}

	// empty returns if the length of this.items is equal to 0.
	fn empty() {
		return this.length() == 0
	}

	// length returns the length of this.items.
	fn length() {
		return len(this.items)
	}

	// capacity returns the capacity of this.items.
	fn capacity() {
		return cap(this.items)
	}

	// push adds the given element at the end of this.items.
	fn push(item) {
		this.items = append(this.items, item)
		return this
	}


	// pop takes the last element out and returns it.
	fn pop() {
		if this.empty() {
			return nil
		} else {
			e = this.items[this.length() - 1]
			this.items = this.items[:this.length()-1]
			return e
		}
	}

	// shift adds the given element at the head of this.items.
	fn shift(element) {
		items = slice(this.sType, this.length() + 1, this.capacity() + 2)
		items[0] = element
		copy(items[1:], this.items)
		this.items = items
		return this
	}

	// unshift takes the first element out and returns it.
	fn unshift() {
		if this.empty() {
			return nil
		} else {
			e = this.items[0]
			this.items = this.items[1:]
			return e
		}
	}

	fn collect(enumerator) {
		if !expect.isFn(enumerator) {
			panic("Slice#collect: parameter must be a fn")
		}

		newSlice = new Slice(this.sType)

		for i, item = range this.items {
			if enumerator(i, item) {
				newSlice.push(item)
			}
		}

		return newSlice
	}

	fn mapping(enumerator) {
		if !expect.isFn(enumerator) {
			panic("Slice#mapping: parameter must be a fn")
		}

		newSlice = new Slice(this.sType)

		for i, item = range this.items {
			newSlice.push(enumerator(i, item))
		}

		return newSlice
	}
}
