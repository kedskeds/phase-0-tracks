require 'sqlite3'
require 'faker'

# This program stores USERS and their BANK ACCOUNT
# information, as well as TRANSACTIONS they make
# from those accounts. 

# My goal was to create something similar to Mint,
# a personal finance service, where users can categorize
# their spending, track net worth, budget, etc.

# Eventually, I would like to implement these features:
# => display user account summary by month
# => compare actual spending to budget

db = SQLite3::Database.new("financial_database.db")
db.results_as_hash = true

create_users_table = <<-USERS
	CREATE TABLE IF NOT EXISTS users (
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
	)
USERS

create_accounts_table = <<-ACCOUNTS
	CREATE TABLE IF NOT EXISTS accounts (
		id INTEGER PRIMARY KEY,
		bank_name VARCHAR(255),
		account_num INT,
		beg_bal INT,
		user_id INT,
		FOREIGN KEY (user_id) REFERENCES users(id)
	)
ACCOUNTS

create_transactions_table = <<-TRANSACTIONS 
	CREATE TABLE IF NOT EXISTS transactions (
		id INTEGER PRIMARY KEY,
		date DATE,
		category VARCHAR(255),
		amount INT,
		user_id INT,
		account_id INT,
		FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEY (account_id) REFERENCES accounts(id)
	)
TRANSACTIONS

def create_user(db, name)
	db.execute("INSERT INTO users(name) VALUES (?)", [name])
end

def create_accounts(db,name,num,bal,user)
	db.execute("INSERT INTO accounts(bank_name,account_num,beg_bal,user_id) VALUES (?,?,?,?)",[name,num,bal,user])
end

def create_transactions(db,date,category,amount,user,account)
	db.execute("INSERT INTO transactions(date,category,amount,user_id,account_id) VALUES (?,?,?,?,?)",[date,category,amount,user,account])
end

bank_names = ["Bank of America","Wells Fargo","Citigroup", "JP Morgan"]
categories = ["rent","entertainment","groceries","restaurants","bars","travel","misc"]
amount = Random.new


db.execute(create_users_table)
db.execute(create_accounts_table)
db.execute(create_transactions_table)


### Uncomment the code below to initialize a new
### database containing randomized names, bank
### account numbers, and transactions.

=begin
def random_date
	r = Random.new 
	year = "2016"
	month = r.rand(1..12).to_s 
	day = r.rand(1..28).to_s 

	return "#{year}-#{month}-#{day}"
end

user_names = []
account_nums = []
user_ids = []
account_ids = []
beg_bals = []

10.times do |i|
	user_names << Faker::Name.name
	account_nums << amount.rand(1000..9999)
	user_ids << amount.rand(1..10)
	account_ids << (i+1)
	beg_bals << amount.rand(0..10000)
end

10.times do |i|
	create_user(db, user_names[i])
	create_accounts(db,bank_names.sample,account_nums[i],beg_bals[i],user_ids[i])
	create_transactions(db,random_date,categories.sample,amount.rand(-10000..10000),user_ids[i],account_ids[i])
end
=end

show_users = db.execute("SELECT * FROM users")
show_transactions = db.execute("SELECT * FROM transactions")
show_accounts = db.execute("SELECT * FROM accounts")


def convert(num)
	dollars = num/100.00
end

def print_account_info(db,user_id,account_id)
	table = "SELECT * FROM transactions JOIN accounts ON accounts.id = transactions.account_id JOIN users ON users.id = transactions.user_id"
	show_user_activity = "WHERE users.id= #{user_id} AND accounts.id = #{account_id}"
	order = "ORDER BY transactions.date"
	
	account_info= db.execute("#{table} #{show_user_activity} #{order}")

	puts "#{account_info[0]['name'].upcase}"
	print "#{account_info[0]['bank_name']} -***#{account_info[0]['account_num']}"
	puts " Database ID# #{account_id}"
	puts "-----------------------"

	beg_bal = convert(account_info[0]['beg_bal'])
	ending_bal = beg_bal

	puts "Beginning Balance: $#{beg_bal}"
	account_info.each do |transaction|
		ending_bal += convert(transaction['amount'])
		print "#{transaction['date']} #{transaction['category']} "
		puts "$#{convert(transaction['amount'])}"
	end
	puts "-----------------------"
	ending_bal = (ending_bal*100).round/100.00
	puts "Ending Balance: $#{ending_bal}"
	puts "-----------------------"
	puts ""
end

def prompt_user(db, hash, table_name)
	query = []
	hash.each do |question, input_type|
		puts "Enter #{question}:"
		answer = gets.chomp
		if input_type.is_a?(Numeric)
			answer = answer.to_i
		end
		query << answer	
	end
	if table_name == "transactions"
		create_transactions(db, query[0],query[1],query[2],query[3],query[4])
	elsif table_name == "users"
		create_user(db, query[0])
	elsif table_name == "accounts"
		create_accounts(db,query[0],query[1],query[2],query[3])
	end
end

# The structures below store questions as KEYS
# and the desired type of user input as VALUES.
user_hash = {
	"first and last name" => "string"
}

account_hash = {
	"bank name" => "string",
	"account number" => 0,
	"beginning balance" => 0,
	"user ID" => 0
}

transaction_hash = {
	"date (YYYY-MM-DD)" => "string",
	"category" => "string",
	"amount" => 0,
	"user ID" => 0,
	"account ID" => 0
}

puts "Loading financial database....."
puts ""
puts "Please type 'exit' to terminate the program."
puts ""

def show_menu
	puts "MAIN MENU:"
	puts "1. Add transaction"
	puts "2. Add user"
	puts "3. Add account"
	puts "4. Print Report"
end

show_menu

user_input = ""

until user_input == "EXIT"
	user_input = gets.chomp.upcase
	if user_input == '1'
		prompt_user(db, transaction_hash,"transactions")
		puts "TRANSACTIONS UPDATED."
	elsif user_input == '2'
		prompt_user(db, user_hash,"users")
		puts "USER CREATED."
	elsif user_input == '3'
		prompt_user(db, account_hash,"accounts")
		puts "ACCOUNT ADDED."
	elsif user_input == '4'
		puts "Enter a user ID:"
		user_id = gets.chomp
		accounts = db.execute("SELECT accounts.id FROM accounts WHERE accounts.user_id = #{user_id}")
		if accounts == []
			puts "No accounts exist for this user."
		else
			accounts.each do |account|
				print_account_info(db,user_id,account[0])
			end
		end
	elsif user_input != "EXIT"
		puts "I didn't understand you."
	end
	break if user_input == 'EXIT'
	show_menu
end



