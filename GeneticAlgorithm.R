
# Genetic Algorithm that finds a propper combination of variables from a database 
# which explains accurately the risk of getting a CVD having VIH


# Reading the database
data <- read.csv("../../VIHArticle/VIH.csv")

# Evaluating functions 
pop <- generate_population(4, 10, names(data))
papas <- selection_method(pop, objective_function_example)
hijos <- cross_over_one(papas)


# Algorithm 

# This method generates a random population based on the variables from a database 
generate_population <- function(size_per_ind, size_population, columns){
  print(paste("Generating population of size: ", size_population, sep = " "))
  # Matrix that contains the individuals per population
  population <- matrix(nrow = size_population, ncol = size_per_ind)
  for(row in 1:nrow(population)){
    for(col in 1:ncol(population)){
      population[row,col] <- sample(columns, 1)
    }
  }
  # Returning the population 
  population 
}

# Objective function to get the fitness of one element of the population 
objective_function_example <- function(array_variables){
  return(sample(c(1,2,3,4,5), 1))
}

# Tournament that decides the element with the highest fitness value
tournament <- function(candidates, Ofunction){
  if(do.call(Ofunction, args= list(candidates[1,])) > do.call(Ofunction, args= list(candidates[2,]))){
    if(do.call(Ofunction, args= list(candidates[1,])) > do.call(Ofunction, args= list(candidates[3,]))){
      return(candidates[1,])
    }else{
      return(candidates[3,])
    }
  }else{
    if(do.call(Ofunction, args= list(candidates[2,])) > do.call(Ofunction, args= list(candidates[3,]))){
      return(candidates[2,])
    }else{
      return(candidates[3,])
    }
  }
}

# Selects three random elements from the population 
select_three_random <- function(population){
  num1 <- sample(c(1:(length(population)/length(population[1,]))),1)
  num2 <- sample(c(1:(length(population)/length(population[1,]))),1)
  num3 <- sample(c(1:(length(population)/length(population[1,]))),1)
  return(t(matrix(c(population[num1,], population[num2,], population[num3,]), ncol = 3, nrow = length(population[1,]))))
}

# Selection method to get two parents from the population 
selection_method <- function(population, ob_function){
 candidates <- select_three_random(population)
 winner_1 <- tournament(candidates, ob_function)
 candidates <- select_three_random(population)
 winner_2 <- tournament(candidates, ob_function)
 return(t(matrix(c(winner_1, winner_2), ncol = 2, nrow = length(population[1,]))))
}

# CrossOver thats generates two children from a random numer 
cross_over_probabilistic <- function(parents){
  cut_param <- sample(c(1:length(parents[1,])), 1)
  for(i in cut_param:length(parents[1,])){
    elem1 <- parents[1,i]
    elem2 <- parents[2,i]
    parents[1,i] <- elem2
    parents[2,i] <- elem1
  }
  return(parents)
}

# CrossOver that takes element to element from the parents to generate the children 
cross_over_one <- function(parents){
  for(i in seq(2,length(parents[1,]), 2)){
    elem1 <- parents[1,i] 
    elem2 <- parents[2,i]
    parents[1,i] <- elem2
    parents[2,i] <- elem1
  }
  return(parents)
}

# CrossOver that takes the half from both parents to generate the children 
cross_over_half <- function(parents){
  half_size <- (lengh(parents[1,])/2) + 1
  for(i in half_size:length(parents[1,])){
     elem1 <- parents[1,i]
     elem2 <- parents[2,i]
     parents[1,i] <- elem2
     parents[2,i] <- elem1
  }
  return(parents)
}

# Mutation function 
mutation <- function(children, population, pc_mutation){
  for(i in 1:length(children[1,])){
     coeff1 <- runif(1,0,1)
     coeff2 <- runif(1,0,1)
     if(coeff1 < pc_mutation){
       children[1,i] <- sample(population,1)
     }
     if(coeff2 < pc_mutation){
       children[2,i] <- sample(population,1)
     }
  }
  return(children)
}