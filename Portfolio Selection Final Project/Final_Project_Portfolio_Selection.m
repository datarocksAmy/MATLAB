clc
clear
close all

% <<Input Data of Portfolios: 5 or 4&5 or 3&4&5 stars>>
portselection = menu (' Choose a portfolio by star(s) you prefer < Total # of funds >: ','5 Stars<43>', '5 & 4 Stars<231>','5 & 4 & 3 Stars<559>');
switch portselection

case 1 %'5 Stars<43>'
[num,txt,raw] = xlsread('5star.xlsx','A2:C44');
fivestarret = num;
portname = txt;
return3yr = fivestarret(:,1);
return5yr = fivestarret(:,2);
mean3yr = mean(return3yr);
mean5yr = mean(return5yr);
std3yr = std(return3yr);
std5yr = std(return5yr);

case 2 %'5 & 4 Stars<231>'
[num,txt,raw] = xlsread('5&4star.xlsx','A2:C232');
fivefourstarret = num;
portname = txt;
return3yr = fivefourstarret(:,1);
return5yr = fivefourstarret(:,2);
mean3yr = mean(return3yr);
mean5yr = mean(return5yr);
std3yr = std(return3yr);
std5yr = std(return5yr);

case 3 %'5 & 4 & 3 Stars<559>'
[num,txt,raw] = xlsread('5&4&3star.xlsx','A2:C560');
fivefourthreestarret = num;
portname = txt;
return3yr = fivefourthreestarret(:,1);
return5yr = fivefourthreestarret(:,2);
mean3yr = mean(return3yr);
mean5yr = mean(return5yr);
std3yr = std(return3yr);
std5yr = std(return5yr);

end

%<<Prompt user to Enter Desire Return>>
prompt = {' Enter the minimum desire return (%): '};
title = 'Return Decision';
num_lines = 1;
default = {'0'};
enterdesire = inputdlg(prompt,title,num_lines,default);

if isempty(enterdesire)==0
    while isempty(str2num(cell2mat(enterdesire)))==1;
   
        prompt = {' Invalid input data type. Please Enter a Number: '};
        title = 'Error';
        num_lines = 1;
        default = {'0'};
        enterdesire = inputdlg(prompt,title,num_lines,default);
        
    end
        desireret = str2num(cell2mat(enterdesire));
        
    
else 
    choice = menu('You are closing the program. Do you wish to retry?', 'Yes','No');
    if choice ==2 | choice ==0
        
    else 
        prompt = {' Enter the minimum desire return (%): '};
        title = 'Return Decision';
        num_lines = 1;
        default = {'0'};
        enterdesire = inputdlg(prompt,title,num_lines,default);
        desireret = str2num(cell2mat(enterdesire));
    end
end

%<<Sharpe Ratio & Information Ratio - Calculate through Function Call>>
%Sharpe Ratio 
[sharperatio3yr sharperatio5yr] = sharperatio(mean3yr, mean5yr, std3yr, std5yr);

%Information Ratio
[inforatio3yr inforatio5yr indexret3yr indexret5yr] = inforatio(return3yr, return5yr);


%<<Output-Graph Results>>



%Figure #1 - Benchmark v.s. Chosen Portfolio
figure('name',' Benchmark v.s. Selected Portfolio ');
scatter(return3yr,return5yr, 'b','pentagram')   

hold on

plot([desireret desireret],[0 30],'color',[0.9412 0.4706 0],'linewidth',2)
plot([0 30],[desireret desireret],'color',[0.9412 0.4706 0],'linewidth',2)

scatter(sharperatio3yr,sharperatio5yr,'y','d','Filled','linewidth',1,'MarkerEdgeColor',[0 .5 .5])
text(sharperatio3yr + 0.2, sharperatio5yr + 0.2, 'Sharpe Ratio', 'FontSize', 8)

scatter(inforatio3yr,inforatio5yr,'g','s','Filled','linewidth',1,'MarkerEdgeColor',[0 .5 .5])
text(inforatio3yr - 0.2, inforatio5yr - 0.4, 'Information Ratio', 'FontSize', 8)

scatter(indexret3yr,indexret5yr,'r','s','Filled','linewidth',1,'MarkerEdgeColor',[0 .5 .5])
text(indexret3yr + 0.2, indexret5yr, 'S&P 500','color','r', 'FontSize', 12,'FontWeight','bold')

hold off

xlabel(' 3 Year Return (%) ')
ylabel(' 5 Year Return (%) ')



