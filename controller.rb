require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( './models/transaction' )
require_relative( './models/tag')
require_relative( './models/merchant')
also_reload( './models/*' )

get '/home' do
  @transactions = Transaction.all
  erb(:index)
end

get '/add_transaction' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/add_transaction")
end

get '/edit_transaction' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/edit_transaction")
end

get '/add_merchant' do
  @merchants = Merchant.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"merchants/add_merchant")
end

get '/edit_merchant' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"merchants/edit_merchant")
end

get '/add_tag' do
  @tags = Tag.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"tags/add_tag")
end

get '/edit_tag' do
  @tags = Tag.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"tags/edit_tag")
end

post '/add_transaction' do
  @transactions = Transaction.new( params )
  @transactions.save()
  erb(:"transactions/create")
end

get '/show' do
  @transactions = Transaction.all
  @tags = Tag.all
  erb(:"transactions/show")
end
@merchants = Merchant.all

post '/transactions/delete/:id' do
  transaction = Transaction.find_by_id(params[:id])
  transaction.delete
  redirect("/home")
end

get '/transactions/edit/:id' do
  @transaction = Transaction.find_by_id(params[:id])
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/edit_transaction")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update
  @transactions = Transaction.all
  erb(:"transactions/show")
end

post '/add_merchant' do
  merchant = Merchant.new(params)
  merchant.update
  @merchants = Merchant.all
  erb(:"transactions/show")
end
