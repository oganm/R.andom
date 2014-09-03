# recursively converts a directory full of flacs to another directory
# while preserving it's subdirectory structure
# requires lame and flac installed and added at your path
# end input names with "/"
# as you can see it's clearly for windows. 
daFolder = "E:/Müzik/Interpol - Discography (2000-2012) [FLAC]/"
out = "E:/Müzik/Interpol - Discography (2000-2012) [MP3]/"
temp = "E:/Müzik/Interpol - Discography (2000-2012) [WAV]/"

fileList = list.files(daFolder,recursive=T)


winOut = gsub('/','\\\\',out)
winDaFolder = gsub('/','\\\\', daFolder)
winTemp = gsub('/','\\\\',temp)

for (i in fileList){

    justAd = regmatches(i, gregexpr('^(.+)/', i,perl=T))[[1]]
    justAdWin = gsub('/','\\\\',justAd)

    dir.create(paste0(temp, justAd)
               ,showWarnings = F, recursive = T)

    justName =  regmatches( i, gregexpr('([^/]+)$', i,perl=T))[[1]]


    noExt = regmatches( justName, gregexpr('^(.+)(?=[.])', justName,perl=T))[[1]]

    system(paste0('flac -d -o "',winTemp,justAdWin,noExt,'.wav" "',winDaFolder,gsub('/','\\\\',i),'"'))
}


fileList = list.files(temp,recursive=T)

for (i in fileList){
    justAd = regmatches(i, gregexpr('^(.+)/', i,perl=T))[[1]]
    justAdWin = gsub('/','\\\\',justAd)
    dir.create(paste0(out, justAd)
               ,showWarnings = F, recursive = T)

    justName =  regmatches( i, gregexpr('([^/]+)$', i,perl=T))[[1]]
    noExt = regmatches( justName, gregexpr('^(.+)(?=[.])', justName,perl=T))[[1]]

    system(paste0('lame -b128 "',winTemp,gsub('/','\\\\',i),'" "',winOut,justAdWin,noExt,'.mp3"'  ))
}


lame -b128 sample.wav  sample.mp3
