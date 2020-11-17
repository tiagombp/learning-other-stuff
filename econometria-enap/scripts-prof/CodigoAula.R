################################################################################
#                            Curso Basico de R                                 #
################################################################################

# ---------------------------------------------------------------------------- #  
#                               Data.frame                                     #
# ---------------------------------------------------------------------------- #

# Ilustracao com dado airquality do R

data("airquality") # carregando dado ja presente no R

View(airquality) # visualizacao do dado carregado no R

?airquality # examinando o dado no proprio Help do R

class(airquality) # verificando o formato do objeto no R

dim(airquality) # numero de observacoes e variaveis

names(airquality) # nome das variaveis

summary(airquality) # sumario de todas as variaveis

airquality$Ozone # acessando colunas (variaveis) pelos nomes

airquality[,1:3] # acessando colunas (variaveis) pelo numero (1 a 3)

airquality$TempPadr <- scale(airquality$Temp) # incluindo uma nova coluna que apresenta
# as temperaturas padronizadas (subtraindo media e dividindo pelo desvio padrao)

# Note que agora o dado tem 7 colunas!!!
dim(airquality)

# Como ordenar o data.frame usando uma coluna de referencia (exemplo: Ozone)?
pos <- order(airquality$Ozone) # retorna a posicao de cada elemento no vetor ordenado
dado_ord <- airquality[pos,]

# -----------------------------------//--------------------------------------- #

# ********************
# Comandos especificos
# ********************


# ****** Comando "subset": extracao de subconjunto segundo alguma variavel

dado <- subset(airquality, airquality$Temp > 80) # extraindo subcojunto dos dados 
# com Temperatura (graus F) maior que 80

dado2 <- subset(airquality, airquality$Temp > 80,
                select = c(Ozone,Temp)) # extraindo subcojunto dos dados com 
# Temperatura maior que 80 e retornando apenas as variaveis Ozone e Temp

dado3 <- subset (airquality, airquality$Temp > 80 & airquality$Month==6)

# ****** Funcao "apply": aplica uma funcao em um objeto (matriz, data.frame) por linha ou coluna
apply(dado,2,mean) # aplicar no objeto "dado" por coluna a media aritmetica
# note que ha NA (valores faltantes) e se fosse calcular qualquer estatistica resultaria em NA

apply(dado,2,mean,na.rm=T) # alternativa neste caso: calcula a media retirando os valores faltantes
# em cada caso.

apply(dado,2,sd,na.rm=TRUE) # aplicando o desvio padrao por variavel

# ****** Comando "split": divisao de objeto em grupos (listas)

dado <- split(airquality, airquality$Month) # dividindo conjunto de dados por mes
View(dado)

dado2 <- split(airquality, list(airquality$Month,airquality$Day>15)) # dividindo por mes
# e quinzena (TRUE indica dia 15 em diante e FALSE do dia 1 ate dia 15, inclusive)
View(dado2)

names(dado2) = c("Maio1a15","Junho1a15","Julho1a15","Agosto1a15","Setembro1a15",
                 "Maio>15","Junho>15","Julho>15","Agosto>15","Setembro>15") # renomeando
View(dado2)

# ****** Comando "aggregate": calcula estatistica-resumo de subconjuntos

media <- aggregate(airquality,list(airquality$Month),mean) # media por mes

media <- aggregate(airquality[,1:4],list(airquality$Month),mean,na.rm=TRUE) # media por mes, mas
# apenas para variaveis Ozone, Solar, Wind e Temp e retirando os NA

media2 <- aggregate(airquality[,1:4],list(airquality$Month,airquality$Temp>80),mean,na.rm=TRUE)
names(media2)[1] = "Mes"
names(media2)[2] = "Temperatura > 80"

# OBS: o que esta feito acima, pode ser feito usando por exemplo, os comandos split e 
# em seguida aggregate, da seguinte forma:

dado_gps <- split(airquality,airquality$Temp>80)
mediagp1 <- aggregate(dado_gps$"FALSE"[,1:4],list(dado_gps$"FALSE"$Month),mean,na.rm=TRUE)
mediagp2 <- aggregate(dado_gps$"TRUE"[,1:4],list(dado_gps$"TRUE"$Month),mean,na.rm=TRUE)

names(mediagp1)[1] <- "Month"
names(mediagp2)[1] <- "Month"

#******** Comando Merge: une 2 data.frames usando colunas ou linhas em comum

mediageral <- merge(mediagp1,mediagp2,by="Month")

# Como juntar num unico data.frame por mes os dados referentes 
# aos dias 16 e 31 de todos os meses (linha refere-se a cada mes)?

gp1 <- subset(airquality,airquality$Day==31)
gp2 <- subset(airquality,airquality$Day==16)

resultado1 <- merge(gp1,gp2,by="Month") # unindo dois grupos por mes (dias 31 e dias 16)
# Note que faltam os meses de junho e setembro, pois estes meses nao tem dia 31

