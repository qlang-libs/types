// Slice contains a slice and defines methods to manipulation.
Slice = class {
	// Slice need a string to specify the type of elements.
	// Example:
	//   slice = new("int")
	fn _init(t) {
		set(this, "items", slice(t, 0, 0), "sType", t)
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
		set(this, "items", append(this.items, item)) 
		return this
	}


	// pop takes the last element out and returns it.
	fn pop() {
		if this.empty() {
			return nil
		} else {
			e = this.items[this.length() - 1]
			set(this, "items", this.items[:this.length()-1])
			return e
		}
	}

	// shift adds the given element at the head of this.items.
	fn shift(element) {
		items = slice(this.sType, this.length() + 1, this.capacity() + 2)
		set(items, 0, element)
		copy(items[1:], this.items)
		set(this, "items", items)
		return this
	}

	// unshift takes the first element out and returns it.
	fn unshift() {
		if this.empty() {
			return nil
		} else {
			e = this.items[0]
			set(this, "items", this.items[1:])
			return e
		}
	}
}

NewSlice = fn(t) {
	return new Slice(t)
}