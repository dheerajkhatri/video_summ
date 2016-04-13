%how many clusters are good using mean silhoutte coefficient for given data and max value of number of
%clusters to be considered as kmax


%data: should be in matrix otherwise kmeans can't be applied on cell or any
%other structure
%kmax: maximum number of clusters to be considered

function closestIdx = get_key_frames(data,kmax)


%now for best no. of clusters get the frames which needed to be there in
%the video skim ie: find nearest frames of the centroid

noClusters = 2;
bestS = 0;

for curClusters = 2:kmax
    [idx,c] = kmeans(data,curClusters,'Distance','cityblock');
    curScoeff = silhouette(data,idx);
    meanS = nanmean(curScoeff);    
    display(meanS);
    if bestS < meanS
        bestS = meanS;
        noClusters = curClusters;
        IDX = idx;
        C = c;
    end
end

display(['Best No of Clusters are: ' num2str(noClusters) ' with silhouette coefficient:' num2str(bestS)]);


% iCluster = noCluster;
% CPI = find(IDX==iCluster);
% distances = sum(bsxfun(@minus,X(CPI,:),C(iCluster,:)).^2,2);
% [sorted,indices] = sort(distances);
% CPI(indices);
% data(CPI(1)); %returns nearest point to centroid from data

closestIdx = zeros(1,noClusters);

%for each cluster get the nearest point
for iCluster = 1:noClusters
    %find points which are part of the cluster
    currentPointIdx = find(IDX==iCluster);
    [~,minIdx] = min(sum(bsxfun(@minus,data(currentPointIdx,:),C(iCluster,:)).^2,2));
    closestIdx(iCluster) = currentPointIdx(minIdx);
end