resultado2 <- merge(gp1,gp2,by="Month",all=TRUE) # note que temos apenas 3 meses com o dia 
# 31 e 5 com o dia 16, logo all=TRUE permite por as nao intersecoes neste caso

# -----------------------------------//--------------------------------------- #

# Outros exemplos:

# Dados de eleicoes presidencias no EUA
data(presidentialElections)
??presidentialElections # mostra qual pacote eh necessario
# Primeiro instale o pacote e toda vez que reabrir o Rstudio, basta carrega-lo, 
# usando o comando abaixo;
require(pscl) 
View(presidentialElections)
?presidentialElections

# a) calcule a porcentagem media de votos por ano e em seguida por estado
calc1a <- aggregate(presidentialElections$demVote,list(presidentialElections$year),mean) # agregando em termos da proporcao media por ano

calc2a <- aggregate(presidentialElections$demVote,list(presidentialElections$state),mean) # agregando em termos da proporcao media por estado

# b) calcule o numero de anos com votacao por estado
calcb <- aggregate(presidentialElections$demVote,list(presidentialElections$state),length) # anos que cada estado aparece

# c) calcule a porcentagem media de votos por ano e separando em estados participantes da
# Confederacao ou nao (apenas use aggregate)
calcc <- aggregate(presidentialElections$demVote,
                   list(Year = presidentialElections$year,
                        Confederacy = presidentialElections$south),mean)

# d) extraia para um novo banco de dados apenas os resultados dos estados participantes da Confederacao
dado_d <- subset(presidentialElections,presidentialElections$south==TRUE)

# e) extraia para um novo banco de dados apenas os resultados dos estados participantes da Confederacao
# com proporcao de votos maio que 60%
dado_e <- subset(presidentialElections,presidentialElections$south==TRUE & presidentialElections$demVote>60)

# f) crie um novo data.frame que una os anos 1948 e 2008 por estado (em cada linha)?
y08 <- subset(presidentialElections,presidentialElections$year==2008)
y48 <- subset(presidentialElections,presidentialElections$year==1948)

dim(y08) 
dim(y48) # note que o numero de estados em cada ano eh diferente
dado2anos <- merge(y48,y08,by="state") # criando um data-frame
# combinando os dois anos

dado2anos <- merge(y48,y08,by="state",all=TRUE) # incluindo as nao intersecoes


# g) separe o banco de dados por ano. E em seguida, por estado.

dadosep_ano <- split(presidentialElections,presidentialElections$year) # separando dados por ano
dadosep_ano$`1932` # exemplo de 1 ano

dadosep_est <- split(presidentialElections,presidentialElections$state) # separando dados por ano
dadosep_est$California # exemplo de 1 estado

# -----------------------------------//--------------------------------------- #

# Exercicios

load("titanic.RData") # carregando RData, garanta sempre que diretorio onde se encontra
# o dado esta de acordo com o diretorio da sessao do R em uso

# a) Calcule o numero de passageiros em cada classe

# b) inclua uma coluna com o nome Familia que contenha o numero de pessoas por familia (Pais.Filhos + Irmaos.Conjuges)

# c) Monte uma tabela com o valor medio 
# das tarifas pagas separadas por classe, salve 
# essa tabela com nome "Tab1" e renomeie colunas de forma adequada

# d) Monte uma tabela com o valor medio 
# das tarifas pagas separadas por classe e porto 
# de embarque, salve essa tabela com nome "Tab2" 
# e colunas de forma adequada

# e) Monte uma tabela com o numero de 
# sobreviventes em cada classe, salve essa tabela 
# com nome "Tab3" e renomeie colunas
# de forma adequada

# f) Monte uma tabela com a idade media 
# dos sobreviventes e nao sobreviventes, salve 
# essa tabela com nome "Tab4" e renomeie colunas de forma adequada

# g) Salve com o nome "dadosobr" um subconjunto do dado original referente 
# apenas aos sobreviventes

# h) Salve com o nome "dadosobr2" um subconjunto (apenas colunas Classe e Tarifa) 
# do dado original referente apenas aos sobreviventes

# i) Salve com o nome "dadosobr3" um subconjunto do dado original 
# referente apenas os sobreviventes da Classe 1

# j) Separe dentro de uma lista com o nome "dadoporClasse" os dados por Classe

# l) Separe dentro de uma lista com o nome "dadoporClasseSobrev" os dados 
# por Classe e sobrevivente ou nao sobrevivente. Em seguida, 
# renomeie cada lista de forma adequada, indicando a que ela se refere.

dadoporClasseSobrev <- split(titanic,list(titanic$Classe,titanic$Sobreviveu))

names(dadoporClasseSobrev)
names(dadoporClasseSobrev) <- c("C 1 - Nao Sobrev","C 2 - Nao Sobrev",
                                "C 3 - Nao Sobrev", "C 1 - Sobrev",
                                "C 2 - Sobrev","C 3 - Sobrev")

# OBS: Empilhamento usando rbind
dadocl1e2 <- rbind(dadoporClasse$"1",dadoporClasse$"2") # emplihando dados da classe 1 e 2

