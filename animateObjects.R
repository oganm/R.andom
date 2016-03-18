animate = function(AC, bonus = 8, count = 10, advantage = F, dice = 4 , damageBonus = 4){
  out = sapply(1:count, function(x){
    out = floor(runif(1,1,21))
    if (advantage == T){
      out2 = floor(runif(1,1,21))
      out = max(out,out2)
    }
    return(out)
    })
  
  sum(sapply(1:sum(out + bonus - AC >= 0), function(x){
    floor(runif(1,1,dice+1))+ damageBonus
  }))
  
}
