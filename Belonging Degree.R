#SETUP
#change all names of graph and community vector to match yours
#default network name is "YourGraph"
#default community vector is called "Communities"
library(gtools)
library(data.table)
library(igraph)
library(purrr)

#Each step needs to be run separately and in order

#STEP 1
#extract the community node membership lists to a dataframe
comms <- data.frame(matrix(data=NA, nrow=1, ncol=length(1:length(unique(membership(Communities))))))
#comm_rows <-transpose(comms)
colnames(comms) <-(1:length(unique(membership(Communities))))
comms[1:length(unique(membership(Communities)))] = 1:length(unique(membership(Communities)))
comm_t <- sapply(comms, function(t) {
  ti <-as.numeric(V(YourGraph)$name[membership(Communities)==t])
})
#comm_t<-as.data.frame(unlist(comm_t, recursive = FALSE))


#STEP 2
#iterate communities permutations - but singleton communities need to be skipped
#the commented out line below skips singleton communities using negative list of column numbers (check column numbers in your data first and change appropriately) 

#comm_list_new <- sapply(seq_along(comm_t)[c(-26,-27,-28,-29)], function(g) {

#OR use following condition:
#Condition to write singleton community numbers directly - might cause problems in later steps? 

comm_list_new <- sapply(seq_along(comm_t), function(g) {
  temp <- as.character(comm_t[[g]])
  if(length(temp) == 1){
    return (list(temp,temp))
    #return 
  } else {
    nodes_perm_t <- data.frame(permutations(length(temp),r=2,as.character(temp)))
  }
})


#STEP 3: Create character list of community members
comm_character_lists <- sapply(seq_len(ncol(comm_list_new)), function(u){
  #create character vector of node ids
  #I changed the transpose to t for cd_t because it wasn't working for some reason
  cs<-data.frame(1:length(unique(comm_list_new[[1,u]]))) #need to use 1 for first row and then column number inside two brackets
  cd_t<-t(cs)
  colnames(cd_t) <- unique(comm_list_new[[1,u]])
  cd_t[1:length(unique(comm_list_new[[1,u]]))] = unique(comm_list_new[[1,u]])
  first_row_vector = as.character(cd_t[1, ]);
})


#STEP 4: Iterate all the belonging degrees
belonging <- sapply(seq_len(ncol(comm_list_new)),  function(i){
  print(i)
  #put node permutation into columns
  nodes_perm_c <-data.frame(comm_list_new[c(1,2),i])#first numbers refer to rows (need both), second column for community ID
  colnames(nodes_perm_c) <- c("V1","V2")
  nodes_perm_c$V1 <-as.character(nodes_perm_c$V1)
  nodes_perm_c$V2 <-as.character(nodes_perm_c$V2)
  print(nodes_perm_c)
  
  #function to calculate edge weights within the community
  pairs <-function(a,b) {
    ei<-(E(YourGraph)[V(YourGraph)[a] %--% V(YourGraph)[b]])$weight
    if(length(ei) == 0){
      out <- 0
    } else {
      out <- ei
    }
    return(out)
  }
  
  #iterate the pairs to calculate internal node weight and total node weight
  cx <- mapply(pairs, nodes_perm_c$V1, nodes_perm_c$V2) 
  typeof(cx)
  str(cx)
  ct<-sapply(comm_character_lists[i], function(y){
    t<-E(YourGraph)[strength(YourGraph)[y]]
  })
  print(ct)
  node_c_weight = cbind(nodes_perm_c,cx)
  colnames(node_c_weight) <- c("X1","X2","cx")
  print(node_c_weight)
  total <- aggregate(cx~X1,node_c_weight,sum)
  names(total)[2] <- 'total'
  print(total)
  final_comm_weights = cbind(total,ct)
  #add column with the belonging degree
  final_comm_weights$belonging <- final_comm_weights$total/final_comm_weights$ct
  colnames(final_comm_weights) <- c("node ID","intra community weight", "total weight", "belonging")
  
  final<-as.data.frame(final_comm_weights)
})


#STEP 5:
####convert output to a table with each node in a row
####CHANGE NAME AND LOCATION OF OUTPUT FILE
new<-as.data.frame(belonging)
belonging <-map_dfr(new, as.list )
write.csv(belonging,"c://your/path/belonging.csv")
