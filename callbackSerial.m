function callbackSerial(ser,~)
global time;
factor = 2; 
val=fscanf(ser);
numval=str2double(val);
time(16)=numval;
time(1)=[];
disp(time);

n = 30; % number of samples
xmax = 2; % amplitude
xmin = -2;
x = xmax*sin(time); % input signal

figure(1)

subplot(2,1,1); % plotting input signal 
plot(time,'linewidth',2,'color','k')
xlabel('Degree of Bending','fontsize',12,'fontweight','bold');
ylabel('Resistance(ohms)','fontsize',12,'fontweight','bold');
title('Input signal','fontsize',14,'fontweight','bold');

subplot(2,1,2); %plotting sampled signal
stem(time,'linewidth',2,'color','b')
xlabel('Degree of Bending','fontsize',12,'fontweight','bold');
ylabel('Resistance(ohms)','fontsize',12,'fontweight','bold');
title('Sampled signal','fontsize',14,'fontweight','bold');

b = 3; % number of bits
l = pow2(b); % number of levels
del = (xmax - (-xmax))/l; % step size
dec_lvl = xmin:del:xmax; % decision level
rep_lvl = xmin-del/2:del:xmax+del/2; %representation level

[index, quantis] = quantiz(x, dec_lvl, rep_lvl); % quantized signal

figure(2)


l1 = length(index); % storing length of index 
for i = 1:l1
    index(i) = index(i)-1;
end
convert = de2bi(index); % converting form decimal to binary
k = 1;
for i = 1:l1
    for j = 1:b
        convert(k) = convert(i,j);
        j = j+1;
        k = k+1;
    end
    i=i+1;
end

subplot(2,1,1);
stem(quantis,'linewidth',2,'color','k')
xlabel('Degree of Bending','fontsize',12,'fontweight','bold');
ylabel('Amplitude','fontsize',12,'fontweight','bold');
title('Quantized signal','fontsize',14,'fontweight','bold');

subplot(2,1,2);
stairs(convert,'linewidth',2,'color','g')
xlabel('Degree of Bending','fontsize',12,'fontweight','bold');
ylabel('Amplitude','fontsize',12,'fontweight','bold');
title('Encoded signal','fontsize',14,'fontweight','bold');
end

%s.BytesAvailableFcn={@callbackSerial};
%fclose
%fopen 