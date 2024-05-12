clear all
clc

cam = CentralCamera('focal', 0.045, 'pixel', 1e-5, 'resolution', [1920 1080]);

P = [0.2, 1.0, 250.0]'

cam.project(P)