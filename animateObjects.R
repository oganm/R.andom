animate = function(AC, bonus = 8, count = 10, advantage = 'N', dice = 4 , damageBonus = 4){
    out = sapply(1:count, function(x){
        out = sample(1:20,size = 1)
        if (advantage == 'A'){
            out2 = sample(1:20,size = 1)
            out = max(out,out2)
        } else if(advantage == 'D'){
            out2 = sample(1:20,size = 1)
            out = min(out,out2)
        }
        return(out)
    })
    
    sum(
        sapply(out,function(x){
            if(x == 20){
                return(sum(sample(1:dice,2)) + damageBonus)
            } else{
                if (x + bonus - AC >= 0){
                    return(sample(1:dice,1) + damageBonus)
                } else {
                    return(0)
                }
            }
        }))
}
