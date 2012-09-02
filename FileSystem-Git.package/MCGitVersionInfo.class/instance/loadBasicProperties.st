loading
loadBasicProperties
	id := commit hexHash.
	author := commit author name.
	date := commit author timeStamp date.
	time := commit author timeStamp time.
	message := commit message.
	name := self loadName.
	"ancestors are lazy"