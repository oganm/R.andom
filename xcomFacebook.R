# get the facebook dump file from
# http://www.friendstogmail.com/about
# I tried it. seems harmless
# just copy paste the thing to an empty text file
# assigns everyone to random nations
xcomFacebook = function(faceDump, outFile){
    face = read.csv(faceDump)
    
    # sets unique id's for nations
    headers = c(UnitedStates = 'Am',
                Russia = 'Rs',
                China = 'Ch',
                India = 'In',
                Africa = 'Af',
                Mexico = 'Mx',
                Arab = 'Ab',
                England = 'En',
                France = 'Fr',
                Germany = 'Gm',
                Australia = 'Au',
                Italy = 'It',
                Japan = 'Jp',
                Israel = 'Is',
                Spain = 'Es',
                Greece = 'Gr',
                Norway = 'Nw',
                Ireland = 'Ir',
                Korea = 'Sk',
                Netherlands = 'Du',
                Scotland = 'Sc',
                Belgium = 'Bg')
    
    
    randomOrder = sample.int(nrow(face),replace = F)
    
    perCountry = floor(length(randomOrder)/length(headers))
    # assign the remainders
    countryAssign = rep(perCountry,length(headers))
    remain = length(randomOrder) - perCountry * length(headers)
    toAdd = sample.int(length(headers),remain,replace=F)
    countryAssign[toAdd] = countryAssign[toAdd] + 1
    
    # i'm not bothering to preallocate this. if you have enough
    # friends to slow this down in your facebook, you probably
    # suck
    lines = '[XComGame.XGCharacterGenerator]'
    for (i in 1:length(headers)){
        lines = c(lines,
                  '; ------------------------------------------',
                  paste('; --------------',names(headers)[i],'-------------------'),
                  '; ------------------------------------------',
                  paste0('m_arr',headers[i],'MFirstNames=" "'),
                  paste0('m_arr',headers[i],'FFirstNames=" "'))
        for (j in 1:countryAssign[i]){
            if (names(headers)[i]!='Russia'){
                lines = c(lines,
                          paste0('m_arr',headers[i],'LastNames="',face$Name[randomOrder[j]],'"'))
            } else {
                # Russia names are special because of gendered surnames. this will forever
                # doom your "russian" friends to a single gender.
                lines = c(lines,
                          paste0('m_arr',headers[i],sample(c('M','F'),1),'LastNames="',face$Name[randomOrder[j]],'"'))
            }
        }
        randomOrder = randomOrder[-(1:countryAssign[i])]
        
        
    }
    writeLines(lines,outFile)
    
}

