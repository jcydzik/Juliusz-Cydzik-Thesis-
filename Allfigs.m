%%%%%%%%%%%%%%%%%%%Delay over
%%%%%%%%%%%%%%%%%%%time%%%%%%%%%%%%%%%
t=readtable('delaytimeline.txt');
T=string(t.Var2);
expression = '[0-9][0-9][0-9]*';
[match,noMatch] = regexp(T(1:end),expression,'match','split')
Delay=str2double(string(match));
DS=smooth(Delay);
plot(1:size(t.Var1),DS);
hold on
scatter(1:size(t.Var1),Delay(1:end));
title('Delay period/time')
ylabel('Delay(ms)')
xlabel('Time(days) from 2021-08-27 to 2023-01-11')
saveas(gcf,'delay_time.pdf')
%%%%%%%%%%%%%%%%%%%%accuracy over time%%%%%%%%%%%%%%%%%%%%%%%%
t2=readtable('accuracy.txt');
t2clean=t2;
[row,col] = find(isnan(t2.Var2));t2clean(row,:)=[];
figure(2) 
plot(1:size(t2clean),t2clean.Var2)
title('accuracy/time')
ylabel('accuracy(%)')
xlabel('Time(days) from 2021-08-27 to 2023-01-11')
saveas(gcf,'accuracy.pdf')
%%%%%%%%%%%%%%%%%%%%%%%%combined%%%%%%%%%%%%%%%%%%%%%%
figure(3)
A=plot(1:size(t.Var1),DS);
hold on 
B=scatter(1:size(t.Var1),Delay(1:end));
hold on 
C=plot(1:size(t2clean),t2clean.Var2);
title('accuracy/time')
ylabel('accuracy(%)')
xlabel('Time(days) from 2021-08-27 to 2023-01-11')
saveas(gcf,'draft_combined.pdf')
