clear all
clc

cam = CentralCamera('focal', 0.015, 'pixel', 10e-6, 'resolution', [1280 1024], 'centre', [640 512], 'name', 'mycamera');
cam.C
P = [0.3, 0.4, 3.0]' %3D point
cam.project(P) %in pixels