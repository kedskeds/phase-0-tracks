require 'sqlite3'
require 'faker'

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
account = Random.new 

categories = ["rent","entertainment","groceries","restaurants","bars","travel"]
amount = Random.new
id = Random.new


db.execute(create_users_table)
db.execute(create_accounts_table)
db.execute(create_transactions_table)

=begin
user_names = []
account_nums = []
user_ids = []
account_ids = []

10.times do |i|
	user_names << Faker::Name.name
	account_nums << account.rand(1000..9999)
	#user_ids << (i+1)
	user_ids << id.rand(1..10)
	account_ids << (i+1)
end

10.times do |i|
	create_user(db, user_names[i])
	create_accounts(db,bank_names.sample,account_nums[i],0,user_ids[i])
	create_transactions(db,"2016-10-12",categories.sample,amount.rand(-10000..10000),user_ids[i],account_ids[i])
end
=end


show_users = db.execute("SELECT * FROM users")
show_transactions = db.execute("SELECT * FROM transactions")
show_accounts = db.execute("SELECT * FROM accounts")

join_users_accounts = "SELECT users.name,accounts.bank_name,accounts.account_num FROM accounts JOIN users ON accounts.user_id = users.id"

users_and_accounts = db.execute(join_users_accounts)



def print_user_summary(db,user_accounts,user_id)
	user_info = db.execute("SELECT users.name,accounts.bank_name,accounts.account_num,transactions.amount FROM transactions JOIN accounts ON transactions.account_id = accounts.id JOIN users ON users.id = transactions.user_id WHERE users.id = '#{user_id}'")

	puts "#{user_info[0][0].upcase}:"
	user_info.each do |account|
		puts "#{account[1]} a/c ending -#{account[2]}"
		puts "-----------"
	end
end

print_user_summary(db,users_and_accounts,9)

def print_account_info(db,user_id,account_id)
	show_all_tables = "SELECT * FROM transactions JOIN accounts ON accounts.id = transactions.account_id JOIN users ON users.id = transactions.user_id"
	show_specific_rows = " WHERE users.id= #{user_id} AND accounts.id = #{account_id}"

	account_info= db.execute(show_all_tables+ show_specific_rows)

	ending_bal = 0
	puts "Beginning Balance: $0"
	account_info.each do |transaction|
		ending_bal += transaction['amount']
		puts "#{transaction['date']} $#{transaction['amount']}"
	end
	puts "-----------------------"
	puts "Ending Balance: $#{ending_bal}"
end


print_account_info(db,9,3)


