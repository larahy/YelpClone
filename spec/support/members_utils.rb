def login
  member = Member.create(email: 'larahy@gmail.com', password: 'hugothedog', password_confirmation: 'hugothedog')
  login_as(member)
end