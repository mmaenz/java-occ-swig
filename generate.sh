mkdir ./output
mkdir ./output/Foundation
echo "Swig'in Foundation"
swig4 -c++ -java -outdir ./output/Foundation -package de.ict.occ.foundation -o ./output/foundation.cpp -I/opt/local/share/swig/4.0.1/java ./src/wrapper/Foundation/Foundation.i
mkdir ./output/DataExchange
echo "Swig'in DataExchange"
swig4 -c++ -java -outdir ./output/DataExchange -package de.ict.occ.dataexchange -o ./output/dataexchange.cpp -I/opt/local/share/swig/4.0.1/java ./src/wrapper/DataExchange/DataExchange.i
mkdir ./output/Modeling
echo "Swig'in Modeling"
swig4 -c++ -java -outdir ./output/Modeling -package de.ict.occ.modeling -o ./output/modeling.cpp -I/opt/local/share/swig/4.0.1/java ./src/wrapper/Modeling/Modeling.i
mkdir ./output/Visualisation
echo "Swig'in Visualisation"
swig4 -c++ -java -outdir ./output/Visualisation -package de.ict.occ.visualisation -o ./output/visualisation.cpp -I/opt/local/share/swig/4.0.1/java ./src/wrapper/Visualisation/Visualisation.i
mkdir ./output/OCAF
echo "Swig'in OCAF"
swig4 -c++ -java -outdir ./output/OCAF -package de.ict.occ.ocaf -o ./output/ocaf.cpp -I/opt/local/share/swig/4.0.1/java ./src/wrapper/OCAF/OCAF.i
mkdir ./output/VTK
echo "Swig'in VTK"
swig4 -c++ -java -outdir ./output/VTK -package de.ict.occ.vtk -o ./output/vtk.cpp -I/opt/local/share/swig/4.0.1/java ./src/wrapper/VTK/VTK.i
cd ./output
echo "Compiling together!"
g++ -c -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include/darwin ./foundation.cpp
g++ -c -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include/darwin ./dataexchange.cpp
g++ -c -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include/darwin ./modeling.cpp
g++ -c -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include/darwin ./visualisation.cpp
g++ -c -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include/darwin ./ocaf.cpp
g++ -c -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/include/darwin ./vtk.cpp
g++ -shared ./foundation.o ./dataexchange.o modeling.o visualisation.o ocaf.o vtk.o -o javaocc.jnilib