function drawPopulation(Data)
    dim = size(Data, 2);
%     set(gca,'FontName','Times New Roman','FontSize',7,'NextPlot','add','Box','on','View',[0 90],'GridLineStyle','none');
    set(gca,'NextPlot','add','Box','on','View',[0 90],'GridLineStyle','none');
	xlabel('\it f\rm_1');
    ylabel('\it f\rm_2');
    if dim == 2
        varargin = {'o','MarkerSize',3,'Marker','o','Markerfacecolor',[.7 .7 .7],'Markeredgecolor',[.4 .4 .4]};
        plot(Data(:,1),Data(:,2),varargin{:});    
    elseif dim == 3
        varargin = {'o','MarkerSize',3,'Marker','o','Markerfacecolor',[.7 .7 .7],'Markeredgecolor',[.4 .4 .4]};
        plot3(Data(:,1),Data(:,2),Data(:,3),varargin{:});
        view([135 30]);
        zlabel('\it f\rm_3');
    else
        varargin = {'-','Color',[.5 .5 .5],'LineWidth',0.3};
        Label = repmat([0.99,2:size(Data,2)-1,size(Data,2)+0.01],size(Data,1),1);
        Data(2:2:end,:)  = fliplr(Data(2:2:end,:));
        Label(2:2:end,:) = fliplr(Label(2:2:end,:));
        plot(reshape(Label',[],1),reshape(Data',[],1),varargin{:});
        xlabel('Dimension No.');
        ylabel('Value');
    end
    axis('tight');
end

