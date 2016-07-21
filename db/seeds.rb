# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Users
emails = ['ssstarlet@gmail.com', 'dividulcedo@gmail.com', 'vivek@gmail.com', 
            'chinna@gmail.com', 'elango@gmail.com', 'aathi@gmail.com', 'kannan@gmail.com']
first_names = ['sathiyaseelan', 'divylakshmi', 'vivek', 'chinnachamy', 'elango', 'aarthi', 'kannan']

last_names = ['m', 'sathiyaseelan', 'kuduva', 's', 'p', 'thambithurai', 'mani']

(0...last_names.size).each do |index|
    User.create email: emails[index], first_name: first_names[index],
                last_name: last_names[index], password: 'password', password_confirmation: 'password',
                confirmed_at: Time.now
            
end

#Create Groups
group_names = ['My Office Party Group', 'My Room', 'Trekking Group',
                'Birthday Celebration', 'Orphanage Fund']

group_names.each do |group_name|
    Group.create name: group_name, description: 'Expense Management for ' + group_name
end

#Create members
users = User.all
groups = Group.all

group1 = groups[0]

group1.add_moderator(users[0])
group1.add_member(users[1])
group1.add_member(users[2])
group1.add_member(users[3])
group1.add_member(users[4])

group2 = groups[1]

group2.add_member(users[0])
group2.add_moderator(users[1])
group2.add_member(users[2])
group2.add_member(users[3])
group2.add_member(users[4])


group3 = groups[2]

group3.add_member(users[0])
group3.add_moderator(users[2])
group3.add_moderator(users[3])
group3.add_moderator(users[4])
