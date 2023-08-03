Subscription.destroy_all
Tea.destroy_all
Customer.destroy_all

green = Tea.create!(title: 'Green Tea', description: '18 count', region: 'China', brew_time: 7)
black = Tea.create!(title: 'Black Tea', description: '18 count', region: 'India', brew_time: 5)
oolong = Tea.create!(title: 'Oolong Tea', description: '18 count', region: 'Taiwan', brew_time: 4)
mint = Tea.create!(title: 'Mint Tea', description: '18 count', region: 'Morocco', brew_time: 3)
chamomile = Tea.create!(title: 'Chamomile Tea', description: '18 count', region: 'Egypt', brew_time: 3)
sleepytime = Tea.create!(title: 'Sleepytime Tea', description: '24 count', region: 'USA', brew_time: 6)

florie = Customer.create!(
  first_name: 'Florence',
  last_name: 'Everett',
  address: '123 Main St',
  email: 'feefee@mail.com',
  password: 'password',
  password_confirmation: 'password'
)
Tea.all.each do |tea|
  tea.subscriptions.create!(customer_id: florie.id)
end

harriet = Customer.create!(
  first_name: 'Harriet',
  last_name: 'Murphy',
  address: '24 Beachwood Ave',
  email: 'haphy@mail.com',
  password: 'password',
  password_confirmation: 'password'
)
harriet.subscriptions.create!(tea_id: mint.id, frequency: 2)
harriet.subscriptions.create!(tea_id: chamomile.id, frequency: 2)
harriet.subscriptions.create!(tea_id: sleepytime.id, frequency: 1, status: false)

matilda = Customer.create!(
  first_name: 'Matilda',
  last_name: 'Hurley',
  address: '99 Pine St',
  email: 'baby@mail.com',
  password: 'password',
  password_confirmation: 'password'
)
matilda.subscriptions.create!(tea_id: green.id)
matilda.subscriptions.create!(tea_id: black.id)
matilda.subscriptions.create!(tea_id: oolong.id)
