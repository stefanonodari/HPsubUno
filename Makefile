CFLAGS = -fPIC -o one.so
SWFLAGS = -python -c++ -I

all: final 

final: a.out one.py  one.so

a.out: one.cpp
	echo “one.cpp compiling…”
	g++ one.cpp
	Chmod +x a.out

one.py: one.i
	echo “swing compiling”
	Swig $(SWFLAGS) one.i

one.so:  one.cpp
	echo “creation library one.so..”
	g++ one.cpp $(CFLAGS) 

clean: 
	echo “removing files created....”
	rm -f a.out one.so one.py one_wrap.cxx
