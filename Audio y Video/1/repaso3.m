syms a b c; %Definir variable Simbolica
syms f(t) s(x,y) M(j,i); %Definir funciones de cuantos nesecite argumentos
%Ejemplos de Aplicación
%%Definir la formula
f(t) = t^2;
%%Evaluando la Función
disp(f(5))
%%Ahora con mas de una variable
s(x,y)=x+y;
%%Evaluando la función
disp(s(2,3));
%%Las funciones pueden ser expresadas en arreglos matriciales o vectoriales
M(j,i)=[i,j^2;j*i,i+j];
%%Mostrar Matriz
disp(M(3,2))
%%Otra forma de evaluar la función
S = (a^2-a*b-a*c+b^2-b*c+c^2)^(1/2);
%%Una forma de simplificar un polinomio
S=simplify(S);
disp(1/S);
%%Una forma de mostrar la ecuación de una manera agradable
pretty(1/S);
%%Ahora una forma de solucionar polinomios usando el comando solve
syms q
f=q^2-q+6;
solve(f) %%Solve obtiene las raices del polinomio