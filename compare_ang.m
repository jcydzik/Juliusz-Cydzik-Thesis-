D66_T=readtable('outputs/sfiles.txt');%extracting the data of the second row
%D66_T=readtable('outputs/s2621.txt');%
[D66_T,index] = sortrows(D66_T,'class')
D_66=table2array(D66_T);%5=h 6=v
a=size(D_66);%size before filter%%
[row,col]=find(isnan(D_66));D_66(row,:)=[];
sac_length = sqrt(D_66(:,5).^2+D_66(:,6).^2);
%preserves original sac_length%
S=sac_length;
%%visual w/o sac_length filter%%%%%%%%%%%%%%%%%%
h=histogram(sac_length);
xlabel('length(degrees)');ylabel('number of trials');
title('saccade length')
%set(gca,'XLim',[0,100]);
saveas(gcf,'visualize/Original_saclength.pdf')
[row,col]=find(sac_length>=100);D_66(row,:)=[];sac_length(row,:)=[];%36
%[row,col]=find(sac_length<=8);D_66(row,:)=[];sac_length(row,:)=[];
%%visual w/ sac_length filtered%%%%
h2=histogram(sac_length);
a2=size(D_66);
xlabel('length(degrees)');ylabel('number of trials');
title('saccade length')
saveas(gcf,'visualize/saclength.pdf')
%%visual w/o degree filter%%%%%%%%%%%%%%%%%%%%%%
h3=histogram(D_66(:,4));
xlabel('duration(ms)');ylabel('number of trials');
title('Duration');
%set(gca,'XLim',[0,100]);
saveas(gcf,'visualize/Original_duration.pdf')
[row,col]=find(D_66(:,4)>=250);D_66(row,:)=[];%85
%[row,col]=find(D_66(:,4)<=55);D_66(row,:)=[];
%%visual w/ degree filtered%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h4=histogram(D_66(:,4));
ylabel('number of trials');xlabel('duration(ms)');
title('Duration');
saveas(gcf,'visualize/duration.pdf')
%%%%%%%%%%%%%All visuals are saved as a pdf in visualize%%%%%%%%

%%%%%%%%%%%%%%%hits 1 and 2 calculate how close the saccade is to the target%%%%%%%
hits=(D_66(:,16))-D_66(:,17);
hits2=(D_66(:,16))-D_66(:,18);
%%%%%%%%wrap the value 180 degrees to eliminate high degree values close to the target%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hits =wrapTo180(hits);hits=abs(hits);
hits2=wrapTo180(hits2);hits2=abs(hits2);
hitsA=hits;
row=find(hitsA>hits2);hitsA(row,:)=hits2(row,:);
header=["class" "targ angle"  "sac angle" "error" "R_targ(1)/L_targ(0)"];
compare=[D_66(:,3)  D_66(:,17) D_66(:,16) hitsA ];
compare=fix(compare);%???
count_66=compare;%???
compare=[compare ones(size(compare(:,3)))] ;
[row,col]=find(hits>45);
compare(row,5)=0;
compare_T=array2table(compare);
compare_T.Properties.VariableNames=header;
%%%%%%%%%%find 0 or 1s in collumn 5(R_targ(1)/L_targ(0))%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
row=find(compare(:,1)==1);
ToTarg1=size(find(compare(row,5)~=0));Nottarg1=size(find(compare(row,5)~=1));
row2=find(compare(:,1)==2);
ToTarg2=size(find(compare(row2,5)~=0));Nottarg2=size(find(compare(row2,5)~=1));
row3=find(compare(:,1)==3);
ToTarg3=size(find(compare(row3,5)~=0));Nottarg3=size(find(compare(row3,5)~=1));
row4=find(compare(:,1)==4);
ToTarg4=size(find(compare(row4,5)~=0));Nottarg4=size(find(compare(row4,5)~=1));
row5=find(compare(:,1)==5);
ToTarg5=size(find(compare(row5,5)~=0));Nottarg5=size(find(compare(row5,5)~=1));
row6=find(compare(:,1)==6);
ToTarg6=size(find(compare(row6,5)~=0));Nottarg6=size(find(compare(row6,5)~=1));
row7=find(compare(:,1)==7);
ToTarg7=size(find(compare(row7,5)~=0));Nottarg7=size(find(compare(row7,5)~=1));
row8=find(compare(:,1)==8);
ToTarg8=size(find(compare(row8,5)~=0));Nottarg8=size(find(compare(row8,5)~=1));
%%%%%%%%%%%%%%%%%%%rounded percentage of saccades made in each direction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
all_targs=[[round(ToTarg1(1)/(Nottarg1(1)+ToTarg1(1))*100) round(Nottarg1(1)/(Nottarg1(1)+ToTarg1(1))*100)];[round(ToTarg2(1)/(Nottarg2(1)+ToTarg2(1))*100) round(Nottarg2(1)/(Nottarg2(1)+ToTarg2(1))*100)];[round(ToTarg3(1)/(Nottarg3(1)+ToTarg3(1))*100) round(Nottarg3(1)/(Nottarg3(1)+ToTarg3(1))*100)];[round(ToTarg4(1)/(Nottarg4(1)+ToTarg4(1))*100) round(Nottarg4(1)/(Nottarg4(1)+ToTarg4(1))*100)];[round(ToTarg5(1)/(Nottarg5(1)+ToTarg5(1))*100) round(Nottarg5(1)/(Nottarg5(1)+ToTarg5(1))*100)];[round(ToTarg6(1)/(Nottarg6(1)+ToTarg6(1))*100) round(Nottarg6(1)/(Nottarg6(1)+ToTarg6(1))*100)];[round(ToTarg7(1)/(Nottarg7(1)+ToTarg7(1))*100) round(Nottarg7(1)/(Nottarg7(1)+ToTarg7(1))*100)];[round(ToTarg8(1)/(Nottarg8(1)+ToTarg8(1))*100) round(Nottarg8(1)/(Nottarg8(1)+ToTarg8(1))*100)];];

%%%%%%%%%%%%%Uncoment for directional count and change header comment out above%%%%%%%%%%%%%%%%%%%%%%%%%%%
%all_targs=[[ToTarg1(1) Nottarg1(1)];[ToTarg2(1) Nottarg2(1)];[ToTarg3(1) Nottarg3(1)];[ToTarg4(1) Nottarg4(1)];[ToTarg5(1) Nottarg5(1)];[ToTarg6(1) Nottarg6(1)];[ToTarg7(1) Nottarg7(1)];[ToTarg8(1) Nottarg8(1)];];
c=[1 2 3 4 5 6 7 8];
all_targs=[c' all_targs];
all_targs_T=array2table(all_targs);
header=["class" "right%" "left%"];
all_targs_T.Properties.VariableNames=header;
