require 'sinatra'

def check_palindrome(word)
  word == word.reverse
end

def count_palindromes(text)
  #Se establece como precondición que todas palabras ingresadas son en minúscula y sin acentos
  #Expresión regular para extraer las palabras del string
  array = text.scan(/\w+/)
  count = 0
  array.each do |word|
  	if check_palindrome(word)
  	  count = count + 1 
  	end
  end
  count
end

get '/' do
  erb :form
end

post '/' do
  text = params[:text]
  count = count_palindromes(text)
  count.to_s
end

#Casos de prueba:
#"ana nacio en neuquen, nosotros somos turistas"
#"Cantidad de palabras magicas detectadas: 4"

#"la documentacion estaba incompleta, somos conscientes de eso"
#"Cantidad de palabras magicas detectadas: 1"
