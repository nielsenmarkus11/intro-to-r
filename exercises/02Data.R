## Vectors
x <- c(3,2,8)
x

y <- c(x, 5, x)
y
y >= 5

z <- c(y, 'a')
z
as.numeric(z)

rev(y)

1:10
10:1
-3:4
1.5:10.5
1.2:10

seq(1,10)
seq( to=3, length=5, by= -4 )
seq( 0, 1, 0.1 )
seq( 0, 1, length=6 )

rep( 1:3, 5 )
rep( 1:3, each=5 )
rep( 1:3, c(4, 5, 2) )
rep( 1:3, each=5, length.out=30 )

rnorm(5)
rnorm(5, 100, 5)

set.seed(18)
runif(3)
runif(5)
set.seed(18)
runif(3)

## Named Vectors
x <- c(1,4,2,0,-100)
x
names(x) <- c('one','two','three','a','b')
x
names(x)

names(x) <- NULL
x

## Subsetting Vectors
letters
letters[ 3 ]
letters[ c(1,3,5,25) ]
letters[1:10]
letters[ -3 ]
letters[ -c(1,3,5) ]
letters[ 26:1 ]
letters[ c( 1:5, rep(6:10, each=2) , 26:20) ]

x <- round( rnorm(10), 2 )
names(x) <- letters[1:10]
x
x['a']
x[ c('c','d','j') ]
x[ c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE) ]

letters[ c(TRUE,FALSE) ]

x[ x >= 0.5 ]

## Datafames
my.df <- data.frame( x=1:10, y=rnorm(10), z=rep(c('a','b'), 5) )
my.df

my.df[1:3,]

my.df[ , 1]
my.df[ ,1, drop=FALSE]

my.df[[2]]

my.df$x

new.df <- data.frame( x=1:10, z=rep(c('c','d'), 5) )
rbind(my.df,new.df)