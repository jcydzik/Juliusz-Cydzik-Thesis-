%%%%%%%%%%%%script to make side by side bar plots for 2 different data sets
%%%%%%%%%%%%horizontally%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%all tables%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%use t and t5  to compare each data set%%%%%%%%
%%%%%%%%%%blank out titles and adjust accordingly%%%%
t=readmatrix("18monthtable.txt");
%t=readmatrix("flashperiodtable.txt");
%[row,col]=find(t(:,4) <16);t(row,:)=[];
t2=readmatrix("Rewardtable.txt");
%t5=readmatrix("Rewardtable.txt");
%[row2,col]=find(t2(:,4) <16);t2(row2,:)=[];
t3=readmatrix("flashtable.txt");
t5=readmatrix("flashtable.txt");
%[row3,col]=find(t3(:,4) <16);t3(row3,:)=[];
t4=readmatrix("flashperiodtable.txt");
%[row4,col]=find(t4(:,4) <16);t4(row4,:)=[];
%t5=readmatrix("last4table.txt");
%t5=readmatrix("flashperiodtable.txt");
%%%for flash period do not use filter%%%%%%%%%%%%%
%[row5,col]=find(t5(:,4) <16);t5(row5,:)=[];
t6=readmatrix("Full_table.txt");
[row6,col]=find(t6(:,4) <16);t6(row6,:)=[];
%%%%%%%%%%%%%%jitter%%%%%%%%%%%%%%%%%%%%%%
sums=[sum(t(:,4)) sum(t2(:,4)) sum(t3(:,4)) sum(t4(:,4)) sum(t5(:,4))];
R=[0.96 1.04 ]; 
n=length(t);DD = rand(n,1)*range(R)+min(R);
jit=t(:,1);bd=jit.*DD;
%%%%%%%%%%%%%%
n2=length(t2);DD2 = rand(n2,1)*range(R)+min(R);
jit2=t2(:,1);bd2=jit2.*DD2;
%%%%%%%%%%%%%%%%%%%%%%%%%
n3=length(t3);DD3 = rand(n3,1)*range(R)+min(R);
jit3=t3(:,1);bd3=jit3.*DD3;
%%%%%%%%%%%%%%%%%%%%%
n4=length(t4);DD4 = rand(n4,1)*range(R)+min(R);
jit4=t4(:,1);bd4=jit4.*DD4;
%%%%%%%%%%%%%%%%%%%%
n5=length(t5);DD5 = rand(n5,1)*range(R)+min(R);
jit5=t5(:,1);bd5=jit5.*DD5;
%%%%%%%%%Diamond range params%%%%%%%%%%%%%%%%%%%%%%
Ys=[30 30 30 30 30 30 30 30];
Xs=[1:8];
Yup=[ 70 70 70 70 70 70 70 70];
Xup=[1:8];
%%%%%%%%%%%%%%%right saccade % and n%%%%%%%%%%%%%%
rSac=t(:,2);class=t(:,1); n=t(:,4);
rSac5=t5(:,2),class5=t5(:,1); n5=t5(:,4);
%%%%%%%18 months:two Matrixs one between 25 to 75 other out of%%%%%%%%
%%%%%%%%%%%%%%%%see the sum of modeor @mean,sum,median 
%%%%%%%%%%%%%%%of each class%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
No_M=[];
[A2n,~,ixN] = unique(Initial_no(:,1));
A1n = accumarray(ixN,Initial_no(:,2),[],@mode);
A1 = accumarray(ixN,Initial_no(:,3),[],@mode);
Desired_N = [A1n A2n A1]
[A2y,~,ixY] = unique(Initial_yes(:,1));
A1y = accumarray(ixY,Initial_yes(:,2),[],@mode);
Ay1 = accumarray(ixY,Initial_yes(:,3),[],@mode);
Desired_Y = [A1y A2y Ay1]
[A2nf,~,ixNf] = unique(final_no(:,1));
A1nf = accumarray(ixNf,final_no(:,2),[],@mode);
Anf1 = accumarray(ixNf,final_no(:,3),[],@mode);
Desired_Nf = [A1nf A2nf Anf1]
[A2yf,~,ixYf] = unique(final_yes(:,1));
A1yf = accumarray(ixYf,final_yes(:,2),[],@mode);
Ayf1 = accumarray(ixYf,final_yes(:,3),[],@mode);
Desired_Yf = [A1yf A2yf Ayf1]
%%%%%%%%%%%%%%%%%%%Matrix for each class and condition w/boundary%%%%%%%%%%%%
class1n=Initial_no(Initial_no(:,1)==1,:);class5n=Initial_no(Initial_no(:,1)==5,:);
class2n=Initial_no(Initial_no(:,1)==2,:);class6n=Initial_no(Initial_no(:,1)==6,:);
class3n=Initial_no(Initial_no(:,1)==3,:);class7n=Initial_no(Initial_no(:,1)==7,:);
class4n=Initial_no(Initial_no(:,1)==4,:);class8n=Initial_no(Initial_no(:,1)==8,:);
class1nf=final_no(final_no(:,1)==1,:);class5nf=final_no(final_no(:,1)==5,:);
class2nf=final_no(final_no(:,1)==2,:);class6nf=final_no(final_no(:,1)==6,:);
class3nf=final_no(final_no(:,1)==3,:);class7nf=final_no(final_no(:,1)==7,:);
class4nf=final_no(final_no(:,1)==4,:);class8nf=final_no(final_no(:,1)==8,:);
%%%%%%%Matrix for 18months and last 4%%%%%%%%%%%%%%%%%%
%%%%%%Without boundary for each class%%%%%%%%%%%%%%%%%%%%%%%
class1=t(t(:,1)==1,:);class5=t(t(:,1)==5,:);
class2=t(t(:,1)==2,:);class6=t(t(:,1)==6,:);
class3=t(t(:,1)==3,:);class7=t(t(:,1)==7,:);
class4=t(t(:,1)==4,:);class8=t(t(:,1)==8,:);
%%%%%%%%%%%%%%%
first18=[[mean(class1(:,2)) mean(class1(:,3))];[mean(class2(:,2)) mean(class2(:,3))];
[mean(class3(:,2)) mean(class3(:,3))];[mean(class4(:,2)) mean(class4(:,3))];
[mean(class5(:,2)) mean(class5(:,3))];[mean(class6(:,2)) mean(class6(:,3))];
[mean(class7(:,2)) mean(class7(:,3))];[mean(class8(:,2)) mean(class8(:,3))];];

