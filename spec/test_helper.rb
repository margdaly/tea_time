
def customer_violet
  Customer.destroy_all
  @green = Tea.create!(title: 'Green Tea', description: '18 count', region: 'China', brew_time: 7)
  @sleepytime = Tea.create!(title: 'Sleepytime Tea', description: '24 count', region: 'USA', brew_time: 6)

  @violet = Customer.create!(first_name: 'Violet',
                             last_name: 'Beauregarde',
                             email: 'v-beau@email.com',
                             address: '1278 Main St',
                             password: 'test',
                             password_confirmation: 'test')

  @subscription1 = @violet.subscriptions.create!(tea_id: @green.id, status: false)
  @subscription2 = @violet.subscriptions.create!(tea_id: @sleepytime.id, frequency: 0)
end