%Figure #2 - Risk Levels
figure('name','Risk Level Relative to Market')
RL = max((return3yr-sharperatio3yr),(return5yr-sharperatio5yr));
response = RL;
excessret = max((return3yr-indexret3yr),(return5yr-indexret5yr));  %Excess Return, Positive Alpha, below 0 means below the benchmark

nc = 16;
offset = 1;
c = response - max(response);
c = round((nc-1-2*offset)*c/min(c)+1+offset);

scatter3(return5yr, return3yr, excessret, 50, c,'pentagram', 'filled')
 
%view(-34, 14);

hold on

p1 = [0 0 0];
p2 = [30 0 0];
p3 = [30 30 0];
p4 = [0 30 0]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

er = fill3(x, y, z, [252 103 121] ./ 255);

hold off

alpha(er,0.55)

xlabel('5 Year Return (%)');
ylabel('3 Year Return (%)');
zlabel('Excess Return (%)');  %Risk Relative to market

h = colorbar('Location', 'EastOutside', 'YTickLabel',{'Extremely Low', 'Low', 'Medium Low', 'Medium', 'Medium High', 'High', 'Extremely High'});
ylabel(h,' Risk Level ');

uicontrol('Style','pushbutton','String','Zoom In','Position',[20 20 60 20],'Callback','if camva <= 1;return;else;camva(camva-1);end');
uicontrol('Style','pushbutton','String','Zoom Out', 'Position',[100 20 60 20],'Callback','if camva >= 179;return;else;camva(camva+1);end');

view(8,15)
axis vis3d
for i=1:360
   camorbit(5,0,'camera',[0 1 0])
   drawnow
end
 
view(-34, 14);



%Figure #3 - Correlation of Returns and Excess Return
figure('name','Correlation of 3,5 Year Return and Excess Return');
subplot(1,2,1); 
bestfit3 = [excessret return3yr return5yr];
corrbestfit = find(excessret>0);
bestfitname = portname(corrbestfit);
ydata = excessret(corrbestfit);
yString = 'Excess Return';

x1data = return3yr(corrbestfit);
x1String = '3 Year Return';

pPoly = polyfit(x1data, ydata, 1);
linePointsX = [min(x1data) max(x1data)]; 
linePointsY = polyval(pPoly,[min(x1data),max(x1data)]);

tString = ['Funds vs. Correlation of ',x1String,' & ',yString,'(corr= ', num2str(corr(x1data, ydata)) ')'];


hold on
 plot(x1data, ydata, 'p','MarkerEdgeColor',[65 141 46] ./ 255, 'MarkerFaceColor',[66 230 99] ./ 255) % Plot a scatter plot
 plot(linePointsX,linePointsY,'-r','LineWidth', 1) % Plot best fit line
 
 
 for k = 1:length(bestfitname)
    text(x1data(k) + 0.005, ydata(k), bestfitname{k}, 'FontSize', 6);
 end
hold off
 
xlabel(x1String); 
ylabel(yString); 
legend(tString) 


x2data = return5yr(corrbestfit);
x2String = '5 Year Return';
 
pPoly = polyfit(x2data, ydata, 1);
linePointsX = [min(x2data) max(x2data)]; 
linePointsY = polyval(pPoly,[min(x2data),max(x2data)]);

tString = [' Funds vs. Correlation of ',x2String,' & ',yString,'(corr= ', num2str(corr(x2data, ydata)) ')'];



subplot(1,2,2);   
hold on
 plot(x2data, ydata, 'p','MarkerEdgeColor', [45 127 232] ./ 255, 'MarkerFaceColor',[91 208 254] ./ 255) 
 plot(linePointsX,linePointsY,'-r','LineWidth', 1) 
 
 for k = 1:length(bestfitname)
    text(x2data(k) + 0.005, ydata(k), bestfitname{k}, 'FontSize', 6);
 end
hold off
legend(tString)
xlabel(x2String); 
ylabel(yString);



%Export the Best Portfolio Result as Excel file

headers={'Fund Name','3yr Return(%)','5yr Return(%)','Excess Return(%)'};
xlrange1 = 'A1';
xlswrite('BestMatchPortfolios.xlsx',headers,'Sheet1',xlrange1);
result=[bestfitname num2cell(x1data) num2cell(x2data) num2cell(ydata)];
xlrange2 = 'A2';
xlswrite('BestMatchPortfolios.xlsx',result,'Sheet1',xlrange2);


