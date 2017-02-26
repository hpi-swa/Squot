public
at: index write: buffer startingAt: start count: count
	Primitives 
		setPosition: id to: index - 1;
		write: id from: buffer startingAt: start count: count
