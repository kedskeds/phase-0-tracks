office = {
	desk1: {
		occupant: "bob the accountant",
		contents: [
			"calculator",
			"ticker-tape",
			"tax returns"
		],
		wall_dividers: 4
	},
	desk2: {
		occupant: "ruby the programmer",
		contents: [
			"laptop",
			"coffee",
			"action figures"
		],
		wall_dividers: 0
	},
	desk3: {
		occupant: nil,
		contents: [
			"loose papers",
			"empty soda can"
		],
		wall_dividers: 2
	}
}

puts office[:desk1][:occupant]
puts office[:desk3][:contents][1]
puts office[:desk2][:wall_dividers]