Faculty.create!(name: "Facultad de Ingenieria de Sistemas e Informatica")
Faculty.first.schools.create!(name: "Ingenieria de Software")

Admin.create!(first_name: "Super", last_name: "Admin", email: "superadmin@quieroaprobar.com", password: "asdasdasd", code: "admin000", dni: "47677201", school_id: 1, phone: "987654321")