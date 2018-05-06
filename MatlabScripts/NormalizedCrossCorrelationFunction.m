function NormalizedCrossCorrelationFunction()
s=[-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t=[1 1 0];
% disp('Senial:'),disp([1:size(s,2);s]);
% disp('Template:'),disp([1:size(t,2);t]);
posicion=findTemplate1D(t,s);
if posicion==0
    disp('no se encuentra el template en el vector');
else
    disp('la posicion es:'), disp(posicion);
end 
end

function index = findTemplate1D(t,s)
   c=normxcorr2(t,s);
   [maxValue rawindex]=max(c);
   index= rawindex - size(t,2)+1;
end