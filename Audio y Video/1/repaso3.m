clc; %Limpiar Pantalla
clear all; %Eliminar Variables del WorkSpace
%%Operaciones Básicas en MATLAB
%%Suma
Resultado=entera+decimal;
%%Resta
Resultado=entera-decimal;
%%Multiplicacion
Resultado=entera*decimal;
%%Division
Resultado=entera/decimal;
%%Para mostrar en el comand Window use el comando disp
disp(Resultado)
%%Operaciones entre Matrices
%%Definimos Dos Matrices
A=[2 1;3 2]
B=[1 4;-1 5]
%%Suma
C=A+B
%%Resta
C=A-B
%%Multiplicación Matrices
C=A*B
%%División (Caso particular de multiplicacion de matrices)
C=A/B
%%Multiplicacion Componente a Componente
C=A.*B
%%Division componente a componente
C=A./B
%%Tamaño de un arreglo 
size(C)
%%Generar Matriz identidad
D=eye(3)
%%Generar Arreglo de unos
D=ones(2,3)
%%Generar Arreglo de Ceros
D=zeros(2,3)
%%Resolver un sistema de ecuaciones lineales usando Gauss Jordan
A=[2 3 4 3;4 5 6 3; 9 3 0 2];
D=rref(A)