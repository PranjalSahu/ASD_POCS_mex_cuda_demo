%% reconstruction by POCS + BM sparisty
%% a simple demo 
%% 
clc;
clear;
close all;
%% ɨ�輸�β���
load swine_2d.mat;
%%
dwnsmp = 1;
dt = 0.148*dwnsmp;%%̽�������ش�С
sod = 405.9410;
sdd = 906.2510;
%% ͼ�����
%% 
%% �����ؽ�����
n = 512;
view_num = 90;
Nx = n;
Ny = Nx;
Uy = 1537;
d = sod/sdd*dt*Uy;
voxel = d/Nx;
%%
para.nx = Nx;
para.ny = Ny;
para.nz = 1;
para.SO = sod;
para.OD = sdd - sod;
para.vxlsize = voxel;
para.detsize = dt;
para.na = Uy;
para.nb = 1;
%%
t=360/view_num;
theta_vecT=[1:1:(360)]*t;
N_views = length(theta_vecT);
W_c = cell(N_views,1);
sumC_c = cell(N_views,1);
sumR_c = cell(N_views,1);
para.phi_vec = theta_vecT;
%%
P = prjSwine(:,theta_vecT);
%%
[ m, out] = ASD_POCS_cuda(P, para);
figure;imshow(reshape(m,Nx,Ny),[]);


















