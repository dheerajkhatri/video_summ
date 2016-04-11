%how many clusters are good using mean silhoutte coefficient for given data and max value of number of
%clusters to be considered as kmax

function noClusters = compare_clusters(data,kmax)
noClusters = 2;
bestS = 0;

for curClusters = 2:kmax
    clusterResult = kmeans(data,curClusters,'Distance','cityblock');
    curScoeff = silhouette(data,clusterResult);
    meanS = mean(curScoeff);    
    display(meanS);
    if bestS > meanS
        bestS = meanS;
        noClusters = curClusters;
    end
end    