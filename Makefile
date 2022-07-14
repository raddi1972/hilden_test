
all: hilden

parser.c parser.h: parser.y
	bison -d -o parser.c parser.y

lexer.c: lexer.l
	flex -o lexer.c lexer.l

parser.o lexer.o: lexer.c parser.c
	g++ -c lexer.c parser.c

Number.o: Number.cc Number.hh
	g++ -c Number.cc

hilden: parser.o lexer.o Number.o
	g++ -o output/hilden lexer.o parser.o Number.o

clean: *.o *.c *.h
	rm *.o *.c *h