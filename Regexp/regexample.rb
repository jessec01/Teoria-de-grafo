re = /red/
s = 'hello'
#puts s.sub(/[aeiou]/, '*')# reemplazar lo primero que encuentra de primer arg a segundo
#puts s.gsub(/[aeiou]/, '*') # reemplaza todo lo que encuentra
#puts s.gsub(/[aeiou]/, '')# reemplaza todo por vacio
#puts s.sub(/ell/, 'al')   # => "halo"
#puts s.gsub(/xyzzy/, '*') # no encontro nada

#puts 'THX1138'.gsub(/\d+/, '00')  # reemplaza uno o mas digito  por 00

#puts 'THX1138'.gsub('\d+', '00') # => "THX1138"
h = {'foo' => 'bar', 'baz' => 'bat'}
#puts 'food'.sub('foo', h) # => "bard"
#En este caso, 'foo' actúa como una clave en el hash,
#y cuando se encuentra en la cadena, se reemplaza por su valor 
#correspondiente 'bar'. La cadena resultante mantiene el resto del contenido 
#intacto, por lo que 'food' se convierte en 'bard'.
#Es una forma poderosa de usar hashes para realizar reemplazos 
#dinámicos en cadenas. ¡Bien hecho! 
h = {foo: 'bar', baz: 'bat'}
#puts 'food'.sub('foo', h) # => "d"
#En este caso, 'foo' no coincide
#con ninguna clave en el hash h porque
#las claves son símbolos (:foo), no cadenas ('foo').
#Como resultado, sub no encuentra una coincidencia
# y no realiza el reemplazo, dejando solo la parte
 # de la cadena que no coincide, que es 'd'
 #s = '@'
 #puts '1234'.gsub(/\d/) {|match| s.succ! } # => "ABCD"
 #se inicializa s='@'
 #en 1234 se busca todos coincidencia de todos los digitos
 #en la coincidencia en la cadena se reemplaza por su valor siguiente
 #si estuvera s.succ permite acceder al siguiente elemento
 #pero no permite reemplazarlo
 s = 'hello there'
#puts s[/[aeiou](.)\1/] # => "ell"
#puts s[/[aeiou](.)\1/, 0] # => "ell"
#la primera coincidencia de una vocal
#de el siguiente caracter
#y que el siguiente caracter se igual a la captura
s = 'hello there'
s[/[aeiou](.)\1/, 1] # => "l"
#puts s[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] # => "l"
#puts s[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, :vowel] # => "e"
#captura cualquier vocal y lo almacena en una captura
#y lo renombra a vowel luego hace lo mismo
# busca ^ no vocales con ese simbolo y lo renombra como 
#base de datos como non_vowel 
#en una muestra "non_vowel"
#en otro muestra :vowel
#el modo simbolo es mas optimo
# puts  "digraph".match /\w*/
s = "34->45;"
n=10
array_num=[n]
puts array_num.class
m=10
n.times do |i|
    array_num[i]=Array.new(m)
end
puts array_num.class
n.times do |i|
    m.times do |j|
        array_num[i][j]=6
    end
end 
puts array_num.inspect 
#puts match 
match = s.match(/>([^;]+)/)
#puts match[1]


