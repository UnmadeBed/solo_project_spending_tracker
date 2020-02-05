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
  erb(:"merchants/add_merchant")
end

get '/edit_merchant/:id' do
  @merchant = Merchant.find_by_id(params[:id])
  erb(:"merchants/edit_merchant")
end

get '/add_tag' do
  @tags = Tag.all
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"tags/add_tag")
end

get '/edit_tag/:id' do
  @tag = Tag.find_by_id(params[:id])
  erb(:"tags/edit_tag")
end

post '/edit_tag/:id' do
  tag = Tag.new(params)
  tag.update
  redirect("/show_tags")
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
  merchant.save
  @merchants = Merchant.all
  erb(:"merchants/show")
end

post '/tags/delete/:id' do
  tag = Tag.find_by_id(params[:id])
  tag.delete
  redirect("/home")
end

get '/show_tags' do
  @tags = Tag.all
  erb(:"tags/show")
end

post '/show_tags' do
  tag = Tag.new(params)
  tag.save()
  @tags = Tag.all
  erb(:"tags/show")
end

get '/show_merchants' do
  @merchants = Merchant.all
  erb(:"merchants/show")
end

post '/edit_merchant/:id' do
  merchant = Merchant.new(params)
  merchant.save()
  @merchants = Merchant.all
  erb(:"merchants/show")
end
