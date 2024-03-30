text =  "dfkhakdhfkjahdsf Avenida Eng. Eusébio Stevaux, 823 - Sala 13- Santo Amaro, São Paulo - SP, 04696-000 aldsjfljasdlfjkl"

logradouro = /(?<tipo>(Aeroporto|Alameda|Al.|Área|Area|Avenida|Av.|Campo|Chácara|Chacara|Colônia|Colonia|Condomínio|Condominio|Conjunto|Distrito|Esplanada|Estação|Estaçao|Estacao|Estrada|Favela|Fazenda|Feira|Jardim|Ladeira|Lago|Lagoa|Largo|Loteamento|Morro|Núcleo|Nucleo|Parque|Passarela|Pátio|Patio|Praça|Quadra|Recanto|Residencial|Rodovia|Rua|Setor|Sítio|Sitio|Travessa|Trecho|Trevo|Vale|Vereda|Via|Viaduto|Viela|Vila))/
different_letters = /[a-zA-ZáàâãéèêíìîóòôõúùûçÁÀÂÃÉÈÊÍÌÎÓÒÔÕÚÙÛÇ]/

address_extraction = text.match(/(?<rua>#{logradouro.source})\s?(?<nome>(#{different_letters.source}|\.|\s)+)\s?(,|-)\s?(?<numero>\d+)\s?((,|-)\s?(?<complemento>(#{different_letters.source}|\d|\s)+)\s?)?((,|-)\s?(?<bairro>(#{different_letters.source}|\s)+)\s?)?(,|-)\s?(?<cidade>(#{different_letters.source}|\s)+)\s?(,|-)\s?(?<estado>[a-zA-Z]{2})\s?(,|-)\s?(?<cep>[0-9]{5}-?[0-9]{3})/)

if address_extraction
  puts address_extraction
else
  puts "None"
end
