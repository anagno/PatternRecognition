% This script demonstrates the hierarchical clustering algorithm on a set of
% given data points. 

%Initialize workspace.
clc
clear all

% Load data
X1 = csvread('features_1.csv');
X2 = csvread('features_2.csv');
X3 = csvread('features_3.csv');

% Store both sets of points in a single matrix.
X = [X1;X2;X3];

% Plot the labeded data points
figure('Name','Labeled Data Popints')
hold on
plot(X1(:,1),X1(:,2),'*r','LineWidth',1.4);
plot(X2(:,1),X2(:,2),'*b','LineWidth',1.4);
plot(X3(:,1),X3(:,2),'*g','LineWidth',1.4);
xlabel('x1');
ylabel('x2');
grid on
hold off

%Plot the unlabaled data points.
figure('Name','Unlabeled Data Popints')
hold on
plot(X(:,1),X(:,2),'*k','LineWidth',1.4);
xlabel('x1');
ylabel('x2');
grid on
hold off

% Create the hierarchical clustering dendrogram with euclidean distange
% and average linkage.
Y = pdist(X,'euclidean');
Z = linkage(Y,'average');
figure('Name','Hierarchical Dendrogram (average,euclidean)')
[H,T] = dendrogram(Z,0,'colorthreshold','default');
set(H,'LineWidth',2)

% Cluster data in three clusters.
T = clusterdata(X,'linkage','average','distance','euclidean',3);
figure('Name','Identified Clusters (average,euclidean)')
scatter(X(:,1),X(:,2),20,T,'filled')
grid on

% Create the hierarchical clustering dendrogram with mahalanobis distange
% and average linkage.
Y = pdist(X,'mahalanobis');
Z = linkage(Y,'average');
figure('Name','Hierarchical Dendrogram (average,mahalanobis)')
[H,T] = dendrogram(Z,0,'colorthreshold','default');
set(H,'LineWidth',2)

% Cluster data in three clusters.
T = clusterdata(X,'linkage','average','distance','mahalanobis',3);
figure('Name','Identified Clusters (average,mahalanobis)')
scatter(X(:,1),X(:,2),20,T,'filled')
grid on

% Create the hierarchical clustering dendrogram with cityblock distange
% and average linkage.
Y = pdist(X,'cityblock');
Z = linkage(Y,'average');
figure('Name','Hierarchical Dendrogram (average,cityblock)')
[H,T] = dendrogram(Z,0,'colorthreshold','default');
set(H,'LineWidth',2)

% Cluster data in three clusters.
T = clusterdata(X,'linkage','average','distance','cityblock',3);
figure('Name','Identified Clusters (average,cityblock)')
scatter(X(:,1),X(:,2),20,T,'filled')
grid on

% Create the hierarchical clustering dendrogram with euclidean distange
% and single linkage.
Y = pdist(X,'euclidean');
Z = linkage(Y,'single');
figure('Name','Hierarchical Dendrogram (single,euclidean)')
[H,T] = dendrogram(Z,0,'colorthreshold','default');
set(H,'LineWidth',2)

% Cluster data in three clusters.
T = clusterdata(X,'linkage','single','distance','euclidean',3);
figure('Name','Identified Clusters (single,euclidean)')
scatter(X(:,1),X(:,2),20,T,'filled')
grid on

% Create the hierarchical clustering dendrogram with euclidean distange
% and complete linkage.
Y = pdist(X,'euclidean');
Z = linkage(Y,'complete');
figure('Name','Hierarchical Dendrogram (complete,euclidean)')
[H,T] = dendrogram(Z,0,'colorthreshold','default');
set(H,'LineWidth',2)

% Cluster data in three clusters.
T = clusterdata(X,'linkage','complete','distance','euclidean',3);
figure('Name','Identified Clusters (complete,euclidean)')
scatter(X(:,1),X(:,2),20,T,'filled')
grid on