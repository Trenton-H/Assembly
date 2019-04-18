SelRepEg01: SelRepEg01.o 
	g++ SelRepEg01.o -o SelRepEg01
SelRepEg01.o: SelRepEg01.cpp 
	g++ -c SelRepEg01.cpp

cleanall:
	@rm SelRepEg01 *.o
test:
	./SelRepEg01 < SelRepEg01.in > SelRepEg01.out	
diff:
	diff SelRepEg01.out SelRepEg01Base.out
