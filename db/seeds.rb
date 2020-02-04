require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require('pry')


Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()


merchant1 = Merchant.new({
  'name' => 'HMV',
  'location' => 'Glasgow'
  });
merchant1.save()

merchant2 = Merchant.new({
  'name' => 'Boots',
  'location' => 'NYC'
  });
merchant2.save()

merchant3 = Merchant.new({
  'name' => 'Costa',
  'location' => 'Edinburgh'
  });
merchant3.save()



tag1 = Tag.new({
  'name' => 'Lifestyle'
});
tag1.save()

tag2 = Tag.new({
  'name' => 'Health'
});
tag2.save()

tag3 = Tag.new({
  'name' => 'Lunch'
});
tag3.save()


transaction1 = Transaction.new({
  'amount' => 7.00,
  'merchant_id' => merchant1.id,
  'tag_id' => tag1.id
  });
transaction1.save()

transaction2 = Transaction.new({
  'amount' => 11.00,
  'merchant_id' => merchant2.id,
  'tag_id' => tag2.id
  });
transaction2.save()

transaction3 = Transaction.new({
  'amount' => 23.00,
  'merchant_id' => merchant3.id,
  'tag_id' => tag3.id
  });
transaction3.save()

binding.pry
nil
