options("error" = function(){
    a=floor(runif(1,1,18))
    switch(a,
           {cat('You failed again')},
           {cat('When will you learn?')},
           {cat('Your code is bad and you should feel bad')},
           {cat('Incompetence at the highest echelons of power!')},
           {cat("Just give up")},
           {cat("Don't quit your day job")},
           {cat("Why are you even trying?")},
           {cat("It's not R. It's you")},
           {cat("You fucked it up")},
           {cat("Go back to BASIC")},
           {cat("What were you thinking!")},
           {cat("This is bullshit!")},
           {cat("I hope you are not getting paid for this")},
           {cat("Please don't have kids")},
           {cat("You don't deserve me")},
           {cat("Your powers are weak!")}),
           {cat("NOOOOOOOOOO!")})
    .rs.recordTraceback(TRUE)
})
