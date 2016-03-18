# AC: armor class
# bonus: attack bonus of the group
# count: number of entities in the group
# advantage: N = normal. A = with advantage, D = with disadvantage
# dice = number and type of die
# damageBonus = bonus to damage
# default settings are for animating 10 tiny objects but should work with any mob of identical creatures

animate = function(AC, bonus = 8, count = 10, advantage = 'N', dice = '1d4' , damageBonus = 4){
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
    
    diceCount = as.integer(regmatches(dice,regexpr(".*?(?=d)",dice,perl = T)))
    diceSide = as.integer(regmatches(dice,regexpr("(?<=d).*",dice,perl = T)))
    
    sum(
        sapply(out,function(x){
            if(x == 20){
                return(sum(sample(1:diceSide,diceCount*2)) + damageBonus)
            } else if(x==1){
                return(0)
            }else{
                if ((x + bonus - AC) >= 0){
                    return(sample(1:diceSide,diceCount) + damageBonus)
                } else {
                    return(0)
                }
            }
        }))
}
