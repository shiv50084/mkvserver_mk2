all: server
LAV_FLAGS = $(shell pkg-config --libs --cflags libavformat libavcodec libavutil)
# LAV_FLAGS = -L/usr/local/lib -lavcodec -lavformat -lavutil

server: segment.o buffer.o publisher.o server2.c
	gcc -g -Wall $(LAV_FLAGS)  -lpthread -o server segment.o buffer.o publisher.o server2.c

segment.o: segment.c segment.h
	gcc -g -Wall $(LAV_FLAGS) -lpthread -c segment.c

buffer.o: buffer.c buffer.h
	gcc -g -Wall $(LAV_FLAGS) -lpthread -c buffer.c

publisher.o: publisher.c publisher.h
	gcc -g -Wall $(LAV_FLAGS) -lpthread -c publisher.c


clean:
	rm *.o server