%%%%%%%%%%%%%%%%%%%%%%%
class1b=t5(t5(:,1)==1,:);class5b=t5(t5(:,1)==5,:);
class2b=t5(t5(:,1)==2,:);class6b=t5(t5(:,1)==6,:);
class3b=t5(t5(:,1)==3,:);class7b=t5(t5(:,1)==7,:);
class4b=t5(t5(:,1)==4,:);class8b=t5(t5(:,1)==8,:);
%%%%%%%%%%%%%%%%%%%%%
last4=[[mean(class1b(:,2)) mean(class1b(:,3))];[mean(class2b(:,2)) mean(class2b(:,3))];
[mean(class3b(:,2)) mean(class3b(:,3))];[mean(class4b(:,2)) mean(class4b(:,3))];
[mean(class5b(:,2)) mean(class5b(:,3))];[mean(class6b(:,2)) mean(class6b(:,3))];
[mean(class7b(:,2)) mean(class7b(:,3))];[mean(class8b(:,2)) mean(class8b(:,3))];];

figure(1)
hold on
a=scatter(bd,rSac,"b","*")
a2= scatter(Xs,Ys,'y',"d",'filled')
a3= scatter(Xup,Yup,'y',"d",'filled')
a4=scatter(bd5,rSac5,"r","*")
distfromzero = rSac>75;
s.AlphaData = distfromzero;
s.MarkerFaceAlpha = 'flat';
xlabel("Target Combinations")
ylabel("Percentages")
yticks([0 50 100])
%%%%%%%%only P-values%%%%%%%%%%%%%%%%%%%%%%%%%
two='-2**-\np=0.0005';
three='-3*-\np=0.05';
xticks([1 2 3 4 5 6 7 8])
title('Initial 18 months(blue) vs Last 4 sessions(red)')
%title('Initial 18 months(blue) vs Bimanual Flash Period task(red)')
%%%%%%%%%
figure(2)
hold on
%subplot(4,2,[1,3])
sgtitle('Saccade Choice Ratio')
subplot(1,2,1)
c=barh([first18(:,1) last4(:,1)])
set(gca,'XDir','reverse')
set(gca, 'YAxisLocation', 'Right')
xlabel("target of righthand")
hold on
subplot(1,2,2)
d=barh([first18(:,2) last4(:,2)])
xlabel("target of lefthand")
legend({'18 months','Bimanaul Apart flash'})
