FixName = (name) ->
	if name.indexOf('Part 2') isnt -1
		return null
	name = name.replace(/^\s+|\s+$/g, "")
	name = name.replace('Highlights of a Hundred','The Highlights of 100')
	name = name.replace(/:? \(?Part 1\)?/,"")
	name = name.replace("The Cafe","The Café")
	name = name.replace("The Clip Show","The Chronicle")
	name = name.replace("The Fix Up", "The Fix-Up")
	name = name.replace("The Friars Club", "The Friar's Club")
	name = name.replace("The Mom and Pop Store", "The Mom & Pop Store")
	name = name.replace("The Stakeout", "The Stake Out")
	name = name.replace("The Strongbox", "The Strong Box")

	return name
module.exports.FixName = FixName