
all: hilden

parser.c parser.h: parser.y
	bison -d -o parser.c parser.y

lexer.c: lexer.l
	flex -o lexer.c lexer.l

parser.o lexer.o: lexer.c parser.c
	g++ -c lexer.c parser.c

hilden: parser.o lexer.o
	g++ -o output/hilden lexer.o parser.o

clean: *.o *.c *.h
	rm *.o *.c *h