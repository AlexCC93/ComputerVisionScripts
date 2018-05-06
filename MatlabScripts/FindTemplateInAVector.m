function FindTemplateInAVector()
s=[-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t=[0 0 -1];
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
    aux2=0;
    for n=1:size(s,2)
        disp(n)
        if s(n)== t(1)
            aux=n;
            for i=2:size(t,2)
                if t(i)==s(aux+1)
                    aux=aux+1;
                else
                    aux=0;
                    break
                end
            end
            if aux~=0
                aux2=n;
                break
            end
        end
    end
    index=aux2;
end



