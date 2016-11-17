loading
loadBasicProperties
	id := commit hexHash.
	author := commit author name.
	date := commit author timeStamp asDate.
	time := commit author timeStamp asTime.
	message := commit message.
	name := self loadName.
	"ancestors are lazy"