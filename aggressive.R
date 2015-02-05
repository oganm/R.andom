options("error" = function(){
    a=floor(runif(1,1,16))
    switch(a,
           {print('You failed again')},
           {print('When will you learn?')},
           {print('Your code is bad and you should feel bad')},
           {print('Incompetence at the highest echelons of power!')},
           {print("Just give up")},
           {print("Don't quit your day job")},
           {print("Why are you even trying?")},
           {print("It's not R. It's you")},
           {print("You fucked it up")},
           {print("Go back to BASIC")},
           {print("What were you thinking!")},
           {print("This is bullshit!")},
           {print("I hope you are not getting paid for this")},
           {print("Please don't have kids")},
           {print("You don't deserve me")})
    .rs.recordTraceback(TRUE)
})
