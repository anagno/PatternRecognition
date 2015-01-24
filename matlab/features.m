% This script demonstrates the hierarchical clustering algorithm on a set of
% artificially generated data points. Data points are considered to be
% sampled from three different multivariate distributions identified by the
% parameters MU1, MU2, MU3 and SIGMA1, SIGMA2, SIGMA3.

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

% Create the hierarchical clustering dendrogram.
Y = pdist(X,'euclidean');
Z = linkage(Y,'average');
figure('Name','Hierarchical Dendrogram')
[H,T] = dendrogram(Z,0,'colorthreshold','default');
set(H,'LineWidth',2)

% Cluster data in three clusters.
T = clusterdata(X,'linkage','average',3);
figure('Name','Identified Clusters')
scatter(X(:,1),X(:,2),20,T,'filled')
grid on
