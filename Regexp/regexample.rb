re = /red/
linea = "12 564"
partes = linea.split(" ")

if partes.length == 2 && partes.all? { |parte| parte.match(/^\d{1,3}$/) }
  puts "Coincidencia: #{partes[0]}"
else
  puts "No coincide con el patrón esperado."
end

