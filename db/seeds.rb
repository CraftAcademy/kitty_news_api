# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

Category.create(label: 'global_politics')
Category.create(label: 'sports')
Category.create(label: 'self_care')
Category.create(label: 'news')
Category.create(label: 'culture')

User.create(email: 'viktor@journalist.com', password: 'password', password_confirmation: 'password', role: 'journalist')
User.create(email: 'sanne@notjournalist.com', password: 'password', password_confirmation: 'password', role: 'subscriber')
User.create(email: 'kyungin@super.com', password: 'password', password_confirmation: 'password', role: 'registered_user')
User.create(email: 'paulina@journalist.com', password: 'password', password_confirmation: 'password', role: 'journalist')
User.create(email: 'erik@mail.com', password: 'password', password_confirmation: 'password', role: 'subscriber')
User.create(email: 'registered@user.com', password: 'password', password_confirmation: 'password', role: 'registered_user')
