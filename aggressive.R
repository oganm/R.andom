options("error" = function(){
    a=floor(runif(1,1,6))
    switch(a,
           {print('You failed again Lila')},
           {print('When will you learn?')},
           {print('Your code is bad and you should feel bad')},
           {print('Incompetence at the highest echelons of power!')},
           {print("Just give up")})
    print('You fucked it up moron')
    .rs.recordTraceback(TRUE)
})
