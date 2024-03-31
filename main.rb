## No meio de um texto
text = "==========Texto Anterior=========== Av. Eng. Eusébio Stevaux, 823 - Apto. 13 - Santo Amaro, São Paulo - SP, 04696-000 -------------Texto Seguinte---------------"

## Endereçõ completo
# text = "Av. Eng. Eusébio Stevaux, 823 - Apartamento 13 - Santo Amaro, São Paulo - SP, 04696-000"

## CEP sem o hífen
# text = "Av. Eng. Eusébio Stevaux, 823 - Apartamento 13 - Santo Amaro, São Paulo - SP, 04696000"

## Diferente maneira de escrever Av.
# text = "Avenida Eng. Eusébio Stevaux, 823 - Apartamento 13  - Santo Amaro, São Paulo - SP, 04696-000"

## Letra maiúscula
# text = "AVENIDA ENGENHEIRO EUSÉBIO STEVAUX, 823 - APARTAMENTO 13 - SANTO AMARO, SÃO PAULO - SP, 04696-000"

## Letra minúscula
# text = "avenida eng. eusébio stevaux, 823 - apartamento 13 - santo amaro, são paulo - sp, 04696-000"

## Sem espaço
# text = "Av.Eng.EusébioStevaux,823-Sala13-SantoAmaro,SãoPaulo-SP,04696-000"

## Trocar separadores por hifen, menos o separador entre bairro e cidade
# text = "Av. Eng. Eusébio Stevaux - 823 - Apartamento 13  - Santo Amaro , São Paulo - SP - 04696-000"

## Trocar separadores por virgula, menos o separador número e complemento e compelemento e bairro (ou cidade)
# text = "Av. Eng. Eusébio Stevaux , 823 - Apartamento 13  - Santo Amaro , São Paulo , SP , 04696000"

## Outro tipo de compelmento
# text = "Av. Eng. Eusébio Stevaux, 823 - Casa - Santo Amaro, São Paulo - SP, 04696-000"
# text = "Av. Eng. Eusébio Stevaux, 823 - Apt.12 - Santos Amaro, São Paulo - SP, 04696-000"

## Sem complemento
# text = "Av. Eng. Eusébio Stevaux, 823 - Santo Amaro, São Paulo - SP, 04696-000"

## Sem bairro
# text = "Av. Eng. Eusébio Stevaux, 823 - Apartamento 13 - São Paulo - SP, 04696-000"

## Sem  complemento e sem bairro
# text = "Av. Eng. Eusébio Stevaux, 823 - São Paulo - SP, 04696-000"

logradouro = /(?<tipo>(?i:Aeroporto|Alameda|Al|Área|Area|Avenida|Av|Campo|Chácara|Chacara|Colônia|Colonia|Condomínio|Condominio|Conjunto|Distrito|Esplanada|Estação|Estaçao|Estacao|Estrada|Favela|Fazenda|Feira|Jardim|Ladeira|Lago|Lagoa|Largo|Loteamento|Morro|Núcleo|Nucleo|Parque|Passarela|Pátio|Patio|Praça|Quadra|Recanto|Residencial|Rodovia|Rua|Setor|Sítio|Sitio|Travessa|Trecho|Trevo|Vale|Vereda|Via|Viaduto|Viela|Vila))/
different_letters = /[a-zA-ZáàâãéèêíìîóòôõúùûçÁÀÂÃÉÈÊÍÌÎÓÒÔÕÚÙÛÇ]/

address_extraction = text.match(/(?<rua>#{logradouro.source}\.?)(\s?)(?<nome>(#{different_letters.source}|\.|\s)+)(\s?(,|-)\s?)(?<numero>\d+)(\s?(-)\s?)((?<complemento>(#{different_letters.source}|\d|\s|\.)+)\s?-\s?)?((?<bairro>(#{different_letters.source}|\s)+)\s?(,)\s?)?(?<cidade>(#{different_letters.source}|\s)+)(\s?(,|-)\s?)(?<estado>[a-zA-Z]{2})(\s?(,|-)\s?)(?<cep>[0-9]{5}-?[0-9]{3})/)

if address_extraction
  puts "Tipo: " + (address_extraction[:rua] ? address_extraction[:rua] : "")
  puts "Nome: " + (address_extraction[:nome] ? address_extraction[:nome] : "")
  puts "Número: " + (address_extraction[:numero] ? address_extraction[:numero] : "")
  puts "Complemento: " + (address_extraction[:complemento] ? address_extraction[:complemento] : "")
  puts "Bairro: " + (address_extraction[:bairro] ? address_extraction[:bairro] : "")
  puts "Cidade: " + (address_extraction[:cidade] ? address_extraction[:cidade] : "")
  puts "Estado: " + (address_extraction[:estado] ? address_extraction[:estado] : "")
  puts "CEP: " + (address_extraction[:cep] ? address_extraction[:cep] : "")

  puts "\n"
  puts address_extraction
else
  puts "Nenhum endereço encontrado"
end
