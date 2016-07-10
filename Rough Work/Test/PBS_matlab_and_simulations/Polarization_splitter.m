clear all
close all
paper_size = [8 6];
%Always [w_WG neff_TE neff_TM]
Neffs=sort([0.6 2.6153 1.3222;0.550 2.5857 1.3008;0.500 2.55008 1.25;0.450 2.5074 1.18;0.400 2.4567 1.1576;0.350 2.398 1.1382;0.300 2.3341 1.1192]) %width, TE, TM
t220_box_TE= fopen('t220_box_w0.3-0.6_TE0.txt','r');
t220_box_TM= fopen('t220_box_w0.3-0.6_TM0.txt','r');
    Neffs_t220_box_TE=fscanf(t220_box_TE, '%f %f', [2 inf])';
    Neffs_t220_box_TM=fscanf(t220_box_TM, '%f %f', [2 inf])'; 
        Neffs_t220_box=[Neffs_t220_box_TE Neffs_t220_box_TM(:,2)]
fclose(t220_box_TE);
fclose(t220_box_TM);
t220_nobox_TE= fopen('t220_nobox_w0.3-0.6_TE0.txt','r');
t220_nobox_TM= fopen('t220_nobox_w0.3-0.6_TM0.txt','r');
    Neffs_t220_nobox_TE=fscanf(t220_box_TE, '%f %f', [2 inf])';
    Neffs_t220_nobox_TM=fscanf(t220_box_TM, '%f %f', [2 inf])'; 
        Neffs_t220_nobox=[Neffs_t220_nobox_TE Neffs_t220_nobox_TM(:,2)]
fclose(t220_nobox_TE);
fclose(t220_nobox_TM);
%%
lambda=1550e-9; %m
k0=2*pi/lambda;
R2=20e-6; %um
incrR=0.7e-6; %um
R1=R2-incrR; %um
wg=0.2; %um
w2=0.4; %um
N2=1.1576;
w1=0.4; %um
%R1=R2-(w1/2+wg+w2/2)
N1=N2*R2/R1
opls_TE=2.4567*R2/(2.55*R1)
OPL=[Neffs(:,2).*k0.*R1 Neffs(:,2).*k0.*R2 Neffs(:,3).*k0.*R1 Neffs(:,3).*k0.*R2]
OPL_t220_box=[Neffs_t220_box(:,2).*k0.*R1 Neffs_t220_box(:,2).*k0.*R2 Neffs_t220_box(:,3).*k0.*R1 Neffs_t220_box(:,3).*k0.*R2]
OPL_t220_nobox=[Neffs_t220_nobox(:,2).*k0.*R1 Neffs_t220_nobox(:,2).*k0.*R2 Neffs_t220_nobox(:,3).*k0.*R1 Neffs_t220_nobox(:,3).*k0.*R2]
%%
figure(1)
subplot(2,1,1),plot(Neffs(:,1),OPL(:,1), 'r')
hold on
subplot(2,1,1),plot(Neffs(:,1),OPL(:,2), 'r--')
subplot(2,1,2),plot(Neffs(:,1),OPL(:,3), 'b')
hold on
subplot(2,1,2),plot(Neffs(:,1),OPL(:,4), 'b--')
figure(2)
subplot(2,1,1),plot(Neffs_t220_box(:,1),OPL_t220_box(:,1), 'r')
hold on
subplot(2,1,1),plot(Neffs_t220_box(:,1),OPL_t220_box(:,2), 'r--')
subplot(2,1,2),plot(Neffs_t220_box(:,1),OPL_t220_box(:,3), 'b')
hold on
subplot(2,1,2),plot(Neffs_t220_box(:,1),OPL_t220_box(:,4), 'b--')
figure(3)
subplot(2,1,1),plot(Neffs_t220_nobox(:,1),OPL_t220_nobox(:,1), 'r')
hold on
subplot(2,1,1),plot(Neffs_t220_nobox(:,1),OPL_t220_nobox(:,2), 'r--')
subplot(2,1,2),plot(Neffs_t220_nobox(:,1),OPL_t220_nobox(:,3), 'b')
hold on
subplot(2,1,2),plot(Neffs_t220_nobox(:,1),OPL_t220_nobox(:,4), 'b--')
%%
figure(4)
plot(Neffs(:,1),Neffs(:,2), 'r')
hold on
plot(Neffs(:,1),Neffs(:,3), 'r--')
hold on
plot(Neffs_t220_box(:,1),Neffs_t220_box(:,2), 'b')
hold on
plot(Neffs_t220_box(:,1),Neffs_t220_box(:,3), 'b--')
hold on
plot(Neffs_t220_nobox(:,1),Neffs_t220_nobox(:,2), 'g')
hold on
plot(Neffs_t220_nobox(:,1),Neffs_t220_nobox(:,3), 'g--')