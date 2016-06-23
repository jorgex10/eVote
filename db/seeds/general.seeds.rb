Faculty.create!(name: "Facultad de Ingenieria de Sistemas e Informatica")
Faculty.first.schools.create!(name: "Ingenieria de Software")

Admin.create!(first_name: "Super", last_name: "Admin", email: "jorge.calvo@tektonlabs.com", password: "asdasdasd", code: "superadmin001", dni: "47677201", phone: "972052891")