clear all
clc

cam = CentralCamera('focal', 0.045);

P = [0.2, 1.0, 250.0]'

cam.project(P)*1000